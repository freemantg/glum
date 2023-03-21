import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../../domain/photo_model.dart';
import '../../domain/story.dart';
import '../../domain/tag.dart';
import 'daos/daos.dart';


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

@DataClassName("Card")
class Cards extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get monthYear => dateTime()();
  IntColumn get colorValue => integer().nullable()();
}

@DataClassName("CardPhoto")
class CardPhotos extends Table {
  IntColumn get cardId => integer().references(Cards, #id)();
  IntColumn get photoId => integer().references(Photos, #id)();
}

@DriftDatabase(
  tables: [
    Stories,
    Tags,
    Photos,
    StoryTags,
    StoryPhotos,
    Cards,
    CardPhotos,
  ],
  daos: [
    StoryDao,
    TagDao,
    PhotoDao,
    CardDao,
  ],
)
class GlumDatabase extends _$GlumDatabase {
  GlumDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 4;

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
