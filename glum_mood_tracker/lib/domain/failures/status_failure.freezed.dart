// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StatusFailure {
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
    required TResult Function(_InvalidStatusFailure value) invalidStatusData,
    required TResult Function(_StatusDatabaseExceptionFailure value)
        statusDatabaseException,
    required TResult Function(_CouldNotRollBackStoryFailure value)
        couldNotRollBackStory,
    required TResult Function(_Unexpected value) unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidStatusFailure value)? invalidStatusData,
    TResult? Function(_StatusDatabaseExceptionFailure value)?
        statusDatabaseException,
    TResult? Function(_CouldNotRollBackStoryFailure value)?
        couldNotRollBackStory,
    TResult? Function(_Unexpected value)? unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidStatusFailure value)? invalidStatusData,
    TResult Function(_StatusDatabaseExceptionFailure value)?
        statusDatabaseException,
    TResult Function(_CouldNotRollBackStoryFailure value)?
        couldNotRollBackStory,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusFailureCopyWith<$Res> {
  factory $StatusFailureCopyWith(
          StatusFailure value, $Res Function(StatusFailure) then) =
      _$StatusFailureCopyWithImpl<$Res, StatusFailure>;
}

/// @nodoc
class _$StatusFailureCopyWithImpl<$Res, $Val extends StatusFailure>
    implements $StatusFailureCopyWith<$Res> {
  _$StatusFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InvalidStatusFailureCopyWith<$Res> {
  factory _$$_InvalidStatusFailureCopyWith(_$_InvalidStatusFailure value,
          $Res Function(_$_InvalidStatusFailure) then) =
      __$$_InvalidStatusFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({InvalidDataException exception});
}

/// @nodoc
class __$$_InvalidStatusFailureCopyWithImpl<$Res>
    extends _$StatusFailureCopyWithImpl<$Res, _$_InvalidStatusFailure>
    implements _$$_InvalidStatusFailureCopyWith<$Res> {
  __$$_InvalidStatusFailureCopyWithImpl(_$_InvalidStatusFailure _value,
      $Res Function(_$_InvalidStatusFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$_InvalidStatusFailure(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as InvalidDataException,
    ));
  }
}

/// @nodoc

class _$_InvalidStatusFailure implements _InvalidStatusFailure {
  const _$_InvalidStatusFailure(this.exception);

  @override
  final InvalidDataException exception;

  @override
  String toString() {
    return 'StatusFailure.invalidStatusData(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvalidStatusFailure &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @override
  @pragma('vm:prefer-inline')
  _$$_InvalidStatusFailureCopyWith<_$_InvalidStatusFailure> get copyWith =>
      __$$_InvalidStatusFailureCopyWithImpl<_$_InvalidStatusFailure>(
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
    required TResult Function(_InvalidStatusFailure value) invalidStatusData,
    required TResult Function(_StatusDatabaseExceptionFailure value)
        statusDatabaseException,
    required TResult Function(_CouldNotRollBackStoryFailure value)
        couldNotRollBackStory,
    required TResult Function(_Unexpected value) unexpected,
  }) {
    return invalidStatusData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidStatusFailure value)? invalidStatusData,
    TResult? Function(_StatusDatabaseExceptionFailure value)?
        statusDatabaseException,
    TResult? Function(_CouldNotRollBackStoryFailure value)?
        couldNotRollBackStory,
    TResult? Function(_Unexpected value)? unexpected,
  }) {
    return invalidStatusData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidStatusFailure value)? invalidStatusData,
    TResult Function(_StatusDatabaseExceptionFailure value)?
        statusDatabaseException,
    TResult Function(_CouldNotRollBackStoryFailure value)?
        couldNotRollBackStory,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (invalidStatusData != null) {
      return invalidStatusData(this);
    }
    return orElse();
  }
}

abstract class _InvalidStatusFailure implements StatusFailure {
  const factory _InvalidStatusFailure(final InvalidDataException exception) =
      _$_InvalidStatusFailure;

  InvalidDataException get exception;
  _$$_InvalidStatusFailureCopyWith<_$_InvalidStatusFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_StatusDatabaseExceptionFailureCopyWith<$Res> {
  factory _$$_StatusDatabaseExceptionFailureCopyWith(
          _$_StatusDatabaseExceptionFailure value,
          $Res Function(_$_StatusDatabaseExceptionFailure) then) =
      __$$_StatusDatabaseExceptionFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({DriftWrappedException exception});
}

/// @nodoc
class __$$_StatusDatabaseExceptionFailureCopyWithImpl<$Res>
    extends _$StatusFailureCopyWithImpl<$Res, _$_StatusDatabaseExceptionFailure>
    implements _$$_StatusDatabaseExceptionFailureCopyWith<$Res> {
  __$$_StatusDatabaseExceptionFailureCopyWithImpl(
      _$_StatusDatabaseExceptionFailure _value,
      $Res Function(_$_StatusDatabaseExceptionFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$_StatusDatabaseExceptionFailure(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as DriftWrappedException,
    ));
  }
}

/// @nodoc

class _$_StatusDatabaseExceptionFailure
    implements _StatusDatabaseExceptionFailure {
  const _$_StatusDatabaseExceptionFailure(this.exception);

  @override
  final DriftWrappedException exception;

  @override
  String toString() {
    return 'StatusFailure.statusDatabaseException(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StatusDatabaseExceptionFailure &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @override
  @pragma('vm:prefer-inline')
  _$$_StatusDatabaseExceptionFailureCopyWith<_$_StatusDatabaseExceptionFailure>
      get copyWith => __$$_StatusDatabaseExceptionFailureCopyWithImpl<
          _$_StatusDatabaseExceptionFailure>(this, _$identity);

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
    required TResult Function(_InvalidStatusFailure value) invalidStatusData,
    required TResult Function(_StatusDatabaseExceptionFailure value)
        statusDatabaseException,
    required TResult Function(_CouldNotRollBackStoryFailure value)
        couldNotRollBackStory,
    required TResult Function(_Unexpected value) unexpected,
  }) {
    return statusDatabaseException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidStatusFailure value)? invalidStatusData,
    TResult? Function(_StatusDatabaseExceptionFailure value)?
        statusDatabaseException,
    TResult? Function(_CouldNotRollBackStoryFailure value)?
        couldNotRollBackStory,
    TResult? Function(_Unexpected value)? unexpected,
  }) {
    return statusDatabaseException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidStatusFailure value)? invalidStatusData,
    TResult Function(_StatusDatabaseExceptionFailure value)?
        statusDatabaseException,
    TResult Function(_CouldNotRollBackStoryFailure value)?
        couldNotRollBackStory,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (statusDatabaseException != null) {
      return statusDatabaseException(this);
    }
    return orElse();
  }
}

