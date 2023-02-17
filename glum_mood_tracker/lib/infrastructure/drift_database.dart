import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:glum_mood_tracker/infrastructure/photo_dto.dart';
import 'package:glum_mood_tracker/infrastructure/story_dto.dart';
import 'package:glum_mood_tracker/infrastructure/tag_dto.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'drift_database.g.dart';

@DataClassName("Story")
class Stories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1)();
  TextColumn get description => text().withDefault(const Constant(''))();
  IntColumn get glumRating => integer()();
  DateTimeColumn get date => dateTime()();
}

@DataClassName("Tag")
class Tags extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1)();
}

@DataClassName("Photo")
class Photos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fileName => text()();
  TextColumn get filePath => text()();
}

@DataClassName("StoryTag")
class StoryTags extends Table {
  IntColumn get storyId => integer().references(Stories, #id)();
  IntColumn get tagId => integer().references(Tags, #id)();
}

@DataClassName("StoryPhoto")
class StoryPhotos extends Table {
  IntColumn get storyId => integer().references(Stories, #id)();
  IntColumn get photoId => integer().references(Photos, #id)();
}

class StoryWithTagAndPhoto {
  StoryWithTagAndPhoto({
    required this.story,
    required this.tags,
    required this.photos,
  });

  final Story story;
  final List<Tag> tags;
  final List<Photo> photos;
}

@DriftDatabase(
  tables: [Stories, Tags, Photos, StoryTags, StoryPhotos],
  daos: [StoryDao, TagDao, PhotoDao],
)
class GlumDatabase extends _$GlumDatabase {
  GlumDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration =>
      MigrationStrategy(onUpgrade: (m, from, to) async {
        if (from == 1) {
          await m.addColumn(tags, tags.title);
          await m.createTable(tags);
        }
      }, beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      });
}

LazyDatabase _openConnection() {
  return LazyDatabase(
    () async {
      final dbfolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbfolder.path, 'db.sqlite'));
      return NativeDatabase(file);
    },
  );
}

@DriftAccessor(tables: [Photos])
class PhotoDao extends DatabaseAccessor<GlumDatabase> with _$PhotoDaoMixin {
  PhotoDao(this.db) : super(db);
  final GlumDatabase db;

  Future<List<PhotoDto>> getAllPhotos() async {
    final photoData = await select(photos).get();
    return photoData.map((e) => PhotoDto.fromJson(e.toJson())).toList();
  }

  Future<int> insertPhoto(PhotoDto photoDto) async {
    final photo = PhotosCompanion.insert(
      fileName: photoDto.fileName,
      filePath: photoDto.filePath,
    );
    return await into(photos).insert(photo);
  }

  Future<PhotoDto?> getPhotoById(int id) async {
    final query = select(photos)..where((row) => row.id.equals(id));
    final photo = await query.getSingleOrNull();
    if (photo != null) {
      return PhotoDto.fromJson(photo.toJson());
    }
    return null;
  }

  Future<int> deletePhoto(int id) async => deletePhoto(id);
}

@DriftAccessor(tables: [Stories, Photos, Tags, StoryTags, StoryPhotos])
class StoryDao extends DatabaseAccessor<GlumDatabase> with _$StoryDaoMixin {
  StoryDao(this.db) : super(db);
  final GlumDatabase db;

