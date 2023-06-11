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
    required TResult Function(InvalidStoryDataFailure value) invalidStoryData,
    required TResult Function(StoryDatabaseExceptionFailure value)
        storyDatabaseException,
    required TResult Function(CouldNotRollBackStoryFailure value)
        couldNotRollBackStory,
    required TResult Function(_Unexpected value) unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidStoryDataFailure value)? invalidStoryData,
    TResult? Function(StoryDatabaseExceptionFailure value)?
        storyDatabaseException,
    TResult? Function(CouldNotRollBackStoryFailure value)?
        couldNotRollBackStory,
    TResult? Function(_Unexpected value)? unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidStoryDataFailure value)? invalidStoryData,
    TResult Function(StoryDatabaseExceptionFailure value)?
        storyDatabaseException,
    TResult Function(CouldNotRollBackStoryFailure value)? couldNotRollBackStory,
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
abstract class _$$InvalidStoryDataFailureCopyWith<$Res> {
  factory _$$InvalidStoryDataFailureCopyWith(_$InvalidStoryDataFailure value,
          $Res Function(_$InvalidStoryDataFailure) then) =
      __$$InvalidStoryDataFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({InvalidDataException exception});
}

/// @nodoc
class __$$InvalidStoryDataFailureCopyWithImpl<$Res>
    extends _$StoryFailureCopyWithImpl<$Res, _$InvalidStoryDataFailure>
    implements _$$InvalidStoryDataFailureCopyWith<$Res> {
  __$$InvalidStoryDataFailureCopyWithImpl(_$InvalidStoryDataFailure _value,
      $Res Function(_$InvalidStoryDataFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$InvalidStoryDataFailure(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as InvalidDataException,
    ));
  }
}

/// @nodoc

class _$InvalidStoryDataFailure implements InvalidStoryDataFailure {
  const _$InvalidStoryDataFailure(this.exception);

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
            other is _$InvalidStoryDataFailure &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @override
  @pragma('vm:prefer-inline')
  _$$InvalidStoryDataFailureCopyWith<_$InvalidStoryDataFailure> get copyWith =>
      __$$InvalidStoryDataFailureCopyWithImpl<_$InvalidStoryDataFailure>(
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
    required TResult Function(InvalidStoryDataFailure value) invalidStoryData,
    required TResult Function(StoryDatabaseExceptionFailure value)
        storyDatabaseException,
    required TResult Function(CouldNotRollBackStoryFailure value)
        couldNotRollBackStory,
    required TResult Function(_Unexpected value) unexpected,
  }) {
    return invalidStoryData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidStoryDataFailure value)? invalidStoryData,
    TResult? Function(StoryDatabaseExceptionFailure value)?
        storyDatabaseException,
    TResult? Function(CouldNotRollBackStoryFailure value)?
        couldNotRollBackStory,
    TResult? Function(_Unexpected value)? unexpected,
  }) {
    return invalidStoryData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidStoryDataFailure value)? invalidStoryData,
    TResult Function(StoryDatabaseExceptionFailure value)?
        storyDatabaseException,
    TResult Function(CouldNotRollBackStoryFailure value)? couldNotRollBackStory,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (invalidStoryData != null) {
      return invalidStoryData(this);
    }
    return orElse();
  }
}

abstract class InvalidStoryDataFailure implements StoryFailure {
  const factory InvalidStoryDataFailure(final InvalidDataException exception) =
      _$InvalidStoryDataFailure;

  InvalidDataException get exception;
  _$$InvalidStoryDataFailureCopyWith<_$InvalidStoryDataFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StoryDatabaseExceptionFailureCopyWith<$Res> {
  factory _$$StoryDatabaseExceptionFailureCopyWith(
          _$StoryDatabaseExceptionFailure value,
          $Res Function(_$StoryDatabaseExceptionFailure) then) =
      __$$StoryDatabaseExceptionFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({DriftWrappedException exception});
}

/// @nodoc
class __$$StoryDatabaseExceptionFailureCopyWithImpl<$Res>
    extends _$StoryFailureCopyWithImpl<$Res, _$StoryDatabaseExceptionFailure>
    implements _$$StoryDatabaseExceptionFailureCopyWith<$Res> {
  __$$StoryDatabaseExceptionFailureCopyWithImpl(
      _$StoryDatabaseExceptionFailure _value,
      $Res Function(_$StoryDatabaseExceptionFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$StoryDatabaseExceptionFailure(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as DriftWrappedException,
    ));
  }
}

/// @nodoc

class _$StoryDatabaseExceptionFailure implements StoryDatabaseExceptionFailure {
  const _$StoryDatabaseExceptionFailure(this.exception);

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
            other is _$StoryDatabaseExceptionFailure &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @override
  @pragma('vm:prefer-inline')
  _$$StoryDatabaseExceptionFailureCopyWith<_$StoryDatabaseExceptionFailure>
      get copyWith => __$$StoryDatabaseExceptionFailureCopyWithImpl<
          _$StoryDatabaseExceptionFailure>(this, _$identity);

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
    required TResult Function(InvalidStoryDataFailure value) invalidStoryData,
    required TResult Function(StoryDatabaseExceptionFailure value)
        storyDatabaseException,
    required TResult Function(CouldNotRollBackStoryFailure value)
        couldNotRollBackStory,
    required TResult Function(_Unexpected value) unexpected,
  }) {
    return storyDatabaseException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidStoryDataFailure value)? invalidStoryData,
    TResult? Function(StoryDatabaseExceptionFailure value)?
        storyDatabaseException,
    TResult? Function(CouldNotRollBackStoryFailure value)?
        couldNotRollBackStory,
    TResult? Function(_Unexpected value)? unexpected,
  }) {
    return storyDatabaseException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidStoryDataFailure value)? invalidStoryData,
    TResult Function(StoryDatabaseExceptionFailure value)?
        storyDatabaseException,
    TResult Function(CouldNotRollBackStoryFailure value)? couldNotRollBackStory,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (storyDatabaseException != null) {
      return storyDatabaseException(this);
    }
    return orElse();
  }
}

