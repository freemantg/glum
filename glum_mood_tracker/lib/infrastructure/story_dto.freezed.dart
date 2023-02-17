// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoryDto _$StoryDtoFromJson(Map<String, dynamic> json) {
  return _StoryDto.fromJson(json);
}

/// @nodoc
mixin _$StoryDto {
  int? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get glumRating => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  List<TagDto> get tags => throw _privateConstructorUsedError;
  List<PhotoDto> get photos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryDtoCopyWith<StoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryDtoCopyWith<$Res> {
  factory $StoryDtoCopyWith(StoryDto value, $Res Function(StoryDto) then) =
      _$StoryDtoCopyWithImpl<$Res, StoryDto>;
  @useResult
  $Res call(
      {int? id,
      String title,
      String description,
      int glumRating,
      DateTime date,
      List<TagDto> tags,
      List<PhotoDto> photos});
}

/// @nodoc
class _$StoryDtoCopyWithImpl<$Res, $Val extends StoryDto>
    implements $StoryDtoCopyWith<$Res> {
  _$StoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? description = null,
    Object? glumRating = null,
    Object? date = null,
    Object? tags = null,
    Object? photos = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      glumRating: null == glumRating
          ? _value.glumRating
          : glumRating // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagDto>,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<PhotoDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoryDtoCopyWith<$Res> implements $StoryDtoCopyWith<$Res> {
  factory _$$_StoryDtoCopyWith(
          _$_StoryDto value, $Res Function(_$_StoryDto) then) =
      __$$_StoryDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String title,
      String description,
      int glumRating,
      DateTime date,
      List<TagDto> tags,
      List<PhotoDto> photos});
}

/// @nodoc
class __$$_StoryDtoCopyWithImpl<$Res>
    extends _$StoryDtoCopyWithImpl<$Res, _$_StoryDto>
    implements _$$_StoryDtoCopyWith<$Res> {
  __$$_StoryDtoCopyWithImpl(
      _$_StoryDto _value, $Res Function(_$_StoryDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? description = null,
    Object? glumRating = null,
    Object? date = null,
    Object? tags = null,
    Object? photos = null,
  }) {
    return _then(_$_StoryDto(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      glumRating: null == glumRating
          ? _value.glumRating
          : glumRating // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagDto>,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<PhotoDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoryDto extends _StoryDto {
  const _$_StoryDto(
      {required this.id,
      required this.title,
      required this.description,
      required this.glumRating,
      required this.date,
      required final List<TagDto> tags,
      required final List<PhotoDto> photos})
      : _tags = tags,
        _photos = photos,
        super._();

  factory _$_StoryDto.fromJson(Map<String, dynamic> json) =>
      _$$_StoryDtoFromJson(json);

  @override
  final int? id;
  @override
  final String title;
  @override
  final String description;
  @override
  final int glumRating;
  @override
  final DateTime date;
  final List<TagDto> _tags;
  @override
  List<TagDto> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<PhotoDto> _photos;
  @override
  List<PhotoDto> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  String toString() {
    return 'StoryDto(id: $id, title: $title, description: $description, glumRating: $glumRating, date: $date, tags: $tags, photos: $photos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoryDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.glumRating, glumRating) ||
                other.glumRating == glumRating) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._photos, _photos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      glumRating,
      date,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_photos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoryDtoCopyWith<_$_StoryDto> get copyWith =>
      __$$_StoryDtoCopyWithImpl<_$_StoryDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoryDtoToJson(
      this,
    );
  }
}

abstract class _StoryDto extends StoryDto {
  const factory _StoryDto(
      {required final int? id,
      required final String title,
      required final String description,
      required final int glumRating,
      required final DateTime date,
      required final List<TagDto> tags,
      required final List<PhotoDto> photos}) = _$_StoryDto;
  const _StoryDto._() : super._();

  factory _StoryDto.fromJson(Map<String, dynamic> json) = _$_StoryDto.fromJson;

  @override
  int? get id;
  @override
  String get title;
  @override
  String get description;
  @override
  int get glumRating;
  @override
  DateTime get date;
  @override
  List<TagDto> get tags;
  @override
  List<PhotoDto> get photos;
  @override
  @JsonKey(ignore: true)
  _$$_StoryDtoCopyWith<_$_StoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}
