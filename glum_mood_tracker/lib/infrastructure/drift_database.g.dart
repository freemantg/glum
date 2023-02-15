// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class StoryData extends DataClass implements Insertable<StoryData> {
  final int id;
  final String title;
  final String description;
  final int glumRating;
  final DateTime date;
  const StoryData(
      {required this.id,
      required this.title,
      required this.description,
      required this.glumRating,
      required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['glum_rating'] = Variable<int>(glumRating);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  StoriesCompanion toCompanion(bool nullToAbsent) {
    return StoriesCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      glumRating: Value(glumRating),
      date: Value(date),
    );
  }

  factory StoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StoryData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      glumRating: serializer.fromJson<int>(json['glumRating']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'glumRating': serializer.toJson<int>(glumRating),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  StoryData copyWith(
          {int? id,
          String? title,
          String? description,
          int? glumRating,
          DateTime? date}) =>
      StoryData(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        glumRating: glumRating ?? this.glumRating,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('StoryData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('glumRating: $glumRating, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, glumRating, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StoryData &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.glumRating == this.glumRating &&
          other.date == this.date);
}

class StoriesCompanion extends UpdateCompanion<StoryData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<int> glumRating;
  final Value<DateTime> date;
  const StoriesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.glumRating = const Value.absent(),
    this.date = const Value.absent(),
  });
  StoriesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    required int glumRating,
    required DateTime date,
  })  : title = Value(title),
        glumRating = Value(glumRating),
        date = Value(date);
  static Insertable<StoryData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? glumRating,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (glumRating != null) 'glum_rating': glumRating,
      if (date != null) 'date': date,
    });
  }

  StoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? description,
      Value<int>? glumRating,
      Value<DateTime>? date}) {
    return StoriesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      glumRating: glumRating ?? this.glumRating,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (glumRating.present) {
      map['glum_rating'] = Variable<int>(glumRating.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StoriesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('glumRating: $glumRating, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $StoriesTable extends Stories with TableInfo<$StoriesTable, StoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title =
      GeneratedColumn<String>('title', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
            minTextLength: 1,
          ),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _glumRatingMeta =
      const VerificationMeta('glumRating');
  @override
  late final GeneratedColumn<int> glumRating = GeneratedColumn<int>(
      'glum_rating', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, description, glumRating, date];
  @override
  String get aliasedName => _alias ?? 'stories';
  @override
  String get actualTableName => 'stories';
  @override
  VerificationContext validateIntegrity(Insertable<StoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('glum_rating')) {
      context.handle(
          _glumRatingMeta,
          glumRating.isAcceptableOrUnknown(
              data['glum_rating']!, _glumRatingMeta));
    } else if (isInserting) {
      context.missing(_glumRatingMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      glumRating: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}glum_rating'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $StoriesTable createAlias(String alias) {
    return $StoriesTable(attachedDatabase, alias);
  }
}

class TagData extends DataClass implements Insertable<TagData> {
  final int id;
  final String title;
  const TagData({required this.id, required this.title});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    return map;
  }

  TagsCompanion toCompanion(bool nullToAbsent) {
    return TagsCompanion(
      id: Value(id),
      title: Value(title),
    );
  }

  factory TagData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TagData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
    };
  }

  TagData copyWith({int? id, String? title}) => TagData(
        id: id ?? this.id,
        title: title ?? this.title,
      );
  @override
  String toString() {
    return (StringBuffer('TagData(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TagData && other.id == this.id && other.title == this.title);
}

class TagsCompanion extends UpdateCompanion<TagData> {
  final Value<int> id;
  final Value<String> title;
  const TagsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
  });
  TagsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
  }) : title = Value(title);
  static Insertable<TagData> custom({
    Expression<int>? id,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
    });
  }

  TagsCompanion copyWith({Value<int>? id, Value<String>? title}) {
    return TagsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

class $TagsTable extends Tags with TableInfo<$TagsTable, TagData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title =
      GeneratedColumn<String>('title', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
            minTextLength: 1,
          ),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title];
  @override
  String get aliasedName => _alias ?? 'tags';
  @override
  String get actualTableName => 'tags';
  @override
  VerificationContext validateIntegrity(Insertable<TagData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TagData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TagData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
    );
  }

  @override
  $TagsTable createAlias(String alias) {
    return $TagsTable(attachedDatabase, alias);
  }
}

