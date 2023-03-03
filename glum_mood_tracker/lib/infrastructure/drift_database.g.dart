// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $StoriesTable extends Stories with TableInfo<$StoriesTable, Story> {
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
  VerificationContext validateIntegrity(Insertable<Story> instance,
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
  Story map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Story(
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

class Story extends DataClass implements Insertable<Story> {
  final int id;
  final String title;
  final String description;
  final int glumRating;
  final DateTime date;
  const Story(
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

  factory Story.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Story(
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

  Story copyWith(
          {int? id,
          String? title,
          String? description,
          int? glumRating,
          DateTime? date}) =>
      Story(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        glumRating: glumRating ?? this.glumRating,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('Story(')
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
      (other is Story &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.glumRating == this.glumRating &&
          other.date == this.date);
}

class StoriesCompanion extends UpdateCompanion<Story> {
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
  static Insertable<Story> custom({
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

class $TagsTable extends Tags with TableInfo<$TagsTable, Tag> {
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
  VerificationContext validateIntegrity(Insertable<Tag> instance,
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
  Tag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tag(
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

class Tag extends DataClass implements Insertable<Tag> {
  final int id;
  final String title;
  const Tag({required this.id, required this.title});
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

  factory Tag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tag(
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

  Tag copyWith({int? id, String? title}) => Tag(
        id: id ?? this.id,
        title: title ?? this.title,
      );
  @override
  String toString() {
    return (StringBuffer('Tag(')
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
      (other is Tag && other.id == this.id && other.title == this.title);
}

class TagsCompanion extends UpdateCompanion<Tag> {
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
  static Insertable<Tag> custom({
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

class $StoryTagsTable extends StoryTags
    with TableInfo<$StoryTagsTable, StoryTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StoryTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _storyIdMeta =
      const VerificationMeta('storyId');
  @override
  late final GeneratedColumn<int> storyId = GeneratedColumn<int>(
      'story_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES stories (id)'));
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<int> tagId = GeneratedColumn<int>(
      'tag_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tags (id)'));
  @override
  List<GeneratedColumn> get $columns => [storyId, tagId];
  @override
  String get aliasedName => _alias ?? 'story_tags';
  @override
  String get actualTableName => 'story_tags';
  @override
  VerificationContext validateIntegrity(Insertable<StoryTag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('story_id')) {
      context.handle(_storyIdMeta,
          storyId.isAcceptableOrUnknown(data['story_id']!, _storyIdMeta));
    } else if (isInserting) {
      context.missing(_storyIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
          _tagIdMeta, tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta));
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  StoryTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StoryTag(
      storyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}story_id'])!,
      tagId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tag_id'])!,
    );
  }

  @override
  $StoryTagsTable createAlias(String alias) {
    return $StoryTagsTable(attachedDatabase, alias);
  }
}

class StoryTag extends DataClass implements Insertable<StoryTag> {
  final int storyId;
  final int tagId;
  const StoryTag({required this.storyId, required this.tagId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['story_id'] = Variable<int>(storyId);
    map['tag_id'] = Variable<int>(tagId);
    return map;
  }

  StoryTagsCompanion toCompanion(bool nullToAbsent) {
    return StoryTagsCompanion(
      storyId: Value(storyId),
      tagId: Value(tagId),
    );
  }

  factory StoryTag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StoryTag(
      storyId: serializer.fromJson<int>(json['storyId']),
      tagId: serializer.fromJson<int>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'storyId': serializer.toJson<int>(storyId),
      'tagId': serializer.toJson<int>(tagId),
    };
  }

  StoryTag copyWith({int? storyId, int? tagId}) => StoryTag(
        storyId: storyId ?? this.storyId,
        tagId: tagId ?? this.tagId,
      );
  @override
  String toString() {
    return (StringBuffer('StoryTag(')
          ..write('storyId: $storyId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(storyId, tagId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StoryTag &&
          other.storyId == this.storyId &&
          other.tagId == this.tagId);
}

class StoryTagsCompanion extends UpdateCompanion<StoryTag> {
  final Value<int> storyId;
  final Value<int> tagId;
  const StoryTagsCompanion({
    this.storyId = const Value.absent(),
    this.tagId = const Value.absent(),
  });
  StoryTagsCompanion.insert({
    required int storyId,
    required int tagId,
  })  : storyId = Value(storyId),
        tagId = Value(tagId);
  static Insertable<StoryTag> custom({
    Expression<int>? storyId,
    Expression<int>? tagId,
  }) {
    return RawValuesInsertable({
      if (storyId != null) 'story_id': storyId,
      if (tagId != null) 'tag_id': tagId,
    });
  }

  StoryTagsCompanion copyWith({Value<int>? storyId, Value<int>? tagId}) {
    return StoryTagsCompanion(
      storyId: storyId ?? this.storyId,
      tagId: tagId ?? this.tagId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (storyId.present) {
      map['story_id'] = Variable<int>(storyId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<int>(tagId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StoryTagsCompanion(')
          ..write('storyId: $storyId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }
}

class $StoryPhotosTable extends StoryPhotos
    with TableInfo<$StoryPhotosTable, StoryPhoto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StoryPhotosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _storyIdMeta =
      const VerificationMeta('storyId');
  @override
  late final GeneratedColumn<int> storyId = GeneratedColumn<int>(
      'story_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES stories (id)'));
  static const VerificationMeta _photoIdMeta =
      const VerificationMeta('photoId');
  @override
  late final GeneratedColumn<int> photoId = GeneratedColumn<int>(
      'photo_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES photos (id)'));
  @override
  List<GeneratedColumn> get $columns => [storyId, photoId];
  @override
  String get aliasedName => _alias ?? 'story_photos';
  @override
  String get actualTableName => 'story_photos';
  @override
  VerificationContext validateIntegrity(Insertable<StoryPhoto> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('story_id')) {
      context.handle(_storyIdMeta,
          storyId.isAcceptableOrUnknown(data['story_id']!, _storyIdMeta));
    } else if (isInserting) {
      context.missing(_storyIdMeta);
    }
    if (data.containsKey('photo_id')) {
      context.handle(_photoIdMeta,
          photoId.isAcceptableOrUnknown(data['photo_id']!, _photoIdMeta));
    } else if (isInserting) {
      context.missing(_photoIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  StoryPhoto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StoryPhoto(
      storyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}story_id'])!,
      photoId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}photo_id'])!,
    );
  }

  @override
  $StoryPhotosTable createAlias(String alias) {
    return $StoryPhotosTable(attachedDatabase, alias);
  }
}

class StoryPhoto extends DataClass implements Insertable<StoryPhoto> {
  final int storyId;
  final int photoId;
  const StoryPhoto({required this.storyId, required this.photoId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['story_id'] = Variable<int>(storyId);
    map['photo_id'] = Variable<int>(photoId);
    return map;
  }

  StoryPhotosCompanion toCompanion(bool nullToAbsent) {
    return StoryPhotosCompanion(
      storyId: Value(storyId),
      photoId: Value(photoId),
    );
  }

  factory StoryPhoto.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StoryPhoto(
      storyId: serializer.fromJson<int>(json['storyId']),
      photoId: serializer.fromJson<int>(json['photoId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'storyId': serializer.toJson<int>(storyId),
      'photoId': serializer.toJson<int>(photoId),
    };
  }

  StoryPhoto copyWith({int? storyId, int? photoId}) => StoryPhoto(
        storyId: storyId ?? this.storyId,
        photoId: photoId ?? this.photoId,
      );
  @override
  String toString() {
    return (StringBuffer('StoryPhoto(')
          ..write('storyId: $storyId, ')
          ..write('photoId: $photoId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(storyId, photoId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StoryPhoto &&
          other.storyId == this.storyId &&
          other.photoId == this.photoId);
}

class StoryPhotosCompanion extends UpdateCompanion<StoryPhoto> {
  final Value<int> storyId;
  final Value<int> photoId;
  const StoryPhotosCompanion({
    this.storyId = const Value.absent(),
    this.photoId = const Value.absent(),
  });
  StoryPhotosCompanion.insert({
    required int storyId,
    required int photoId,
  })  : storyId = Value(storyId),
        photoId = Value(photoId);
  static Insertable<StoryPhoto> custom({
    Expression<int>? storyId,
    Expression<int>? photoId,
  }) {
    return RawValuesInsertable({
      if (storyId != null) 'story_id': storyId,
      if (photoId != null) 'photo_id': photoId,
    });
  }

  StoryPhotosCompanion copyWith({Value<int>? storyId, Value<int>? photoId}) {
    return StoryPhotosCompanion(
      storyId: storyId ?? this.storyId,
      photoId: photoId ?? this.photoId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (storyId.present) {
      map['story_id'] = Variable<int>(storyId.value);
    }
    if (photoId.present) {
      map['photo_id'] = Variable<int>(photoId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StoryPhotosCompanion(')
          ..write('storyId: $storyId, ')
          ..write('photoId: $photoId')
          ..write(')'))
        .toString();
  }
}

class $CardsTable extends Cards with TableInfo<$CardsTable, Card> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _monthYearMeta =
      const VerificationMeta('monthYear');
  @override
  late final GeneratedColumn<DateTime> monthYear = GeneratedColumn<DateTime>(
      'month_year', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _colorValueMeta =
      const VerificationMeta('colorValue');
  @override
  late final GeneratedColumn<int> colorValue = GeneratedColumn<int>(
      'color_value', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, monthYear, colorValue];
  @override
  String get aliasedName => _alias ?? 'cards';
  @override
  String get actualTableName => 'cards';
  @override
  VerificationContext validateIntegrity(Insertable<Card> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('month_year')) {
      context.handle(_monthYearMeta,
          monthYear.isAcceptableOrUnknown(data['month_year']!, _monthYearMeta));
    } else if (isInserting) {
      context.missing(_monthYearMeta);
    }
    if (data.containsKey('color_value')) {
      context.handle(
          _colorValueMeta,
          colorValue.isAcceptableOrUnknown(
              data['color_value']!, _colorValueMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Card map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Card(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      monthYear: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}month_year'])!,
      colorValue: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color_value']),
    );
  }

  @override
  $CardsTable createAlias(String alias) {
    return $CardsTable(attachedDatabase, alias);
  }
}

class Card extends DataClass implements Insertable<Card> {
  final int id;
  final DateTime monthYear;
  final int? colorValue;
  const Card({required this.id, required this.monthYear, this.colorValue});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['month_year'] = Variable<DateTime>(monthYear);
    if (!nullToAbsent || colorValue != null) {
      map['color_value'] = Variable<int>(colorValue);
    }
    return map;
  }

  CardsCompanion toCompanion(bool nullToAbsent) {
    return CardsCompanion(
      id: Value(id),
      monthYear: Value(monthYear),
      colorValue: colorValue == null && nullToAbsent
          ? const Value.absent()
          : Value(colorValue),
    );
  }

  factory Card.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Card(
      id: serializer.fromJson<int>(json['id']),
      monthYear: serializer.fromJson<DateTime>(json['monthYear']),
      colorValue: serializer.fromJson<int?>(json['colorValue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'monthYear': serializer.toJson<DateTime>(monthYear),
      'colorValue': serializer.toJson<int?>(colorValue),
    };
  }

  Card copyWith(
          {int? id,
          DateTime? monthYear,
          Value<int?> colorValue = const Value.absent()}) =>
      Card(
        id: id ?? this.id,
        monthYear: monthYear ?? this.monthYear,
        colorValue: colorValue.present ? colorValue.value : this.colorValue,
      );
  @override
  String toString() {
    return (StringBuffer('Card(')
          ..write('id: $id, ')
          ..write('monthYear: $monthYear, ')
          ..write('colorValue: $colorValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, monthYear, colorValue);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Card &&
          other.id == this.id &&
          other.monthYear == this.monthYear &&
          other.colorValue == this.colorValue);
}

class CardsCompanion extends UpdateCompanion<Card> {
  final Value<int> id;
  final Value<DateTime> monthYear;
  final Value<int?> colorValue;
  const CardsCompanion({
    this.id = const Value.absent(),
    this.monthYear = const Value.absent(),
    this.colorValue = const Value.absent(),
  });
  CardsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime monthYear,
    this.colorValue = const Value.absent(),
  }) : monthYear = Value(monthYear);
  static Insertable<Card> custom({
    Expression<int>? id,
    Expression<DateTime>? monthYear,
    Expression<int>? colorValue,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (monthYear != null) 'month_year': monthYear,
      if (colorValue != null) 'color_value': colorValue,
    });
  }

  CardsCompanion copyWith(
      {Value<int>? id, Value<DateTime>? monthYear, Value<int?>? colorValue}) {
    return CardsCompanion(
      id: id ?? this.id,
      monthYear: monthYear ?? this.monthYear,
      colorValue: colorValue ?? this.colorValue,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (monthYear.present) {
      map['month_year'] = Variable<DateTime>(monthYear.value);
    }
    if (colorValue.present) {
      map['color_value'] = Variable<int>(colorValue.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardsCompanion(')
          ..write('id: $id, ')
          ..write('monthYear: $monthYear, ')
          ..write('colorValue: $colorValue')
          ..write(')'))
        .toString();
  }
}

class $CardPhotosTable extends CardPhotos
    with TableInfo<$CardPhotosTable, CardPhoto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CardPhotosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cardIdMeta = const VerificationMeta('cardId');
  @override
  late final GeneratedColumn<int> cardId = GeneratedColumn<int>(
      'card_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES cards (id)'));
  static const VerificationMeta _photoIdMeta =
      const VerificationMeta('photoId');
  @override
  late final GeneratedColumn<int> photoId = GeneratedColumn<int>(
      'photo_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES photos (id)'));
  @override
  List<GeneratedColumn> get $columns => [cardId, photoId];
  @override
  String get aliasedName => _alias ?? 'card_photos';
  @override
  String get actualTableName => 'card_photos';
  @override
  VerificationContext validateIntegrity(Insertable<CardPhoto> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('card_id')) {
      context.handle(_cardIdMeta,
          cardId.isAcceptableOrUnknown(data['card_id']!, _cardIdMeta));
    } else if (isInserting) {
      context.missing(_cardIdMeta);
    }
    if (data.containsKey('photo_id')) {
      context.handle(_photoIdMeta,
          photoId.isAcceptableOrUnknown(data['photo_id']!, _photoIdMeta));
    } else if (isInserting) {
      context.missing(_photoIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CardPhoto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CardPhoto(
      cardId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}card_id'])!,
      photoId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}photo_id'])!,
    );
  }

  @override
  $CardPhotosTable createAlias(String alias) {
    return $CardPhotosTable(attachedDatabase, alias);
  }
}

class CardPhoto extends DataClass implements Insertable<CardPhoto> {
  final int cardId;
  final int photoId;
  const CardPhoto({required this.cardId, required this.photoId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['card_id'] = Variable<int>(cardId);
    map['photo_id'] = Variable<int>(photoId);
    return map;
  }

  CardPhotosCompanion toCompanion(bool nullToAbsent) {
    return CardPhotosCompanion(
      cardId: Value(cardId),
      photoId: Value(photoId),
    );
  }

  factory CardPhoto.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CardPhoto(
      cardId: serializer.fromJson<int>(json['cardId']),
      photoId: serializer.fromJson<int>(json['photoId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cardId': serializer.toJson<int>(cardId),
      'photoId': serializer.toJson<int>(photoId),
    };
  }

  CardPhoto copyWith({int? cardId, int? photoId}) => CardPhoto(
        cardId: cardId ?? this.cardId,
        photoId: photoId ?? this.photoId,
      );
  @override
  String toString() {
    return (StringBuffer('CardPhoto(')
          ..write('cardId: $cardId, ')
          ..write('photoId: $photoId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(cardId, photoId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CardPhoto &&
          other.cardId == this.cardId &&
          other.photoId == this.photoId);
}

class CardPhotosCompanion extends UpdateCompanion<CardPhoto> {
  final Value<int> cardId;
  final Value<int> photoId;
  const CardPhotosCompanion({
    this.cardId = const Value.absent(),
    this.photoId = const Value.absent(),
  });
  CardPhotosCompanion.insert({
    required int cardId,
    required int photoId,
  })  : cardId = Value(cardId),
        photoId = Value(photoId);
  static Insertable<CardPhoto> custom({
    Expression<int>? cardId,
    Expression<int>? photoId,
  }) {
    return RawValuesInsertable({
      if (cardId != null) 'card_id': cardId,
      if (photoId != null) 'photo_id': photoId,
    });
  }

  CardPhotosCompanion copyWith({Value<int>? cardId, Value<int>? photoId}) {
    return CardPhotosCompanion(
      cardId: cardId ?? this.cardId,
      photoId: photoId ?? this.photoId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cardId.present) {
      map['card_id'] = Variable<int>(cardId.value);
    }
    if (photoId.present) {
      map['photo_id'] = Variable<int>(photoId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardPhotosCompanion(')
          ..write('cardId: $cardId, ')
          ..write('photoId: $photoId')
          ..write(')'))
        .toString();
  }
}

abstract class _$GlumDatabase extends GeneratedDatabase {
  _$GlumDatabase(QueryExecutor e) : super(e);
  late final $StoriesTable stories = $StoriesTable(this);
  late final $TagsTable tags = $TagsTable(this);
  late final $PhotosTable photos = $PhotosTable(this);
  late final $StoryTagsTable storyTags = $StoryTagsTable(this);
  late final $StoryPhotosTable storyPhotos = $StoryPhotosTable(this);
  late final $CardsTable cards = $CardsTable(this);
  late final $CardPhotosTable cardPhotos = $CardPhotosTable(this);
  late final StoryDao storyDao = StoryDao(this as GlumDatabase);
  late final TagDao tagDao = TagDao(this as GlumDatabase);
  late final PhotoDao photoDao = PhotoDao(this as GlumDatabase);
  late final CardDao cardDao = CardDao(this as GlumDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [stories, tags, photos, storyTags, storyPhotos, cards, cardPhotos];
}

mixin _$StoryDaoMixin on DatabaseAccessor<GlumDatabase> {
  $StoriesTable get stories => attachedDatabase.stories;
  $PhotosTable get photos => attachedDatabase.photos;
  $TagsTable get tags => attachedDatabase.tags;
  $StoryTagsTable get storyTags => attachedDatabase.storyTags;
  $StoryPhotosTable get storyPhotos => attachedDatabase.storyPhotos;
}
mixin _$TagDaoMixin on DatabaseAccessor<GlumDatabase> {
  $TagsTable get tags => attachedDatabase.tags;
  $StoriesTable get stories => attachedDatabase.stories;
  $StoryTagsTable get storyTags => attachedDatabase.storyTags;
}
mixin _$PhotoDaoMixin on DatabaseAccessor<GlumDatabase> {
  $PhotosTable get photos => attachedDatabase.photos;
}
mixin _$CardDaoMixin on DatabaseAccessor<GlumDatabase> {
  $CardsTable get cards => attachedDatabase.cards;
  $PhotosTable get photos => attachedDatabase.photos;
  $CardPhotosTable get cardPhotos => attachedDatabase.cardPhotos;
}
