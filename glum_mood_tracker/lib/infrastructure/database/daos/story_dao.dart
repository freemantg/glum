import 'package:drift/drift.dart';

import '../../dtos/dtos.dart';
import '../drift_database.dart';

part 'story_dao.g.dart';

// Database Accessor class for Stories, Photos, Tags, StoryTags, and StoryPhotos tables
@DriftAccessor(tables: [Stories, Photos, Tags, StoryTags, StoryPhotos])
class StoryDao extends DatabaseAccessor<GlumDatabase> with _$StoryDaoMixin {
  StoryDao(this.db) : super(db);
  final GlumDatabase db;

  // Method for bulk insert and returning ids
  Future<List<int>> _bulkInsertAndReturnIds(
    TableInfo table,
    List<UpdateCompanion> companions,
  ) async {
    final lastRowId = await transaction(() async {
      await batch((batch) {
        batch.insertAll(table, companions);
      });
      final queryRow = await customSelect(
        "SELECT last_insert_rowid()",
        readsFrom: {table},
      ).getSingle();
      return queryRow.data.values.first as int;
    });
    return List.generate(companions.length, (i) => lastRowId - i);
  }

  // Update a story with its tags and photos
  Future<void> updateStoryWithTagsAndPhotos(StoryDto storyDto) async {
    final storyId = storyDto.id;
    if (storyId != null) {
      await deleteStory(storyId);
      await insertStoryWithTagsAndPhotos(storyDto);
    }
  }

  // Insert a new story with its tags and photos
  Future<void> insertStoryWithTagsAndPhotos(StoryDto storyDto) async {
    final storyId = await _insertStory(storyDto);
    await _insertStoryTags(storyId, storyDto.tags);
    await _insertStoryPhotos(storyId, storyDto.photos);
  }

  // Insert a new story into the Stories table
  Future<int> _insertStory(StoryDto storyDto) async {
    final storyCompanion = StoriesCompanion.insert(
      title: storyDto.title,
      description: Value(storyDto.description),
      glumRating: storyDto.glumRating,
      date: storyDto.date,
    );
    return into(stories).insert(storyCompanion);
  }

  // Insert tags for a story into the StoryTags table
  Future<void> _insertStoryTags(int storyId, List<TagDto> tags) async {
    if (tags.isNotEmpty) {
      final storyTagsCompanions = tags
          .map(
            (tag) => StoryTagsCompanion.insert(
              storyId: storyId,
              tagId: tag.id!,
            ),
          )
          .toList();
      await _bulkInsertAndReturnIds(storyTags, storyTagsCompanions);
    }
  }

  // Insert photos for a story into the Photos and StoryPhotos tables
  Future<void> _insertStoryPhotos(int storyId, List<PhotoDto> photoDtos) async {
    if (photoDtos.isNotEmpty) {
      final photoCompanions = photoDtos
          .map((photo) => PhotosCompanion.insert(
                fileName: photo.fileName,
                filePath: photo.filePath,
              ))
          .toList();
      final photoIds = await _bulkInsertAndReturnIds(photos, photoCompanions);
      final storyPhotoCompanions = photoIds
          .map(
            (photoId) => StoryPhotosCompanion.insert(
              storyId: storyId,
              photoId: photoId,
            ),
          )
          .toList();
      await _bulkInsertAndReturnIds(storyPhotos, storyPhotoCompanions);
    }
  }

  // Update a story
  Future<void> updateStory(StoryDto storyDto) async =>
      await update(stories).replace(Story.fromJson(storyDto.toJson()));

  // Stream of stories with their tags and photos by month and year
  Stream<List<StoryDto>> watchStoriesByMonthAndYear(DateTime monthYear) {
    final startDate = DateTime(monthYear.year, monthYear.month, 1);
    final endDate = DateTime(monthYear.year, monthYear.month + 1, 0);

    final query = _buildJoinedQuery()
      ..where(stories.date.isBetweenValues(startDate, endDate))
      ..orderBy([OrderingTerm.desc(stories.date)]);

    return _mapStoriesWithTagsAndPhotosToDtos(query.watch());
  }

  // Build a query for joining stories, tags, and photos
  JoinedSelectStatement _buildJoinedQuery() {
    return select(stories).join(
      [
        leftOuterJoin(storyTags, storyTags.storyId.equalsExp(stories.id)),
        leftOuterJoin(tags, tags.id.equalsExp(storyTags.tagId)),
        leftOuterJoin(storyPhotos, storyPhotos.storyId.equalsExp(stories.id)),
        leftOuterJoin(photos, photos.id.equalsExp(storyPhotos.photoId)),
      ],
    );
  }

