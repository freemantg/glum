import 'package:drift/drift.dart';

import '../../dtos/dtos.dart';
import '../drift_database.dart';

part 'tag_dao.g.dart';

@DriftAccessor(tables: [Tags, StoryTags])
class TagDao extends DatabaseAccessor<GlumDatabase> with _$TagDaoMixin {
  TagDao(this.db) : super(db);

  final GlumDatabase db;

  // Watch all tags
  Stream<List<TagDto>> watchTags() => select(tags).watch().map(
        (data) => data.map((e) => TagDto.fromJson(e.toJson())).toList(),
      );

  // Watch the trending tags
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

  // Watch tags filtered by moods (true) or glums (false)
  Stream<Map<TagDto, int>> watchTagsFilteredByMoodsOrGlums(bool filterByMoods) {
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

  // Insert a new tag
  Future<void> insertTag(TagDto tag) async {
    final tagCompanion = TagsCompanion.insert(title: tag.title);
    await into(tags).insert(tagCompanion);
  }

  // Delete a tag by its ID
  Future<void> deleteTag(int tagId) async {
    (delete(storyTags)..where((tbl) => tbl.tagId.equals(tagId))).go();
    (delete(tags)..where((tbl) => tbl.id.equals(tagId))).go();
  }
}