class Photo extends DataClass implements Insertable<Photo> {
  final int id;
  final String fileName;
  final String filePath;
  const Photo(
      {required this.id, required this.fileName, required this.filePath});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['file_name'] = Variable<String>(fileName);
    map['file_path'] = Variable<String>(filePath);
    return map;
  }

  PhotosCompanion toCompanion(bool nullToAbsent) {
    return PhotosCompanion(
      id: Value(id),
      fileName: Value(fileName),
      filePath: Value(filePath),
    );
  }

  factory Photo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Photo(
      id: serializer.fromJson<int>(json['id']),
      fileName: serializer.fromJson<String>(json['fileName']),
      filePath: serializer.fromJson<String>(json['filePath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fileName': serializer.toJson<String>(fileName),
      'filePath': serializer.toJson<String>(filePath),
    };
  }

  Photo copyWith({int? id, String? fileName, String? filePath}) => Photo(
        id: id ?? this.id,
        fileName: fileName ?? this.fileName,
        filePath: filePath ?? this.filePath,
      );
  @override
  String toString() {
    return (StringBuffer('Photo(')
          ..write('id: $id, ')
          ..write('fileName: $fileName, ')
          ..write('filePath: $filePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, fileName, filePath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Photo &&
          other.id == this.id &&
          other.fileName == this.fileName &&
          other.filePath == this.filePath);
}

class PhotosCompanion extends UpdateCompanion<Photo> {
  final Value<int> id;
  final Value<String> fileName;
  final Value<String> filePath;
  const PhotosCompanion({
    this.id = const Value.absent(),
    this.fileName = const Value.absent(),
    this.filePath = const Value.absent(),
  });
  PhotosCompanion.insert({
    this.id = const Value.absent(),
    required String fileName,
    required String filePath,
  })  : fileName = Value(fileName),
        filePath = Value(filePath);
  static Insertable<Photo> custom({
    Expression<int>? id,
    Expression<String>? fileName,
    Expression<String>? filePath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fileName != null) 'file_name': fileName,
      if (filePath != null) 'file_path': filePath,
    });
  }

  PhotosCompanion copyWith(
      {Value<int>? id, Value<String>? fileName, Value<String>? filePath}) {
    return PhotosCompanion(
      id: id ?? this.id,
      fileName: fileName ?? this.fileName,
      filePath: filePath ?? this.filePath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PhotosCompanion(')
          ..write('id: $id, ')
          ..write('fileName: $fileName, ')
          ..write('filePath: $filePath')
          ..write(')'))
        .toString();
  }
}

class $PhotosTable extends Photos with TableInfo<$PhotosTable, Photo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PhotosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _fileNameMeta =
      const VerificationMeta('fileName');
  @override
  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
      'file_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _filePathMeta =
      const VerificationMeta('filePath');
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
      'file_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, fileName, filePath];
  @override
  String get aliasedName => _alias ?? 'photos';
  @override
  String get actualTableName => 'photos';
  @override
  VerificationContext validateIntegrity(Insertable<Photo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('file_name')) {
      context.handle(_fileNameMeta,
          fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta));
    } else if (isInserting) {
      context.missing(_fileNameMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(_filePathMeta,
          filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta));
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Photo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Photo(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      fileName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_name'])!,
      filePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_path'])!,
    );
  }

  @override
  $PhotosTable createAlias(String alias) {
    return $PhotosTable(attachedDatabase, alias);
  }
}