  // Map stories with tags and photos to DTOs
  Stream<List<StoryDto>> _mapStoriesWithTagsAndPhotosToDtos(
      Stream<List<TypedResult>> rowsStream) {
    return rowsStream.map((rows) {
      final storiesWithTagsAndPhotos = <StoryWithTagAndPhoto>[];

      for (final row in rows) {
        final story = row.readTable(stories);
        final tag = row.readTableOrNull(tags);
        final photo = row.readTableOrNull(photos);
        final existingStoryWithTagsAndPhotos =
            storiesWithTagsAndPhotos.firstWhere(
          (s) => s.story.id == story.id,
          orElse: () {
            final newStoryWithTagAndPhoto = StoryWithTagAndPhoto(
              story: story,
              tags: [],
              photos: [],
            );
            storiesWithTagsAndPhotos.add(newStoryWithTagAndPhoto);
            return newStoryWithTagAndPhoto;
          },
        );
        if (tag != null) existingStoryWithTagsAndPhotos.tags.add(tag);
        if (photo != null) existingStoryWithTagsAndPhotos.photos.add(photo);
      }

      return storiesWithTagsAndPhotos
          .map(
            (e) => StoryDto(
              id: e.story.id,
              title: e.story.title,
              description: e.story.description,
              glumRating: e.story.glumRating,
              date: e.story.date,
              tags: e.tags
                  .map((tagData) => TagDto.fromJson(tagData.toJson()))
                  .toList(),
              photos: e.photos
                  .map((photoData) => PhotoDto.fromJson(photoData.toJson()))
                  .toList(),
            ),
          )
          .toList();
    });
  }

  // Delete a story and its associated tags and photos
  Future<int> deleteStory(int storyId) async {
    await _deleteStoryTags(storyId);
    await _deleteStoryPhotos(storyId);
    await (delete(stories)..where((tbl) => tbl.id.equals(storyId))).go();
    return storyId;
  }

  // Delete story tags associated with a story
  Future<void> _deleteStoryTags(int storyId) async {
    await (delete(storyTags)..where((tbl) => tbl.storyId.equals(storyId))).go();
  }

  // Delete story photos associated with a story
  Future<void> _deleteStoryPhotos(int storyId) async {
    final photoIds = await _getPhotoIdsForStory(storyId);
    await (delete(storyPhotos)..where((tbl) => tbl.storyId.equals(storyId)))
        .go();
    await (delete(photos)..where((tbl) => tbl.id.isIn(photoIds))).go();
  }

  // Get photo ids associated with a story
  Future<List<int>> _getPhotoIdsForStory(int storyId) async {
    final photoQuery = select(storyPhotos)
      ..where((tbl) => tbl.storyId.equals(storyId));
    return (await photoQuery.get()).map((e) => e.photoId).toList();
  }

  // Count the total number of stories
  Future<int?> countStories() async {
    final storiesCount = stories.id.count();
    final query = selectOnly(stories)..addColumns([storiesCount]);
    final row = await query.getSingle();
    return row.read(storiesCount);
  }

  // Calculate the average glum rating of all stories
  Future<double?> glumAverage() async {
    final avgGlum = stories.glumRating.avg();
    final query = selectOnly(stories)..addColumns([avgGlum]);
    final row = await query.getSingle();
    return row.read(avgGlum);
  }

  // Calculate the distribution of glum ratings
  Future<Map<int, int>> glumDistribution() async {
    //{Glum Rating: Percentage out of 100%}
    final glumDistribution = <int, int>{};
    final storyCount = await countStories();
    if (storyCount != null) {
      for (var i = 1; i <= 5; i++) {
        final count = await _countStoriesWithGlumRating(i);
        glumDistribution[i] = count;
      }
    }
    return glumDistribution;
  }

  // Count stories with a specific glum rating
  Future<int> _countStoriesWithGlumRating(int glumRating) async {
    final glumRatingCount =
        stories.id.count(filter: stories.glumRating.equals(glumRating));
    final query = selectOnly(stories)..addColumns([glumRatingCount]);
    final row = await query.getSingle();
    return row.read(glumRatingCount) ?? 0;
  }

  // Get the average glum rating for the last week
  Future<Map<DateTime, int>> averageWeek() async {
    final averageWeek = <DateTime, int>{};

    final query = _buildAverageWeekQuery();
    final result = await query.get();
    for (var row in result) {
      averageWeek[row.read(stories.date)!] = row.read(stories.glumRating) ?? 0;
    }
    return averageWeek;
  }

  // Build the query for averageWeek()
  JoinedSelectStatement _buildAverageWeekQuery() {
    return selectOnly(stories, distinct: true)
      ..addColumns([stories.date])
      ..addColumns([stories.glumRating])
      ..orderBy([OrderingTerm.desc(stories.date)])
      ..limit(7);
  }

  // Get the glum ratings for the current year
  Future<Map<DateTime, int>> yearInGlums() async {
    final yearInGlums = <DateTime, int>{};
    final query = _buildYearInGlumsQuery();
    final result = await query.get();
    for (var row in result) {
      yearInGlums[row.read(stories.date)!] = row.read(stories.glumRating) ?? 0;
    }
    return yearInGlums;
  }

// Build the query for yearInGlums()
  JoinedSelectStatement _buildYearInGlumsQuery() {
    return selectOnly(stories)
      ..addColumns([stories.date])
      ..addColumns([stories.glumRating])
      ..where(stories.date.year.equalsExp(currentDate.year))
      ..orderBy([OrderingTerm.asc(stories.date)]);
  }
}
