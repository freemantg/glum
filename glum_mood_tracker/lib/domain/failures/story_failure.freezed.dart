// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StoryFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InvalidDataException exception) invalidStoryData,
    required TResult Function(DriftWrappedException exception)
        storyDatabaseException,
    required TResult Function(CouldNotRollBackException exception)
        couldNotRollBackStory,
    required TResult Function() unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InvalidDataException exception)? invalidStoryData,
    TResult? Function(DriftWrappedException exception)? storyDatabaseException,
    TResult? Function(CouldNotRollBackException exception)?
        couldNotRollBackStory,
    TResult? Function()? unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InvalidDataException exception)? invalidStoryData,
    TResult Function(DriftWrappedException exception)? storyDatabaseException,
    TResult Function(CouldNotRollBackException exception)?
        couldNotRollBackStory,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidStoryDataFailure value) invalidStoryData,
    required TResult Function(_StoryDatabaseExceptionFailure value)
        storyDatabaseException,
    required TResult Function(_CouldNotRollBackStoryFailure value)
        couldNotRollBackStory,
    required TResult Function(_Unexpected value) unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidStoryDataFailure value)? invalidStoryData,
    TResult? Function(_StoryDatabaseExceptionFailure value)?
        storyDatabaseException,
    TResult? Function(_CouldNotRollBackStoryFailure value)?
        couldNotRollBackStory,
    TResult? Function(_Unexpected value)? unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidStoryDataFailure value)? invalidStoryData,
    TResult Function(_StoryDatabaseExceptionFailure value)?
        storyDatabaseException,
    TResult Function(_CouldNotRollBackStoryFailure value)?
        couldNotRollBackStory,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryFailureCopyWith<$Res> {
  factory $StoryFailureCopyWith(
          StoryFailure value, $Res Function(StoryFailure) then) =
      _$StoryFailureCopyWithImpl<$Res, StoryFailure>;
}

/// @nodoc
class _$StoryFailureCopyWithImpl<$Res, $Val extends StoryFailure>
    implements $StoryFailureCopyWith<$Res> {
  _$StoryFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InvalidStoryDataFailureCopyWith<$Res> {
  factory _$$_InvalidStoryDataFailureCopyWith(_$_InvalidStoryDataFailure value,
          $Res Function(_$_InvalidStoryDataFailure) then) =
      __$$_InvalidStoryDataFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({InvalidDataException exception});
}

/// @nodoc
class __$$_InvalidStoryDataFailureCopyWithImpl<$Res>
    extends _$StoryFailureCopyWithImpl<$Res, _$_InvalidStoryDataFailure>
    implements _$$_InvalidStoryDataFailureCopyWith<$Res> {
  __$$_InvalidStoryDataFailureCopyWithImpl(_$_InvalidStoryDataFailure _value,
      $Res Function(_$_InvalidStoryDataFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$_InvalidStoryDataFailure(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as InvalidDataException,
    ));
  }
}

/// @nodoc

class _$_InvalidStoryDataFailure implements _InvalidStoryDataFailure {
  const _$_InvalidStoryDataFailure(this.exception);

  @override
  final InvalidDataException exception;

  @override
  String toString() {
    return 'StoryFailure.invalidStoryData(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvalidStoryDataFailure &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @override
  @pragma('vm:prefer-inline')
  _$$_InvalidStoryDataFailureCopyWith<_$_InvalidStoryDataFailure>
      get copyWith =>
          __$$_InvalidStoryDataFailureCopyWithImpl<_$_InvalidStoryDataFailure>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InvalidDataException exception) invalidStoryData,
    required TResult Function(DriftWrappedException exception)
        storyDatabaseException,
    required TResult Function(CouldNotRollBackException exception)
        couldNotRollBackStory,
    required TResult Function() unexpected,
  }) {
    return invalidStoryData(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InvalidDataException exception)? invalidStoryData,
    TResult? Function(DriftWrappedException exception)? storyDatabaseException,
    TResult? Function(CouldNotRollBackException exception)?
        couldNotRollBackStory,
    TResult? Function()? unexpected,
  }) {
    return invalidStoryData?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InvalidDataException exception)? invalidStoryData,
    TResult Function(DriftWrappedException exception)? storyDatabaseException,
    TResult Function(CouldNotRollBackException exception)?
        couldNotRollBackStory,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) {
    if (invalidStoryData != null) {
      return invalidStoryData(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidStoryDataFailure value) invalidStoryData,
    required TResult Function(_StoryDatabaseExceptionFailure value)
        storyDatabaseException,
    required TResult Function(_CouldNotRollBackStoryFailure value)
        couldNotRollBackStory,
    required TResult Function(_Unexpected value) unexpected,
  }) {
    return invalidStoryData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidStoryDataFailure value)? invalidStoryData,
    TResult? Function(_StoryDatabaseExceptionFailure value)?
        storyDatabaseException,
    TResult? Function(_CouldNotRollBackStoryFailure value)?
        couldNotRollBackStory,
    TResult? Function(_Unexpected value)? unexpected,
  }) {
    return invalidStoryData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidStoryDataFailure value)? invalidStoryData,
    TResult Function(_StoryDatabaseExceptionFailure value)?
        storyDatabaseException,
    TResult Function(_CouldNotRollBackStoryFailure value)?
        couldNotRollBackStory,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (invalidStoryData != null) {
      return invalidStoryData(this);
    }
    return orElse();
  }
}