abstract class _StatusDatabaseExceptionFailure implements StatusFailure {
  const factory _StatusDatabaseExceptionFailure(
          final DriftWrappedException exception) =
      _$_StatusDatabaseExceptionFailure;

  DriftWrappedException get exception;
  _$$_StatusDatabaseExceptionFailureCopyWith<_$_StatusDatabaseExceptionFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CouldNotRollBackStoryFailureCopyWith<$Res> {
  factory _$$_CouldNotRollBackStoryFailureCopyWith(
          _$_CouldNotRollBackStoryFailure value,
          $Res Function(_$_CouldNotRollBackStoryFailure) then) =
      __$$_CouldNotRollBackStoryFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({CouldNotRollBackException exception});
}

/// @nodoc
class __$$_CouldNotRollBackStoryFailureCopyWithImpl<$Res>
    extends _$StatusFailureCopyWithImpl<$Res, _$_CouldNotRollBackStoryFailure>
    implements _$$_CouldNotRollBackStoryFailureCopyWith<$Res> {
  __$$_CouldNotRollBackStoryFailureCopyWithImpl(
      _$_CouldNotRollBackStoryFailure _value,
      $Res Function(_$_CouldNotRollBackStoryFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$_CouldNotRollBackStoryFailure(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as CouldNotRollBackException,
    ));
  }
}

/// @nodoc

class _$_CouldNotRollBackStoryFailure implements _CouldNotRollBackStoryFailure {
  const _$_CouldNotRollBackStoryFailure(this.exception);

  @override
  final CouldNotRollBackException exception;

  @override
  String toString() {
    return 'StatusFailure.couldNotRollBackStory(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CouldNotRollBackStoryFailure &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @override
  @pragma('vm:prefer-inline')
  _$$_CouldNotRollBackStoryFailureCopyWith<_$_CouldNotRollBackStoryFailure>
      get copyWith => __$$_CouldNotRollBackStoryFailureCopyWithImpl<
          _$_CouldNotRollBackStoryFailure>(this, _$identity);

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
    required TResult Function(_InvalidStatusFailure value) invalidStatusData,
    required TResult Function(_StatusDatabaseExceptionFailure value)
        statusDatabaseException,
    required TResult Function(_CouldNotRollBackStoryFailure value)
        couldNotRollBackStory,
    required TResult Function(_Unexpected value) unexpected,
  }) {
    return couldNotRollBackStory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidStatusFailure value)? invalidStatusData,
    TResult? Function(_StatusDatabaseExceptionFailure value)?
        statusDatabaseException,
    TResult? Function(_CouldNotRollBackStoryFailure value)?
        couldNotRollBackStory,
    TResult? Function(_Unexpected value)? unexpected,
  }) {
    return couldNotRollBackStory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidStatusFailure value)? invalidStatusData,
    TResult Function(_StatusDatabaseExceptionFailure value)?
        statusDatabaseException,
    TResult Function(_CouldNotRollBackStoryFailure value)?
        couldNotRollBackStory,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (couldNotRollBackStory != null) {
      return couldNotRollBackStory(this);
    }
    return orElse();
  }
}

abstract class _CouldNotRollBackStoryFailure implements StatusFailure {
  const factory _CouldNotRollBackStoryFailure(
          final CouldNotRollBackException exception) =
      _$_CouldNotRollBackStoryFailure;

  CouldNotRollBackException get exception;
  _$$_CouldNotRollBackStoryFailureCopyWith<_$_CouldNotRollBackStoryFailure>
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
    extends _$StatusFailureCopyWithImpl<$Res, _$_Unexpected>
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
    return 'StatusFailure.unexpected()';
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
    required TResult Function(_InvalidStatusFailure value) invalidStatusData,
    required TResult Function(_StatusDatabaseExceptionFailure value)
        statusDatabaseException,
    required TResult Function(_CouldNotRollBackStoryFailure value)
        couldNotRollBackStory,
    required TResult Function(_Unexpected value) unexpected,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidStatusFailure value)? invalidStatusData,
    TResult? Function(_StatusDatabaseExceptionFailure value)?
        statusDatabaseException,
    TResult? Function(_CouldNotRollBackStoryFailure value)?
        couldNotRollBackStory,
    TResult? Function(_Unexpected value)? unexpected,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidStatusFailure value)? invalidStatusData,
    TResult Function(_StatusDatabaseExceptionFailure value)?
        statusDatabaseException,
    TResult Function(_CouldNotRollBackStoryFailure value)?
        couldNotRollBackStory,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _Unexpected implements StatusFailure {
  const factory _Unexpected() = _$_Unexpected;
}
