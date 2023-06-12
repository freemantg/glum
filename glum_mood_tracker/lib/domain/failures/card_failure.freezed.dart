// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CardFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InvalidDataException exception) invalidStatusData,
    required TResult Function(DriftWrappedException exception)
        statusDatabaseException,
    required TResult Function(CouldNotRollBackException exception)
        couldNotRollBackStory,
    required TResult Function() unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InvalidDataException exception)? invalidStatusData,
    TResult? Function(DriftWrappedException exception)? statusDatabaseException,
    TResult? Function(CouldNotRollBackException exception)?
        couldNotRollBackStory,
    TResult? Function()? unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InvalidDataException exception)? invalidStatusData,
    TResult Function(DriftWrappedException exception)? statusDatabaseException,
    TResult Function(CouldNotRollBackException exception)?
        couldNotRollBackStory,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidCardFailure value) invalidStatusData,
    required TResult Function(_CardDatabaseExceptionFailure value)
        statusDatabaseException,
    required TResult Function(_CouldNotRollBackCardFailure value)
        couldNotRollBackStory,
    required TResult Function(_Unexpected value) unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidCardFailure value)? invalidStatusData,
    TResult? Function(_CardDatabaseExceptionFailure value)?
        statusDatabaseException,
    TResult? Function(_CouldNotRollBackCardFailure value)?
        couldNotRollBackStory,
    TResult? Function(_Unexpected value)? unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidCardFailure value)? invalidStatusData,
    TResult Function(_CardDatabaseExceptionFailure value)?
        statusDatabaseException,
    TResult Function(_CouldNotRollBackCardFailure value)? couldNotRollBackStory,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardFailureCopyWith<$Res> {
  factory $CardFailureCopyWith(
          CardFailure value, $Res Function(CardFailure) then) =
      _$CardFailureCopyWithImpl<$Res, CardFailure>;
}

/// @nodoc
class _$CardFailureCopyWithImpl<$Res, $Val extends CardFailure>
    implements $CardFailureCopyWith<$Res> {
  _$CardFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InvalidCardFailureCopyWith<$Res> {
  factory _$$_InvalidCardFailureCopyWith(_$_InvalidCardFailure value,
          $Res Function(_$_InvalidCardFailure) then) =
      __$$_InvalidCardFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({InvalidDataException exception});
}

/// @nodoc
class __$$_InvalidCardFailureCopyWithImpl<$Res>
    extends _$CardFailureCopyWithImpl<$Res, _$_InvalidCardFailure>
    implements _$$_InvalidCardFailureCopyWith<$Res> {
  __$$_InvalidCardFailureCopyWithImpl(
      _$_InvalidCardFailure _value, $Res Function(_$_InvalidCardFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$_InvalidCardFailure(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as InvalidDataException,
    ));
  }
}

/// @nodoc

class _$_InvalidCardFailure implements _InvalidCardFailure {
  const _$_InvalidCardFailure(this.exception);

  @override
  final InvalidDataException exception;

  @override
  String toString() {
    return 'CardFailure.invalidStatusData(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvalidCardFailure &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @override
  @pragma('vm:prefer-inline')
  _$$_InvalidCardFailureCopyWith<_$_InvalidCardFailure> get copyWith =>
      __$$_InvalidCardFailureCopyWithImpl<_$_InvalidCardFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InvalidDataException exception) invalidStatusData,
    required TResult Function(DriftWrappedException exception)
        statusDatabaseException,
    required TResult Function(CouldNotRollBackException exception)
        couldNotRollBackStory,
    required TResult Function() unexpected,
  }) {
    return invalidStatusData(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InvalidDataException exception)? invalidStatusData,
    TResult? Function(DriftWrappedException exception)? statusDatabaseException,
    TResult? Function(CouldNotRollBackException exception)?
        couldNotRollBackStory,
    TResult? Function()? unexpected,
  }) {
    return invalidStatusData?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InvalidDataException exception)? invalidStatusData,
    TResult Function(DriftWrappedException exception)? statusDatabaseException,
    TResult Function(CouldNotRollBackException exception)?
        couldNotRollBackStory,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) {
    if (invalidStatusData != null) {
      return invalidStatusData(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidCardFailure value) invalidStatusData,
    required TResult Function(_CardDatabaseExceptionFailure value)
        statusDatabaseException,
    required TResult Function(_CouldNotRollBackCardFailure value)
        couldNotRollBackStory,
    required TResult Function(_Unexpected value) unexpected,
  }) {
    return invalidStatusData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidCardFailure value)? invalidStatusData,
    TResult? Function(_CardDatabaseExceptionFailure value)?
        statusDatabaseException,
    TResult? Function(_CouldNotRollBackCardFailure value)?
        couldNotRollBackStory,
    TResult? Function(_Unexpected value)? unexpected,
  }) {
    return invalidStatusData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidCardFailure value)? invalidStatusData,
    TResult Function(_CardDatabaseExceptionFailure value)?
        statusDatabaseException,
    TResult Function(_CouldNotRollBackCardFailure value)? couldNotRollBackStory,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (invalidStatusData != null) {
      return invalidStatusData(this);
    }
    return orElse();
  }
}