  Future<List<int>> bulkInsertAndReturnIds(
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
      return queryRow
          .data
          .values // [rowId]
          .first as int; // rowId
    });
    return List.generate(companions.length, (i) => lastRowId - i);
  }

  Future<void> insertStoryWithTagsAndPhotos(StoryDto storyDto) async {
    final storyCompanion = StoriesCompanion.insert(
      title: storyDto.title,
      glumRating: storyDto.glumRating,
      date: storyDto.date,
    );

    final storyId = await into(stories).insert(storyCompanion);

    if (storyDto.tags.isNotEmpty) {
      final tagCompanions = storyDto.tags
          .map((e) => TagsCompanion.insert(title: e.title))
          .toList();

      final tagIds = await bulkInsertAndReturnIds(tags, tagCompanions);

      final storyTagsCompanions = tagIds
          .map(
            (tagId) => (StoryTagsCompanion.insert(
              storyId: storyId,
              tagId: tagId,
            )),
          )
          .toList();
      await bulkInsertAndReturnIds(storyTags, storyTagsCompanions);
    }

    if (storyDto.photos.isNotEmpty) {
      final photoCompanions = storyDto.photos
          .map((dto) => PhotosCompanion.insert(
                fileName: dto.fileName,
                filePath: dto.filePath,
              ))
          .toList();
      final photoIds = await bulkInsertAndReturnIds(photos, photoCompanions);
      final storyPhotoCompanions = photoIds
          .map(
            (photoId) => StoryPhotosCompanion.insert(
              storyId: storyId,
              photoId: photoId,
            ),
          )
          .toList();
      await bulkInsertAndReturnIds(storyPhotos, storyPhotoCompanions);
    }
  }

  Stream<List<StoryDto>> watchAllStories() {
    final query = select(stories).join(
      [
        leftOuterJoin(storyTags, storyTags.storyId.equalsExp(stories.id)),
        leftOuterJoin(tags, storyTags.tagId.equalsExp(tags.id)),
        leftOuterJoin(storyPhotos, storyPhotos.storyId.equalsExp(stories.id)),
        leftOuterJoin(photos, photos.id.equalsExp(storyPhotos.storyId)),
      ],
    );

    return query.watch().map(
      (rows) {
        final storiesWithTagsAndPhoto = <StoryWithTagAndPhoto>[];

        for (final row in rows) {
          final story = row.readTable(stories);
          final tag = row.readTable(tags);
          final photo = row.readTable(photos);

          final existingStoryWithTagsAndPhoto =
              storiesWithTagsAndPhoto.firstWhere(
            (s) => s.story.id == story.id,
            orElse: () {
              final newStoryWithTagAndPhoto = StoryWithTagAndPhoto(
                story: story,
                tags: [],
                photos: [],
              );
              storiesWithTagsAndPhoto.add(newStoryWithTagAndPhoto);
              return newStoryWithTagAndPhoto;
            },
          );

          existingStoryWithTagsAndPhoto.tags.add(tag);
          existingStoryWithTagsAndPhoto.photos.add(photo);
        }

        return storiesWithTagsAndPhoto
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
      },
    );
  }

  Stream<List<StoryDto>> watchStoriesByMonthAndYear(DateTime monthYear) {
    final startDate = DateTime(monthYear.year, monthYear.month, 1);
    final endDate = DateTime(monthYear.year, monthYear.month + 1, 0);

    final query = select(stories).join(
      [
        innerJoin(storyTags, storyTags.storyId.equalsExp(stories.id)),
        innerJoin(tags, tags.id.equalsExp(storyTags.tagId)),
        innerJoin(storyPhotos, storyPhotos.storyId.equalsExp(stories.id)),
        innerJoin(photos, photos.id.equalsExp(storyPhotos.photoId))
      ],
    );
    // ..where(stories.date.isBetweenValues(startDate, endDate))
    // ..orderBy([OrderingTerm.asc(stories.date)]);
    return query.watch().map(
      (rows) {
        final storiesWithTagsAndPhoto = <StoryWithTagAndPhoto>[];

        for (final row in rows) {
          final story = row.readTable(stories);
          final tag = row.readTable(tags);
          final photo = row.readTable(photos);

          final existingStoryWithTagsAndPhoto =
              storiesWithTagsAndPhoto.firstWhere(
            (s) => s.story.id == story.id,
            orElse: () {
              final newStoryWithTagAndPhoto = StoryWithTagAndPhoto(
                story: story,
                tags: [],
                photos: [],
              );
              storiesWithTagsAndPhoto.add(newStoryWithTagAndPhoto);
              return newStoryWithTagAndPhoto;
            },
          );
          existingStoryWithTagsAndPhoto.tags.add(tag);
          existingStoryWithTagsAndPhoto.photos.add(photo);
        }

        return storiesWithTagsAndPhoto
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
      },
    );
  }

  Future<int> deleteStory(int storyId) async {
    // First, delete any associated tags and photos from join tables.
    await (delete(storyTags)..where((tbl) => tbl.storyId.equals(storyId))).go();
    await (delete(storyPhotos)..where((tbl) => tbl.storyId.equals(storyId)))
        .go();
    return deleteStory(storyId);
  }

  Future<int?> countStories() async {
    final storiesCount = stories.id.count();
    final query = selectOnly(stories)..addColumns([storiesCount]);
    final row = await query.getSingle();
    return row.read(storiesCount);
  }

  Future<double?> glumAverage() async {
    final avgGlum = stories.glumRating.avg();
    final query = selectOnly(stories)..addColumns([avgGlum]);
    final row = await query.getSingle();
    return row.read(avgGlum);
  }

  // Future<void> updateStory(Insertable<StoryData> story) =>
  //     update(stories).replace(story);

  Future<Map<int, int>> glumDistribution() async {
    //{Glum Rating: Percentage out of 100%}
    final glumDistribution = <int, int>{};
    final storyCount = await countStories();
    if (storyCount != null) {
      for (var i = 1; i <= 5; i++) {
        final glumRatingCount =
            stories.id.count(filter: stories.glumRating.equals(i));
        final query = selectOnly(stories)..addColumns([glumRatingCount]);
        final row = await query.getSingle();
        final count = row.read(glumRatingCount);
        if (count != null) {
          glumDistribution[i] = count;
        }
      }
    }
    return glumDistribution;
  }

  Future<Map<DateTime, int>> averageWeek() async {
    final averageWeek = <DateTime, int>{};

    final query = selectOnly(stories, distinct: true)
      ..addColumns([stories.date])
      ..addColumns([stories.glumRating])
      ..orderBy([OrderingTerm.desc(stories.date)])
      ..limit(7);

    final result = await query.get();
    for (var row in result) {
      averageWeek[row.read(stories.date)!] = row.read(stories.glumRating) ?? 0;
    }
    return averageWeek;
  }

  Future<Map<DateTime, int>> yearInGlums() async {
    final yearInGlums = <DateTime, int>{};
    final query = selectOnly(stories)
      ..addColumns([stories.date])
      ..addColumns([stories.glumRating])
      ..where(stories.date.year.equalsExp(currentDate.year))
      ..orderBy([OrderingTerm.asc(stories.date)]);
    final result = await query.get();
    for (var row in result) {
      yearInGlums[row.read(stories.date)!] = row.read(stories.glumRating) ?? 0;
    }
    return yearInGlums;
  }
}