abstract class _InvalidStoryDataFailure implements StoryFailure {
  const factory _InvalidStoryDataFailure(final InvalidDataException exception) =
      _$_InvalidStoryDataFailure;

  InvalidDataException get exception;
  _$$_InvalidStoryDataFailureCopyWith<_$_InvalidStoryDataFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_StoryDatabaseExceptionFailureCopyWith<$Res> {
  factory _$$_StoryDatabaseExceptionFailureCopyWith(
          _$_StoryDatabaseExceptionFailure value,
          $Res Function(_$_StoryDatabaseExceptionFailure) then) =
      __$$_StoryDatabaseExceptionFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({DriftWrappedException exception});
}

/// @nodoc
class __$$_StoryDatabaseExceptionFailureCopyWithImpl<$Res>
    extends _$StoryFailureCopyWithImpl<$Res, _$_StoryDatabaseExceptionFailure>
    implements _$$_StoryDatabaseExceptionFailureCopyWith<$Res> {
  __$$_StoryDatabaseExceptionFailureCopyWithImpl(
      _$_StoryDatabaseExceptionFailure _value,
      $Res Function(_$_StoryDatabaseExceptionFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$_StoryDatabaseExceptionFailure(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as DriftWrappedException,
    ));
  }
}

/// @nodoc

class _$_StoryDatabaseExceptionFailure
    implements _StoryDatabaseExceptionFailure {
  const _$_StoryDatabaseExceptionFailure(this.exception);

  @override
  final DriftWrappedException exception;

  @override
  String toString() {
    return 'StoryFailure.storyDatabaseException(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoryDatabaseExceptionFailure &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @override
  @pragma('vm:prefer-inline')
  _$$_StoryDatabaseExceptionFailureCopyWith<_$_StoryDatabaseExceptionFailure>
      get copyWith => __$$_StoryDatabaseExceptionFailureCopyWithImpl<
          _$_StoryDatabaseExceptionFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InvalidDataException exception) invalidStoryData,
    required TResult Function(DriftWrappedException exception)
        storyDatabaseException,
    required TResult Function(CouldNotRollBackException exception)
        couldNotRollBackStory,
    required TResult Function() unexpected,
  }) {
    return storyDatabaseException(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InvalidDataException exception)? invalidStoryData,
    TResult? Function(DriftWrappedException exception)? storyDatabaseException,
    TResult? Function(CouldNotRollBackException exception)?
        couldNotRollBackStory,
    TResult? Function()? unexpected,
  }) {
    return storyDatabaseException?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InvalidDataException exception)? invalidStoryData,
    TResult Function(DriftWrappedException exception)? storyDatabaseException,
    TResult Function(CouldNotRollBackException exception)?
        couldNotRollBackStory,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) {
    if (storyDatabaseException != null) {
      return storyDatabaseException(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidStoryDataFailure value) invalidStoryData,
    required TResult Function(_StoryDatabaseExceptionFailure value)
        storyDatabaseException,
    required TResult Function(_CouldNotRollBackStoryFailure value)
        couldNotRollBackStory,
    required TResult Function(_Unexpected value) unexpected,
  }) {
    return storyDatabaseException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidStoryDataFailure value)? invalidStoryData,
    TResult? Function(_StoryDatabaseExceptionFailure value)?
        storyDatabaseException,
    TResult? Function(_CouldNotRollBackStoryFailure value)?
        couldNotRollBackStory,
    TResult? Function(_Unexpected value)? unexpected,
  }) {
    return storyDatabaseException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidStoryDataFailure value)? invalidStoryData,
    TResult Function(_StoryDatabaseExceptionFailure value)?
        storyDatabaseException,
    TResult Function(_CouldNotRollBackStoryFailure value)?
        couldNotRollBackStory,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (storyDatabaseException != null) {
      return storyDatabaseException(this);
    }
    return orElse();
  }
}

