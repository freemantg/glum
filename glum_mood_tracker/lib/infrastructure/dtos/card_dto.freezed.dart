// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CardDto _$CardDtoFromJson(Map<String, dynamic> json) {
  return _CardDto.fromJson(json);
}

/// @nodoc
mixin _$CardDto {
  int? get id => throw _privateConstructorUsedError;
  DateTime get monthYear => throw _privateConstructorUsedError;
  int? get colorValue => throw _privateConstructorUsedError;
  PhotoDto? get photo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardDtoCopyWith<CardDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardDtoCopyWith<$Res> {
  factory $CardDtoCopyWith(CardDto value, $Res Function(CardDto) then) =
      _$CardDtoCopyWithImpl<$Res, CardDto>;
  @useResult
  $Res call({int? id, DateTime monthYear, int? colorValue, PhotoDto? photo});

  $PhotoDtoCopyWith<$Res>? get photo;
}

/// @nodoc
class _$CardDtoCopyWithImpl<$Res, $Val extends CardDto>
    implements $CardDtoCopyWith<$Res> {
  _$CardDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? monthYear = null,
    Object? colorValue = freezed,
    Object? photo = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      monthYear: null == monthYear
          ? _value.monthYear
          : monthYear // ignore: cast_nullable_to_non_nullable
              as DateTime,
      colorValue: freezed == colorValue
          ? _value.colorValue
          : colorValue // ignore: cast_nullable_to_non_nullable
              as int?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as PhotoDto?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PhotoDtoCopyWith<$Res>? get photo {
    if (_value.photo == null) {
      return null;
    }

    return $PhotoDtoCopyWith<$Res>(_value.photo!, (value) {
      return _then(_value.copyWith(photo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CardDtoCopyWith<$Res> implements $CardDtoCopyWith<$Res> {
  factory _$$_CardDtoCopyWith(
          _$_CardDto value, $Res Function(_$_CardDto) then) =
      __$$_CardDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, DateTime monthYear, int? colorValue, PhotoDto? photo});

  @override
  $PhotoDtoCopyWith<$Res>? get photo;
}

/// @nodoc
class __$$_CardDtoCopyWithImpl<$Res>
    extends _$CardDtoCopyWithImpl<$Res, _$_CardDto>
    implements _$$_CardDtoCopyWith<$Res> {
  __$$_CardDtoCopyWithImpl(_$_CardDto _value, $Res Function(_$_CardDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? monthYear = null,
    Object? colorValue = freezed,
    Object? photo = freezed,
  }) {
    return _then(_$_CardDto(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      monthYear: null == monthYear
          ? _value.monthYear
          : monthYear // ignore: cast_nullable_to_non_nullable
              as DateTime,
      colorValue: freezed == colorValue
          ? _value.colorValue
          : colorValue // ignore: cast_nullable_to_non_nullable
              as int?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as PhotoDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CardDto extends _CardDto {
  const _$_CardDto(
      {this.id, required this.monthYear, this.colorValue, this.photo})
      : super._();

  factory _$_CardDto.fromJson(Map<String, dynamic> json) =>
      _$$_CardDtoFromJson(json);

  @override
  final int? id;
  @override
  final DateTime monthYear;
  @override
  final int? colorValue;
  @override
  final PhotoDto? photo;

  @override
  String toString() {
    return 'CardDto(id: $id, monthYear: $monthYear, colorValue: $colorValue, photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.monthYear, monthYear) ||
                other.monthYear == monthYear) &&
            (identical(other.colorValue, colorValue) ||
                other.colorValue == colorValue) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, monthYear, colorValue, photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardDtoCopyWith<_$_CardDto> get copyWith =>
      __$$_CardDtoCopyWithImpl<_$_CardDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CardDtoToJson(
      this,
    );
  }
}

abstract class _CardDto extends CardDto {
  const factory _CardDto(
      {final int? id,
      required final DateTime monthYear,
      final int? colorValue,
      final PhotoDto? photo}) = _$_CardDto;
  const _CardDto._() : super._();

  factory _CardDto.fromJson(Map<String, dynamic> json) = _$_CardDto.fromJson;

  @override
  int? get id;
  @override
  DateTime get monthYear;
  @override
  int? get colorValue;
  @override
  PhotoDto? get photo;
  @override
  @JsonKey(ignore: true)
  _$$_CardDtoCopyWith<_$_CardDto> get copyWith =>
      throw _privateConstructorUsedError;
}