class StoryEntry extends DataClass implements Insertable<StoryEntry> {
  final int story;
  final int photo;
  final int tag;
  const StoryEntry(
      {required this.story, required this.photo, required this.tag});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['story'] = Variable<int>(story);
    map['photo'] = Variable<int>(photo);
    map['tag'] = Variable<int>(tag);
    return map;
  }

  StoryEntriesCompanion toCompanion(bool nullToAbsent) {
    return StoryEntriesCompanion(
      story: Value(story),
      photo: Value(photo),
      tag: Value(tag),
    );
  }

  factory StoryEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StoryEntry(
      story: serializer.fromJson<int>(json['story']),
      photo: serializer.fromJson<int>(json['photo']),
      tag: serializer.fromJson<int>(json['tag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'story': serializer.toJson<int>(story),
      'photo': serializer.toJson<int>(photo),
      'tag': serializer.toJson<int>(tag),
    };
  }

  StoryEntry copyWith({int? story, int? photo, int? tag}) => StoryEntry(
        story: story ?? this.story,
        photo: photo ?? this.photo,
        tag: tag ?? this.tag,
      );
  @override
  String toString() {
    return (StringBuffer('StoryEntry(')
          ..write('story: $story, ')
          ..write('photo: $photo, ')
          ..write('tag: $tag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(story, photo, tag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StoryEntry &&
          other.story == this.story &&
          other.photo == this.photo &&
          other.tag == this.tag);
}

class StoryEntriesCompanion extends UpdateCompanion<StoryEntry> {
  final Value<int> story;
  final Value<int> photo;
  final Value<int> tag;
  const StoryEntriesCompanion({
    this.story = const Value.absent(),
    this.photo = const Value.absent(),
    this.tag = const Value.absent(),
  });
  StoryEntriesCompanion.insert({
    required int story,
    required int photo,
    required int tag,
  })  : story = Value(story),
        photo = Value(photo),
        tag = Value(tag);
  static Insertable<StoryEntry> custom({
    Expression<int>? story,
    Expression<int>? photo,
    Expression<int>? tag,
  }) {
    return RawValuesInsertable({
      if (story != null) 'story': story,
      if (photo != null) 'photo': photo,
      if (tag != null) 'tag': tag,
    });
  }

  StoryEntriesCompanion copyWith(
      {Value<int>? story, Value<int>? photo, Value<int>? tag}) {
    return StoryEntriesCompanion(
      story: story ?? this.story,
      photo: photo ?? this.photo,
      tag: tag ?? this.tag,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (story.present) {
      map['story'] = Variable<int>(story.value);
    }
    if (photo.present) {
      map['photo'] = Variable<int>(photo.value);
    }
    if (tag.present) {
      map['tag'] = Variable<int>(tag.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StoryEntriesCompanion(')
          ..write('story: $story, ')
          ..write('photo: $photo, ')
          ..write('tag: $tag')
          ..write(')'))
        .toString();
  }
}

class $StoryEntriesTable extends StoryEntries
    with TableInfo<$StoryEntriesTable, StoryEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StoryEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _storyMeta = const VerificationMeta('story');
  @override
  late final GeneratedColumn<int> story = GeneratedColumn<int>(
      'story', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES stories (id)'));
  static const VerificationMeta _photoMeta = const VerificationMeta('photo');
  @override
  late final GeneratedColumn<int> photo = GeneratedColumn<int>(
      'photo', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES photos (id)'));
  static const VerificationMeta _tagMeta = const VerificationMeta('tag');
  @override
  late final GeneratedColumn<int> tag = GeneratedColumn<int>(
      'tag', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tags (id)'));
  @override
  List<GeneratedColumn> get $columns => [story, photo, tag];
  @override
  String get aliasedName => _alias ?? 'story_entries';
  @override
  String get actualTableName => 'story_entries';
  @override
  VerificationContext validateIntegrity(Insertable<StoryEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('story')) {
      context.handle(
          _storyMeta, story.isAcceptableOrUnknown(data['story']!, _storyMeta));
    } else if (isInserting) {
      context.missing(_storyMeta);
    }
    if (data.containsKey('photo')) {
      context.handle(
          _photoMeta, photo.isAcceptableOrUnknown(data['photo']!, _photoMeta));
    } else if (isInserting) {
      context.missing(_photoMeta);
    }
    if (data.containsKey('tag')) {
      context.handle(
          _tagMeta, tag.isAcceptableOrUnknown(data['tag']!, _tagMeta));
    } else if (isInserting) {
      context.missing(_tagMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  StoryEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StoryEntry(
      story: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}story'])!,
      photo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}photo'])!,
      tag: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tag'])!,
    );
  }

  @override
  $StoryEntriesTable createAlias(String alias) {
    return $StoryEntriesTable(attachedDatabase, alias);
  }
}

abstract class _$GlumDatabase extends GeneratedDatabase {
  _$GlumDatabase(QueryExecutor e) : super(e);
  late final $StoriesTable stories = $StoriesTable(this);
  late final $TagsTable tags = $TagsTable(this);
  late final $PhotosTable photos = $PhotosTable(this);
  late final $StoryEntriesTable storyEntries = $StoryEntriesTable(this);
  late final StoryDao storyDao = StoryDao(this as GlumDatabase);
  late final TagDao tagDao = TagDao(this as GlumDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [stories, tags, photos, storyEntries];
}

mixin _$StoryDaoMixin on DatabaseAccessor<GlumDatabase> {
  $StoriesTable get stories => attachedDatabase.stories;
  $PhotosTable get photos => attachedDatabase.photos;
  $TagsTable get tags => attachedDatabase.tags;
  $StoryEntriesTable get storyEntries => attachedDatabase.storyEntries;
}
mixin _$TagDaoMixin on DatabaseAccessor<GlumDatabase> {
  $TagsTable get tags => attachedDatabase.tags;
  $StoriesTable get stories => attachedDatabase.stories;
  $PhotosTable get photos => attachedDatabase.photos;
  $StoryEntriesTable get storyEntries => attachedDatabase.storyEntries;
}
mixin _$PhotoDaoMixin on DatabaseAccessor<GlumDatabase> {
  $PhotosTable get photos => attachedDatabase.photos;
  $StoriesTable get stories => attachedDatabase.stories;
  $TagsTable get tags => attachedDatabase.tags;
  $StoryEntriesTable get storyEntries => attachedDatabase.storyEntries;
}