abstract class _StoryDatabaseExceptionFailure implements StoryFailure {
  const factory _StoryDatabaseExceptionFailure(
      final DriftWrappedException exception) = _$_StoryDatabaseExceptionFailure;

  DriftWrappedException get exception;
  _$$_StoryDatabaseExceptionFailureCopyWith<_$_StoryDatabaseExceptionFailure>
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
    extends _$StoryFailureCopyWithImpl<$Res, _$_CouldNotRollBackStoryFailure>
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
    return 'StoryFailure.couldNotRollBackStory(exception: $exception)';
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
    required TResult Function(InvalidDataException exception) invalidStoryData,
    required TResult Function(DriftWrappedException exception)
        storyDatabaseException,
    required TResult Function(CouldNotRollBackException exception)
        couldNotRollBackStory,
    required TResult Function() unexpected,
  }) {
    return couldNotRollBackStory(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InvalidDataException exception)? invalidStoryData,
    TResult? Function(DriftWrappedException exception)? storyDatabaseException,
    TResult? Function(CouldNotRollBackException exception)?
        couldNotRollBackStory,
    TResult? Function()? unexpected,
  }) {
    return couldNotRollBackStory?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InvalidDataException exception)? invalidStoryData,
    TResult Function(DriftWrappedException exception)? storyDatabaseException,
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
    required TResult Function(_InvalidStoryDataFailure value) invalidStoryData,
    required TResult Function(_StoryDatabaseExceptionFailure value)
        storyDatabaseException,
    required TResult Function(_CouldNotRollBackStoryFailure value)
        couldNotRollBackStory,
    required TResult Function(_Unexpected value) unexpected,
  }) {
    return couldNotRollBackStory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidStoryDataFailure value)? invalidStoryData,
    TResult? Function(_StoryDatabaseExceptionFailure value)?
        storyDatabaseException,
    TResult? Function(_CouldNotRollBackStoryFailure value)?
        couldNotRollBackStory,
    TResult? Function(_Unexpected value)? unexpected,
  }) {
    return couldNotRollBackStory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidStoryDataFailure value)? invalidStoryData,
    TResult Function(_StoryDatabaseExceptionFailure value)?
        storyDatabaseException,
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

abstract class _CouldNotRollBackStoryFailure implements StoryFailure {
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
    extends _$StoryFailureCopyWithImpl<$Res, _$_Unexpected>
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
    return 'StoryFailure.unexpected()';
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
    required TResult Function(InvalidDataException exception) invalidStoryData,
    required TResult Function(DriftWrappedException exception)
        storyDatabaseException,
    required TResult Function(CouldNotRollBackException exception)
        couldNotRollBackStory,
    required TResult Function() unexpected,
  }) {
    return unexpected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InvalidDataException exception)? invalidStoryData,
    TResult? Function(DriftWrappedException exception)? storyDatabaseException,
    TResult? Function(CouldNotRollBackException exception)?
        couldNotRollBackStory,
    TResult? Function()? unexpected,
  }) {
    return unexpected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InvalidDataException exception)? invalidStoryData,
    TResult Function(DriftWrappedException exception)? storyDatabaseException,
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
    required TResult Function(_InvalidStoryDataFailure value) invalidStoryData,
    required TResult Function(_StoryDatabaseExceptionFailure value)
        storyDatabaseException,
    required TResult Function(_CouldNotRollBackStoryFailure value)
        couldNotRollBackStory,
    required TResult Function(_Unexpected value) unexpected,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidStoryDataFailure value)? invalidStoryData,
    TResult? Function(_StoryDatabaseExceptionFailure value)?
        storyDatabaseException,
    TResult? Function(_CouldNotRollBackStoryFailure value)?
        couldNotRollBackStory,
    TResult? Function(_Unexpected value)? unexpected,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidStoryDataFailure value)? invalidStoryData,
    TResult Function(_StoryDatabaseExceptionFailure value)?
        storyDatabaseException,
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

abstract class _Unexpected implements StoryFailure {
  const factory _Unexpected() = _$_Unexpected;
}
