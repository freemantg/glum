// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PhotoDto _$PhotoDtoFromJson(Map<String, dynamic> json) {
  return _PhotoDto.fromJson(json);
}

/// @nodoc
mixin _$PhotoDto {
  String get fileName => throw _privateConstructorUsedError;
  String get filePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhotoDtoCopyWith<PhotoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoDtoCopyWith<$Res> {
  factory $PhotoDtoCopyWith(PhotoDto value, $Res Function(PhotoDto) then) =
      _$PhotoDtoCopyWithImpl<$Res, PhotoDto>;
  @useResult
  $Res call({String fileName, String filePath});
}

/// @nodoc
class _$PhotoDtoCopyWithImpl<$Res, $Val extends PhotoDto>
    implements $PhotoDtoCopyWith<$Res> {
  _$PhotoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? filePath = null,
  }) {
    return _then(_value.copyWith(
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PhotoDtoCopyWith<$Res> implements $PhotoDtoCopyWith<$Res> {
  factory _$$_PhotoDtoCopyWith(
          _$_PhotoDto value, $Res Function(_$_PhotoDto) then) =
      __$$_PhotoDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fileName, String filePath});
}

/// @nodoc
class __$$_PhotoDtoCopyWithImpl<$Res>
    extends _$PhotoDtoCopyWithImpl<$Res, _$_PhotoDto>
    implements _$$_PhotoDtoCopyWith<$Res> {
  __$$_PhotoDtoCopyWithImpl(
      _$_PhotoDto _value, $Res Function(_$_PhotoDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? filePath = null,
  }) {
    return _then(_$_PhotoDto(
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PhotoDto extends _PhotoDto {
  const _$_PhotoDto({required this.fileName, required this.filePath})
      : super._();

  factory _$_PhotoDto.fromJson(Map<String, dynamic> json) =>
      _$$_PhotoDtoFromJson(json);

  @override
  final String fileName;
  @override
  final String filePath;

  @override
  String toString() {
    return 'PhotoDto(fileName: $fileName, filePath: $filePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PhotoDto &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fileName, filePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PhotoDtoCopyWith<_$_PhotoDto> get copyWith =>
      __$$_PhotoDtoCopyWithImpl<_$_PhotoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PhotoDtoToJson(
      this,
    );
  }
}

abstract class _PhotoDto extends PhotoDto {
  const factory _PhotoDto(
      {required final String fileName,
      required final String filePath}) = _$_PhotoDto;
  const _PhotoDto._() : super._();

  factory _PhotoDto.fromJson(Map<String, dynamic> json) = _$_PhotoDto.fromJson;

  @override
  String get fileName;
  @override
  String get filePath;
  @override
  @JsonKey(ignore: true)
  _$$_PhotoDtoCopyWith<_$_PhotoDto> get copyWith =>
      throw _privateConstructorUsedError;
}
