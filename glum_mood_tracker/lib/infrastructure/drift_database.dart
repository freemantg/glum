import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
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

@DriftAccessor(tables: [Stories, Tags, StoryEntries])
class StoryDao extends DatabaseAccessor<GlumDatabase> with _$StoryDaoMixin {
  StoryDao(this.db) : super(db);
  final GlumDatabase db;

  Future<void> writeStoryWithTags(StoryDto entry) {
    return transaction(
      () async {
        final story = entry.story;

        //First, we write the story.
        await into(stories).insert(story, mode: InsertMode.replace);

        //We replace the entries of the story, so first delete the old ones.
        (delete(storyEntries)..where((tbl) => tbl.story.equals(story.id))).go();

        //and write the new ones.
        for (final tag in entry.tags) {
          await into(storyEntries).insert(
            StoryEntry(story: story.id, tag: tag.id),
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

  Stream<List<StoryDto>> watchAllStories() {
    final storyStream = select(stories).watch();

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
        )..where(storyEntries.tag.isIn(ids));

        return tagQuery.watch().map(
          (rows) {
            final idToTags = <int, List<TagData>>{};
            for (final row in rows) {
              final tag = row.readTable(tags);
              final id = row.readTable(storyEntries).tag;

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

  Future<void> updateStory(Insertable<StoryData> story) =>
      update(stories).replace(story);
  Future<void> deleteStory(Insertable<StoryData> story) =>
      delete(stories).delete(story);
}

@DriftAccessor(tables: [Tags])
class TagDao extends DatabaseAccessor<GlumDatabase> with _$TagDaoMixin {
  TagDao(this.db) : super(db);

  final GlumDatabase db;

  Stream<List<TagData>> watchTags() => select(tags).watch();
  Future<void> insertTag(Insertable<TagData> tag) => into(tags).insert(tag);
}