abstract class _InvalidCardFailure implements CardFailure {
  const factory _InvalidCardFailure(final InvalidDataException exception) =
      _$_InvalidCardFailure;

  InvalidDataException get exception;
  _$$_InvalidCardFailureCopyWith<_$_InvalidCardFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CardDatabaseExceptionFailureCopyWith<$Res> {
  factory _$$_CardDatabaseExceptionFailureCopyWith(
          _$_CardDatabaseExceptionFailure value,
          $Res Function(_$_CardDatabaseExceptionFailure) then) =
      __$$_CardDatabaseExceptionFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({DriftWrappedException exception});
}

/// @nodoc
class __$$_CardDatabaseExceptionFailureCopyWithImpl<$Res>
    extends _$CardFailureCopyWithImpl<$Res, _$_CardDatabaseExceptionFailure>
    implements _$$_CardDatabaseExceptionFailureCopyWith<$Res> {
  __$$_CardDatabaseExceptionFailureCopyWithImpl(
      _$_CardDatabaseExceptionFailure _value,
      $Res Function(_$_CardDatabaseExceptionFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$_CardDatabaseExceptionFailure(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as DriftWrappedException,
    ));
  }
}

/// @nodoc

class _$_CardDatabaseExceptionFailure implements _CardDatabaseExceptionFailure {
  const _$_CardDatabaseExceptionFailure(this.exception);

  @override
  final DriftWrappedException exception;

  @override
  String toString() {
    return 'CardFailure.statusDatabaseException(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardDatabaseExceptionFailure &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @override
  @pragma('vm:prefer-inline')
  _$$_CardDatabaseExceptionFailureCopyWith<_$_CardDatabaseExceptionFailure>
      get copyWith => __$$_CardDatabaseExceptionFailureCopyWithImpl<
          _$_CardDatabaseExceptionFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InvalidDataException exception) invalidStatusData,
    required TResult Function(DriftWrappedException exception)
        statusDatabaseException,
    required TResult Function(CouldNotRollBackException exception)
        couldNotRollBackStory,
    required TResult Function() unexpected,
  }) {
    return statusDatabaseException(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InvalidDataException exception)? invalidStatusData,
    TResult? Function(DriftWrappedException exception)? statusDatabaseException,
    TResult? Function(CouldNotRollBackException exception)?
        couldNotRollBackStory,
    TResult? Function()? unexpected,
  }) {
    return statusDatabaseException?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InvalidDataException exception)? invalidStatusData,
    TResult Function(DriftWrappedException exception)? statusDatabaseException,
    TResult Function(CouldNotRollBackException exception)?
        couldNotRollBackStory,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) {
    if (statusDatabaseException != null) {
      return statusDatabaseException(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidCardFailure value) invalidStatusData,
    required TResult Function(_CardDatabaseExceptionFailure value)
        statusDatabaseException,
    required TResult Function(_CouldNotRollBackCardFailure value)
        couldNotRollBackStory,
    required TResult Function(_Unexpected value) unexpected,
  }) {
    return statusDatabaseException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidCardFailure value)? invalidStatusData,
    TResult? Function(_CardDatabaseExceptionFailure value)?
        statusDatabaseException,
    TResult? Function(_CouldNotRollBackCardFailure value)?
        couldNotRollBackStory,
    TResult? Function(_Unexpected value)? unexpected,
  }) {
    return statusDatabaseException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidCardFailure value)? invalidStatusData,
    TResult Function(_CardDatabaseExceptionFailure value)?
        statusDatabaseException,
    TResult Function(_CouldNotRollBackCardFailure value)? couldNotRollBackStory,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (statusDatabaseException != null) {
      return statusDatabaseException(this);
    }
    return orElse();
  }
}

abstract class _CardDatabaseExceptionFailure implements CardFailure {
  const factory _CardDatabaseExceptionFailure(
      final DriftWrappedException exception) = _$_CardDatabaseExceptionFailure;

  DriftWrappedException get exception;
  _$$_CardDatabaseExceptionFailureCopyWith<_$_CardDatabaseExceptionFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CouldNotRollBackCardFailureCopyWith<$Res> {
  factory _$$_CouldNotRollBackCardFailureCopyWith(
          _$_CouldNotRollBackCardFailure value,
          $Res Function(_$_CouldNotRollBackCardFailure) then) =
      __$$_CouldNotRollBackCardFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({CouldNotRollBackException exception});
}

/// @nodoc
class __$$_CouldNotRollBackCardFailureCopyWithImpl<$Res>
    extends _$CardFailureCopyWithImpl<$Res, _$_CouldNotRollBackCardFailure>
    implements _$$_CouldNotRollBackCardFailureCopyWith<$Res> {
  __$$_CouldNotRollBackCardFailureCopyWithImpl(
      _$_CouldNotRollBackCardFailure _value,
      $Res Function(_$_CouldNotRollBackCardFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$_CouldNotRollBackCardFailure(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as CouldNotRollBackException,
    ));
  }
}

/// @nodoc

class _$_CouldNotRollBackCardFailure implements _CouldNotRollBackCardFailure {
  const _$_CouldNotRollBackCardFailure(this.exception);