abstract class StoryDatabaseExceptionFailure implements StoryFailure {
  const factory StoryDatabaseExceptionFailure(
      final DriftWrappedException exception) = _$StoryDatabaseExceptionFailure;

  DriftWrappedException get exception;
  _$$StoryDatabaseExceptionFailureCopyWith<_$StoryDatabaseExceptionFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CouldNotRollBackStoryFailureCopyWith<$Res> {
  factory _$$CouldNotRollBackStoryFailureCopyWith(
          _$CouldNotRollBackStoryFailure value,
          $Res Function(_$CouldNotRollBackStoryFailure) then) =
      __$$CouldNotRollBackStoryFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({CouldNotRollBackException exception});
}

/// @nodoc
class __$$CouldNotRollBackStoryFailureCopyWithImpl<$Res>
    extends _$StoryFailureCopyWithImpl<$Res, _$CouldNotRollBackStoryFailure>
    implements _$$CouldNotRollBackStoryFailureCopyWith<$Res> {
  __$$CouldNotRollBackStoryFailureCopyWithImpl(
      _$CouldNotRollBackStoryFailure _value,
      $Res Function(_$CouldNotRollBackStoryFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$CouldNotRollBackStoryFailure(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as CouldNotRollBackException,
    ));
  }
}

/// @nodoc

class _$CouldNotRollBackStoryFailure implements CouldNotRollBackStoryFailure {
  const _$CouldNotRollBackStoryFailure(this.exception);

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
            other is _$CouldNotRollBackStoryFailure &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @override
  @pragma('vm:prefer-inline')
  _$$CouldNotRollBackStoryFailureCopyWith<_$CouldNotRollBackStoryFailure>
      get copyWith => __$$CouldNotRollBackStoryFailureCopyWithImpl<
          _$CouldNotRollBackStoryFailure>(this, _$identity);

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
    required TResult Function(InvalidStoryDataFailure value) invalidStoryData,
    required TResult Function(StoryDatabaseExceptionFailure value)
        storyDatabaseException,
    required TResult Function(CouldNotRollBackStoryFailure value)
        couldNotRollBackStory,
    required TResult Function(_Unexpected value) unexpected,
  }) {
    return couldNotRollBackStory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidStoryDataFailure value)? invalidStoryData,
    TResult? Function(StoryDatabaseExceptionFailure value)?
        storyDatabaseException,
    TResult? Function(CouldNotRollBackStoryFailure value)?
        couldNotRollBackStory,
    TResult? Function(_Unexpected value)? unexpected,
  }) {
    return couldNotRollBackStory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidStoryDataFailure value)? invalidStoryData,
    TResult Function(StoryDatabaseExceptionFailure value)?
        storyDatabaseException,
    TResult Function(CouldNotRollBackStoryFailure value)? couldNotRollBackStory,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (couldNotRollBackStory != null) {
      return couldNotRollBackStory(this);
    }
    return orElse();
  }
}

abstract class CouldNotRollBackStoryFailure implements StoryFailure {
  const factory CouldNotRollBackStoryFailure(
          final CouldNotRollBackException exception) =
      _$CouldNotRollBackStoryFailure;

  CouldNotRollBackException get exception;
  _$$CouldNotRollBackStoryFailureCopyWith<_$CouldNotRollBackStoryFailure>
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
    required TResult Function(InvalidStoryDataFailure value) invalidStoryData,
    required TResult Function(StoryDatabaseExceptionFailure value)
        storyDatabaseException,
    required TResult Function(CouldNotRollBackStoryFailure value)
        couldNotRollBackStory,
    required TResult Function(_Unexpected value) unexpected,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidStoryDataFailure value)? invalidStoryData,
    TResult? Function(StoryDatabaseExceptionFailure value)?
        storyDatabaseException,
    TResult? Function(CouldNotRollBackStoryFailure value)?
        couldNotRollBackStory,
    TResult? Function(_Unexpected value)? unexpected,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidStoryDataFailure value)? invalidStoryData,
    TResult Function(StoryDatabaseExceptionFailure value)?
        storyDatabaseException,
    TResult Function(CouldNotRollBackStoryFailure value)? couldNotRollBackStory,
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
