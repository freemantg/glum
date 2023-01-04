import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:glum_mood_tracker/infrastructure/tag_dto.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:rxdart/rxdart.dart';

import 'story_dto.dart';

part 'drift_database.g.dart';

@DataClassName('StoryData')
class Stories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1)();
  TextColumn get description => text().withDefault(const Constant(''))();
  IntColumn get glumRating => integer()();
  DateTimeColumn get date => dateTime()();
}

@DataClassName('TagData')
class Tags extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1)();
}

@DataClassName('StoryEntry')
class StoryEntries extends Table {
  IntColumn get story => integer().references(Stories, #id)();
  IntColumn get tag => integer().references(Tags, #id)();
}

@DriftDatabase(tables: [Stories, Tags, StoryEntries], daos: [StoryDao, TagDao])
class GlumDatabase extends _$GlumDatabase {
  GlumDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

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

@DriftAccessor(tables: [Stories, StoryEntries])
class StoryDao extends DatabaseAccessor<GlumDatabase> with _$StoryDaoMixin {
  StoryDao(this.db) : super(db);
  final GlumDatabase db;

  Future<void> writeStoryWithTags(StoryDto entry) {
    return transaction(
      () async {
        final story = StoriesCompanion.insert(
          title: entry.story.title,
          description: Value(entry.story.description),
          glumRating: entry.story.glumRating,
          date: entry.story.date,
        );

        //First, we write the story.
        final storyId =
            await into(stories).insert(story, mode: InsertMode.replace);

        //We replace the entries of the story, so first delete the old ones.
        await (delete(storyEntries)..where((tbl) => tbl.story.equals(storyId)))
            .go();

        //and write the new ones.
        for (final tag in entry.tags) {
          await into(storyEntries).insert(
            StoryEntry(
              story: storyId,
              tag: tag.id,
            ),
          );
        }
      },
    );
  }

  Stream<StoryDto> watchStory(int storyId) {
    final storyQuery = select(stories)..where((tbl) => tbl.id.equals(storyId));
    final tagQuery = select(storyEntries).join(
      [
        innerJoin(
          tags,
          tags.id.equalsExp(storyEntries.tag),
        ),
      ],
    )..where(storyEntries.story.equals(storyId));

    final storyStream = storyQuery.watchSingle();
    final tagStream = tagQuery.watch().map(
          (rows) => rows.map((row) => row.readTable(tags)).toList(),
        );

    return Rx.combineLatest2(
      storyStream,
      tagStream,
      (a, b) => StoryDto(story: a, tags: b),
    );
  }

  Stream<List<StoryDto>> watchStoriesByMonthYear(DateTime monthYear) {
    final storyStream = (select(stories)
          ..where(
            (tbl) {
              final date = tbl.date;
              return date.year.equals(monthYear.year) &
                  date.month.equals(monthYear.month);
            },
          ))
        .watch();

    return storyStream.switchMap(
      (stories) {
        final idToStory = {for (var story in stories) story.id: story};
        final ids = idToStory.keys;

        final tagQuery = select(storyEntries).join(
          [
            innerJoin(
              tags,
              tags.id.equalsExp(storyEntries.tag),
            ),
          ],
        )..where(storyEntries.story.isIn(ids));

        return tagQuery.watch().map(
          (rows) {
            final idToTags = <int, List<TagData>>{};
            for (final row in rows) {
              final tag = row.readTable(tags);
              final id = row.readTable(storyEntries).story;

              idToTags.putIfAbsent(id, () => []).add(tag);
            }
            return [
              for (var id in ids)
                StoryDto(
                  story: idToStory[id]!,
                  tags: idToTags[id] ?? [],
                )
            ];
          },
        );
      },
    );
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

  Future<void> updateStory(Insertable<StoryData> story) =>
      update(stories).replace(story);
  Future<void> deleteStory(Insertable<StoryData> story) =>
      delete(stories).delete(story);

  Future<Map<int, double>> glumDistribution() async {
    final glumDistribution = <int, double>{};
    final storyCount = await countStories();
    if (storyCount != null) {
      for (var i = 1; i <= 5; i++) {
        final glumRatingCount =
            stories.id.count(filter: stories.glumRating.equals(i));
        final query = selectOnly(stories)..addColumns([glumRatingCount]);
        final row = await query.getSingle();
        final count = row.read(glumRatingCount);
        if (count != null) {
          glumDistribution[i] = count / storyCount;
        } else {
          glumDistribution[i] = 0;
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
    print(yearInGlums);
    return yearInGlums;
  }
}

@DriftAccessor(tables: [Tags, StoryEntries])
class TagDao extends DatabaseAccessor<GlumDatabase> with _$TagDaoMixin {
  TagDao(this.db) : super(db);

  final GlumDatabase db;

  Stream<List<TagDto>> watchTags() => select(tags).watch().map(
        (data) => data.map((e) => TagDto.FromJson(e.toJson())).toList(),
      );

  Stream<List<TagDto>> watchTrendingTags() {
    final tagsCount = tags.id.count();
    final query = selectOnly(tags).join([
      innerJoin(
        storyEntries,
        storyEntries.tag.equalsExp(tags.id),
      ),
    ]);
    query
      ..addColumns([tagsCount])
      ..addColumns([tags.id])
      ..orderBy([OrderingTerm.desc(tagsCount)]);

    return query.watch().map(
          (rows) => rows
              .map((row) => TagDto.FromJson(row.readTable(tags).toJson()))
              .toList(),
        );
  }

  Future<void> insertTag(TagDto tag) async {
    final tagCompanion = TagsCompanion.insert(title: tag.title);
    await into(tags).insert(tagCompanion);
  }

  Future<void> deleteTag(TagDto tag) async {
    (delete(tags)..where((tbl) => tbl.id.equalsNullable(tag.id))).go();
  }
}