  @override
  final CouldNotRollBackException exception;

  @override
  String toString() {
    return 'CardFailure.couldNotRollBackStory(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CouldNotRollBackCardFailure &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @override
  @pragma('vm:prefer-inline')
  _$$_CouldNotRollBackCardFailureCopyWith<_$_CouldNotRollBackCardFailure>
      get copyWith => __$$_CouldNotRollBackCardFailureCopyWithImpl<
          _$_CouldNotRollBackCardFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InvalidDataException exception) invalidStatusData,
    required TResult Function(DriftWrappedException exception)
        statusDatabaseException,
    required TResult Function(CouldNotRollBackException exception)
        couldNotRollBackStory,
    required TResult Function() unexpected,
  }) {
    return couldNotRollBackStory(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InvalidDataException exception)? invalidStatusData,
    TResult? Function(DriftWrappedException exception)? statusDatabaseException,
    TResult? Function(CouldNotRollBackException exception)?
        couldNotRollBackStory,
    TResult? Function()? unexpected,
  }) {
    return couldNotRollBackStory?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InvalidDataException exception)? invalidStatusData,
    TResult Function(DriftWrappedException exception)? statusDatabaseException,
    TResult Function(CouldNotRollBackException exception)?
        couldNotRollBackStory,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) {
    if (couldNotRollBackStory != null) {
      return couldNotRollBackStory(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidCardFailure value) invalidStatusData,
    required TResult Function(_CardDatabaseExceptionFailure value)
        statusDatabaseException,
    required TResult Function(_CouldNotRollBackCardFailure value)
        couldNotRollBackStory,
    required TResult Function(_Unexpected value) unexpected,
  }) {
    return couldNotRollBackStory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidCardFailure value)? invalidStatusData,
    TResult? Function(_CardDatabaseExceptionFailure value)?
        statusDatabaseException,
    TResult? Function(_CouldNotRollBackCardFailure value)?
        couldNotRollBackStory,
    TResult? Function(_Unexpected value)? unexpected,
  }) {
    return couldNotRollBackStory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidCardFailure value)? invalidStatusData,
    TResult Function(_CardDatabaseExceptionFailure value)?
        statusDatabaseException,
    TResult Function(_CouldNotRollBackCardFailure value)? couldNotRollBackStory,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (couldNotRollBackStory != null) {
      return couldNotRollBackStory(this);
    }
    return orElse();
  }
}

abstract class _CouldNotRollBackCardFailure implements CardFailure {
  const factory _CouldNotRollBackCardFailure(
          final CouldNotRollBackException exception) =
      _$_CouldNotRollBackCardFailure;

  CouldNotRollBackException get exception;
  _$$_CouldNotRollBackCardFailureCopyWith<_$_CouldNotRollBackCardFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UnexpectedCopyWith<$Res> {
  factory _$$_UnexpectedCopyWith(
          _$_Unexpected value, $Res Function(_$_Unexpected) then) =
      __$$_UnexpectedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnexpectedCopyWithImpl<$Res>
    extends _$CardFailureCopyWithImpl<$Res, _$_Unexpected>
    implements _$$_UnexpectedCopyWith<$Res> {
  __$$_UnexpectedCopyWithImpl(
      _$_Unexpected _value, $Res Function(_$_Unexpected) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Unexpected implements _Unexpected {
  const _$_Unexpected();

  @override
  String toString() {
    return 'CardFailure.unexpected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Unexpected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InvalidDataException exception) invalidStatusData,
    required TResult Function(DriftWrappedException exception)
        statusDatabaseException,
    required TResult Function(CouldNotRollBackException exception)
        couldNotRollBackStory,
    required TResult Function() unexpected,
  }) {
    return unexpected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InvalidDataException exception)? invalidStatusData,
    TResult? Function(DriftWrappedException exception)? statusDatabaseException,
    TResult? Function(CouldNotRollBackException exception)?
        couldNotRollBackStory,
    TResult? Function()? unexpected,
  }) {
    return unexpected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InvalidDataException exception)? invalidStatusData,
    TResult Function(DriftWrappedException exception)? statusDatabaseException,
    TResult Function(CouldNotRollBackException exception)?
        couldNotRollBackStory,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidCardFailure value) invalidStatusData,
    required TResult Function(_CardDatabaseExceptionFailure value)
        statusDatabaseException,
    required TResult Function(_CouldNotRollBackCardFailure value)
        couldNotRollBackStory,
    required TResult Function(_Unexpected value) unexpected,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidCardFailure value)? invalidStatusData,
    TResult? Function(_CardDatabaseExceptionFailure value)?
        statusDatabaseException,
    TResult? Function(_CouldNotRollBackCardFailure value)?
        couldNotRollBackStory,
    TResult? Function(_Unexpected value)? unexpected,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidCardFailure value)? invalidStatusData,
    TResult Function(_CardDatabaseExceptionFailure value)?
        statusDatabaseException,
    TResult Function(_CouldNotRollBackCardFailure value)? couldNotRollBackStory,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _Unexpected implements CardFailure {
  const factory _Unexpected() = _$_Unexpected;
}
