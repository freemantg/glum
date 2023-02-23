// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Card {
  int? get id => throw _privateConstructorUsedError;
  DateTime get monthYear => throw _privateConstructorUsedError;
  Color? get color => throw _privateConstructorUsedError;
  Photo? get photo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardCopyWith<Card> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardCopyWith<$Res> {
  factory $CardCopyWith(Card value, $Res Function(Card) then) =
      _$CardCopyWithImpl<$Res, Card>;
  @useResult
  $Res call({int? id, DateTime monthYear, Color? color, Photo? photo});

  $PhotoCopyWith<$Res>? get photo;
}

/// @nodoc
class _$CardCopyWithImpl<$Res, $Val extends Card>
    implements $CardCopyWith<$Res> {
  _$CardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? monthYear = null,
    Object? color = freezed,
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
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as Photo?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PhotoCopyWith<$Res>? get photo {
    if (_value.photo == null) {
      return null;
    }

    return $PhotoCopyWith<$Res>(_value.photo!, (value) {
      return _then(_value.copyWith(photo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CardCopyWith<$Res> implements $CardCopyWith<$Res> {
  factory _$$_CardCopyWith(_$_Card value, $Res Function(_$_Card) then) =
      __$$_CardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, DateTime monthYear, Color? color, Photo? photo});

  @override
  $PhotoCopyWith<$Res>? get photo;
}

/// @nodoc
class __$$_CardCopyWithImpl<$Res> extends _$CardCopyWithImpl<$Res, _$_Card>
    implements _$$_CardCopyWith<$Res> {
  __$$_CardCopyWithImpl(_$_Card _value, $Res Function(_$_Card) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? monthYear = null,
    Object? color = freezed,
    Object? photo = freezed,
  }) {
    return _then(_$_Card(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      monthYear: null == monthYear
          ? _value.monthYear
          : monthYear // ignore: cast_nullable_to_non_nullable
              as DateTime,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as Photo?,
    ));
  }
}

/// @nodoc

class _$_Card extends _Card {
  const _$_Card({this.id, required this.monthYear, this.color, this.photo})
      : super._();

  @override
  final int? id;
  @override
  final DateTime monthYear;
  @override
  final Color? color;
  @override
  final Photo? photo;

  @override
  String toString() {
    return 'Card(id: $id, monthYear: $monthYear, color: $color, photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Card &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.monthYear, monthYear) ||
                other.monthYear == monthYear) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, monthYear, color, photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardCopyWith<_$_Card> get copyWith =>
      __$$_CardCopyWithImpl<_$_Card>(this, _$identity);
}

abstract class _Card extends Card {
  const factory _Card(
      {final int? id,
      required final DateTime monthYear,
      final Color? color,
      final Photo? photo}) = _$_Card;
  const _Card._() : super._();

  @override
  int? get id;
  @override
  DateTime get monthYear;
  @override
  Color? get color;
  @override
  Photo? get photo;
  @override
  @JsonKey(ignore: true)
  _$$_CardCopyWith<_$_Card> get copyWith => throw _privateConstructorUsedError;
}