@DriftAccessor(tables: [Tags, StoryTags])
class TagDao extends DatabaseAccessor<GlumDatabase> with _$TagDaoMixin {
  TagDao(this.db) : super(db);

  final GlumDatabase db;

  Stream<List<TagDto>> watchTags() => select(tags).watch().map(
        (data) => data.map((e) => TagDto.fromJson(e.toJson())).toList(),
      );

  Stream<Map<TagDto, int>> watchTrendingTags() {
    final tagsAndCount = <TagDto, int>{};
    final tagsCount = tags.id.count();
    final query = select(tags).join([
      innerJoin(
        storyTags,
        storyTags.tagId.equalsExp(tags.id),
      ),
    ]);

    query
      ..addColumns([tags.id])
      ..addColumns([tagsCount])
      ..groupBy([tags.id])
      ..orderBy([OrderingTerm.desc(tagsCount)]);

    return query.watch().map(
      (rows) {
        for (var row in rows) {
          final tagDto = TagDto.fromJson(row.readTable(tags).toJson());
          final count = row.read(tagsCount);
          tagsAndCount[tagDto] = count ?? 0;
        }
        return tagsAndCount;
      },
    );
  }

  Stream<Map<TagDto, int>> watchingTagsByMoodsOrGlums(bool filterByMoods) {
    final tagsAndCount = <TagDto, int>{};
    final tagsCount = tags.id.count();
    final query = select(tags).join([
      innerJoin(
        storyTags,
        storyTags.tagId.equalsExp(tags.id),
      ),
      innerJoin(
        stories,
        storyTags.storyId.equalsExp(stories.id),
      )
    ]);
    query
      ..addColumns([tags.id, tagsCount, stories.glumRating])
      ..where(
        filterByMoods
            ? stories.glumRating.isBetweenValues(3, 5)
            : stories.glumRating.isBetweenValues(1, 2),
      )
      ..groupBy([tags.id])
      ..orderBy([OrderingTerm.desc(tagsCount)]);

    return query.watch().map(
      (rows) {
        for (var row in rows) {
          final tagDto = TagDto.fromJson(row.readTable(tags).toJson());
          final count = row.read(tagsCount);
          tagsAndCount[tagDto] = count ?? 0;
        }
        return tagsAndCount;
      },
    );
  }

  Future<void> insertTag(TagDto tag) async {
    final tagCompanion = TagsCompanion.insert(title: tag.title);
    await into(tags).insert(tagCompanion);
  }

  Future<void> deleteTag(int tagId) async => await deleteTag(tagId);
}
