// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TagDto _$TagDtoFromJson(Map<String, dynamic> json) {
  return _TagDto.fromJson(json);
}

/// @nodoc
mixin _$TagDto {
  int? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagDtoCopyWith<TagDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagDtoCopyWith<$Res> {
  factory $TagDtoCopyWith(TagDto value, $Res Function(TagDto) then) =
      _$TagDtoCopyWithImpl<$Res, TagDto>;
  @useResult
  $Res call({int? id, String title});
}

/// @nodoc
class _$TagDtoCopyWithImpl<$Res, $Val extends TagDto>
    implements $TagDtoCopyWith<$Res> {
  _$TagDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TagDtoCopyWith<$Res> implements $TagDtoCopyWith<$Res> {
  factory _$$_TagDtoCopyWith(_$_TagDto value, $Res Function(_$_TagDto) then) =
      __$$_TagDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String title});
}

/// @nodoc
class __$$_TagDtoCopyWithImpl<$Res>
    extends _$TagDtoCopyWithImpl<$Res, _$_TagDto>
    implements _$$_TagDtoCopyWith<$Res> {
  __$$_TagDtoCopyWithImpl(_$_TagDto _value, $Res Function(_$_TagDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
  }) {
    return _then(_$_TagDto(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TagDto extends _TagDto {
  const _$_TagDto({this.id, required this.title}) : super._();

  factory _$_TagDto.fromJson(Map<String, dynamic> json) =>
      _$$_TagDtoFromJson(json);

  @override
  final int? id;
  @override
  final String title;

  @override
  String toString() {
    return 'TagDto(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TagDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TagDtoCopyWith<_$_TagDto> get copyWith =>
      __$$_TagDtoCopyWithImpl<_$_TagDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TagDtoToJson(
      this,
    );
  }
}

abstract class _TagDto extends TagDto {
  const factory _TagDto({final int? id, required final String title}) =
      _$_TagDto;
  const _TagDto._() : super._();

  factory _TagDto.fromJson(Map<String, dynamic> json) = _$_TagDto.fromJson;

  @override
  int? get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_TagDtoCopyWith<_$_TagDto> get copyWith =>
      throw _privateConstructorUsedError;
}
