// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'story_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StoryDto {
  StoryData get story => throw _privateConstructorUsedError;
  List<TagData> get tags => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoryDtoCopyWith<StoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryDtoCopyWith<$Res> {
  factory $StoryDtoCopyWith(StoryDto value, $Res Function(StoryDto) then) =
      _$StoryDtoCopyWithImpl<$Res, StoryDto>;
  @useResult
  $Res call({StoryData story, List<TagData> tags});
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
    Object? story = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      story: null == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as StoryData,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagData>,
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
  $Res call({StoryData story, List<TagData> tags});
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
    Object? story = null,
    Object? tags = null,
  }) {
    return _then(_$_StoryDto(
      story: null == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as StoryData,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagData>,
    ));
  }
}

/// @nodoc

class _$_StoryDto extends _StoryDto {
  const _$_StoryDto({required this.story, required final List<TagData> tags})
      : _tags = tags,
        super._();

  @override
  final StoryData story;
  final List<TagData> _tags;
  @override
  List<TagData> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'StoryDto(story: $story, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoryDto &&
            const DeepCollectionEquality().equals(other.story, story) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(story),
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoryDtoCopyWith<_$_StoryDto> get copyWith =>
      __$$_StoryDtoCopyWithImpl<_$_StoryDto>(this, _$identity);
}

abstract class _StoryDto extends StoryDto {
  const factory _StoryDto(
      {required final StoryData story,
      required final List<TagData> tags}) = _$_StoryDto;
  const _StoryDto._() : super._();

  @override
  StoryData get story;
  @override
  List<TagData> get tags;
  @override
  @JsonKey(ignore: true)
  _$$_StoryDtoCopyWith<_$_StoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}