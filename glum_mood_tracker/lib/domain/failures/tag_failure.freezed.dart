// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TagFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InvalidDataException exception) invalidTagData,
    required TResult Function(DriftWrappedException exception)
        tagDatabaseException,
    required TResult Function(CouldNotRollBackException exception)
        couldNotRollBackTag,
    required TResult Function() unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InvalidDataException exception)? invalidTagData,
    TResult? Function(DriftWrappedException exception)? tagDatabaseException,
    TResult? Function(CouldNotRollBackException exception)? couldNotRollBackTag,
    TResult? Function()? unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InvalidDataException exception)? invalidTagData,
    TResult Function(DriftWrappedException exception)? tagDatabaseException,
    TResult Function(CouldNotRollBackException exception)? couldNotRollBackTag,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidTagDataFailure value) invalidTagData,
    required TResult Function(TagDatabaseExceptionFailure value)
        tagDatabaseException,
    required TResult Function(CouldNotRollBackTagFailure value)
        couldNotRollBackTag,
    required TResult Function(_Unexpected value) unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidTagDataFailure value)? invalidTagData,
    TResult? Function(TagDatabaseExceptionFailure value)? tagDatabaseException,
    TResult? Function(CouldNotRollBackTagFailure value)? couldNotRollBackTag,
    TResult? Function(_Unexpected value)? unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidTagDataFailure value)? invalidTagData,
    TResult Function(TagDatabaseExceptionFailure value)? tagDatabaseException,
    TResult Function(CouldNotRollBackTagFailure value)? couldNotRollBackTag,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagFailureCopyWith<$Res> {
  factory $TagFailureCopyWith(
          TagFailure value, $Res Function(TagFailure) then) =
      _$TagFailureCopyWithImpl<$Res, TagFailure>;
}

/// @nodoc
class _$TagFailureCopyWithImpl<$Res, $Val extends TagFailure>
    implements $TagFailureCopyWith<$Res> {
  _$TagFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InvalidTagDataFailureCopyWith<$Res> {
  factory _$$InvalidTagDataFailureCopyWith(_$InvalidTagDataFailure value,
          $Res Function(_$InvalidTagDataFailure) then) =
      __$$InvalidTagDataFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({InvalidDataException exception});
}

/// @nodoc
class __$$InvalidTagDataFailureCopyWithImpl<$Res>
    extends _$TagFailureCopyWithImpl<$Res, _$InvalidTagDataFailure>
    implements _$$InvalidTagDataFailureCopyWith<$Res> {
  __$$InvalidTagDataFailureCopyWithImpl(_$InvalidTagDataFailure _value,
      $Res Function(_$InvalidTagDataFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$InvalidTagDataFailure(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as InvalidDataException,
    ));
  }
}

/// @nodoc

class _$InvalidTagDataFailure implements InvalidTagDataFailure {
  const _$InvalidTagDataFailure(this.exception);

  @override
  final InvalidDataException exception;

  @override
  String toString() {
    return 'TagFailure.invalidTagData(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidTagDataFailure &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @override
  @pragma('vm:prefer-inline')
  _$$InvalidTagDataFailureCopyWith<_$InvalidTagDataFailure> get copyWith =>
      __$$InvalidTagDataFailureCopyWithImpl<_$InvalidTagDataFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InvalidDataException exception) invalidTagData,
    required TResult Function(DriftWrappedException exception)
        tagDatabaseException,
    required TResult Function(CouldNotRollBackException exception)
        couldNotRollBackTag,
    required TResult Function() unexpected,
  }) {
    return invalidTagData(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InvalidDataException exception)? invalidTagData,
    TResult? Function(DriftWrappedException exception)? tagDatabaseException,
    TResult? Function(CouldNotRollBackException exception)? couldNotRollBackTag,
    TResult? Function()? unexpected,
  }) {
    return invalidTagData?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InvalidDataException exception)? invalidTagData,
    TResult Function(DriftWrappedException exception)? tagDatabaseException,
    TResult Function(CouldNotRollBackException exception)? couldNotRollBackTag,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) {
    if (invalidTagData != null) {
      return invalidTagData(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidTagDataFailure value) invalidTagData,
    required TResult Function(TagDatabaseExceptionFailure value)
        tagDatabaseException,
    required TResult Function(CouldNotRollBackTagFailure value)
        couldNotRollBackTag,
    required TResult Function(_Unexpected value) unexpected,
  }) {
    return invalidTagData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidTagDataFailure value)? invalidTagData,
    TResult? Function(TagDatabaseExceptionFailure value)? tagDatabaseException,
    TResult? Function(CouldNotRollBackTagFailure value)? couldNotRollBackTag,
    TResult? Function(_Unexpected value)? unexpected,
  }) {
    return invalidTagData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidTagDataFailure value)? invalidTagData,
    TResult Function(TagDatabaseExceptionFailure value)? tagDatabaseException,
    TResult Function(CouldNotRollBackTagFailure value)? couldNotRollBackTag,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (invalidTagData != null) {
      return invalidTagData(this);
    }
    return orElse();
  }
}

abstract class InvalidTagDataFailure implements TagFailure {
  const factory InvalidTagDataFailure(final InvalidDataException exception) =
      _$InvalidTagDataFailure;

  InvalidDataException get exception;
  _$$InvalidTagDataFailureCopyWith<_$InvalidTagDataFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TagDatabaseExceptionFailureCopyWith<$Res> {
  factory _$$TagDatabaseExceptionFailureCopyWith(
          _$TagDatabaseExceptionFailure value,
          $Res Function(_$TagDatabaseExceptionFailure) then) =
      __$$TagDatabaseExceptionFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({DriftWrappedException exception});
}

/// @nodoc
class __$$TagDatabaseExceptionFailureCopyWithImpl<$Res>
    extends _$TagFailureCopyWithImpl<$Res, _$TagDatabaseExceptionFailure>
    implements _$$TagDatabaseExceptionFailureCopyWith<$Res> {
  __$$TagDatabaseExceptionFailureCopyWithImpl(
      _$TagDatabaseExceptionFailure _value,
      $Res Function(_$TagDatabaseExceptionFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$TagDatabaseExceptionFailure(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as DriftWrappedException,
    ));
  }
}

/// @nodoc

class _$TagDatabaseExceptionFailure implements TagDatabaseExceptionFailure {
  const _$TagDatabaseExceptionFailure(this.exception);

  @override
  final DriftWrappedException exception;

  @override
  String toString() {
    return 'TagFailure.tagDatabaseException(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagDatabaseExceptionFailure &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @override
  @pragma('vm:prefer-inline')
  _$$TagDatabaseExceptionFailureCopyWith<_$TagDatabaseExceptionFailure>
      get copyWith => __$$TagDatabaseExceptionFailureCopyWithImpl<
          _$TagDatabaseExceptionFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InvalidDataException exception) invalidTagData,
    required TResult Function(DriftWrappedException exception)
        tagDatabaseException,
    required TResult Function(CouldNotRollBackException exception)
        couldNotRollBackTag,
    required TResult Function() unexpected,
  }) {
    return tagDatabaseException(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InvalidDataException exception)? invalidTagData,
    TResult? Function(DriftWrappedException exception)? tagDatabaseException,
    TResult? Function(CouldNotRollBackException exception)? couldNotRollBackTag,
    TResult? Function()? unexpected,
  }) {
    return tagDatabaseException?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InvalidDataException exception)? invalidTagData,
    TResult Function(DriftWrappedException exception)? tagDatabaseException,
    TResult Function(CouldNotRollBackException exception)? couldNotRollBackTag,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) {
    if (tagDatabaseException != null) {
      return tagDatabaseException(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidTagDataFailure value) invalidTagData,
    required TResult Function(TagDatabaseExceptionFailure value)
        tagDatabaseException,
    required TResult Function(CouldNotRollBackTagFailure value)
        couldNotRollBackTag,
    required TResult Function(_Unexpected value) unexpected,
  }) {
    return tagDatabaseException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidTagDataFailure value)? invalidTagData,
    TResult? Function(TagDatabaseExceptionFailure value)? tagDatabaseException,
    TResult? Function(CouldNotRollBackTagFailure value)? couldNotRollBackTag,
    TResult? Function(_Unexpected value)? unexpected,
  }) {
    return tagDatabaseException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidTagDataFailure value)? invalidTagData,
    TResult Function(TagDatabaseExceptionFailure value)? tagDatabaseException,
    TResult Function(CouldNotRollBackTagFailure value)? couldNotRollBackTag,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (tagDatabaseException != null) {
      return tagDatabaseException(this);
    }
    return orElse();
  }
}

abstract class TagDatabaseExceptionFailure implements TagFailure {
  const factory TagDatabaseExceptionFailure(
      final DriftWrappedException exception) = _$TagDatabaseExceptionFailure;

  DriftWrappedException get exception;
  _$$TagDatabaseExceptionFailureCopyWith<_$TagDatabaseExceptionFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CouldNotRollBackTagFailureCopyWith<$Res> {
  factory _$$CouldNotRollBackTagFailureCopyWith(
          _$CouldNotRollBackTagFailure value,
          $Res Function(_$CouldNotRollBackTagFailure) then) =
      __$$CouldNotRollBackTagFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({CouldNotRollBackException exception});
}

/// @nodoc
class __$$CouldNotRollBackTagFailureCopyWithImpl<$Res>
    extends _$TagFailureCopyWithImpl<$Res, _$CouldNotRollBackTagFailure>
    implements _$$CouldNotRollBackTagFailureCopyWith<$Res> {
  __$$CouldNotRollBackTagFailureCopyWithImpl(
      _$CouldNotRollBackTagFailure _value,
      $Res Function(_$CouldNotRollBackTagFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$CouldNotRollBackTagFailure(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as CouldNotRollBackException,
    ));
  }
}

/// @nodoc

class _$CouldNotRollBackTagFailure implements CouldNotRollBackTagFailure {
  const _$CouldNotRollBackTagFailure(this.exception);

  @override
  final CouldNotRollBackException exception;

  @override
  String toString() {
    return 'TagFailure.couldNotRollBackTag(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CouldNotRollBackTagFailure &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @override
  @pragma('vm:prefer-inline')
  _$$CouldNotRollBackTagFailureCopyWith<_$CouldNotRollBackTagFailure>
      get copyWith => __$$CouldNotRollBackTagFailureCopyWithImpl<
          _$CouldNotRollBackTagFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InvalidDataException exception) invalidTagData,
    required TResult Function(DriftWrappedException exception)
        tagDatabaseException,
    required TResult Function(CouldNotRollBackException exception)
        couldNotRollBackTag,
    required TResult Function() unexpected,
  }) {
    return couldNotRollBackTag(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InvalidDataException exception)? invalidTagData,
    TResult? Function(DriftWrappedException exception)? tagDatabaseException,
    TResult? Function(CouldNotRollBackException exception)? couldNotRollBackTag,
    TResult? Function()? unexpected,
  }) {
    return couldNotRollBackTag?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InvalidDataException exception)? invalidTagData,
    TResult Function(DriftWrappedException exception)? tagDatabaseException,
    TResult Function(CouldNotRollBackException exception)? couldNotRollBackTag,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) {
    if (couldNotRollBackTag != null) {
      return couldNotRollBackTag(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidTagDataFailure value) invalidTagData,
    required TResult Function(TagDatabaseExceptionFailure value)
        tagDatabaseException,
    required TResult Function(CouldNotRollBackTagFailure value)
        couldNotRollBackTag,
    required TResult Function(_Unexpected value) unexpected,
  }) {
    return couldNotRollBackTag(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidTagDataFailure value)? invalidTagData,
    TResult? Function(TagDatabaseExceptionFailure value)? tagDatabaseException,
    TResult? Function(CouldNotRollBackTagFailure value)? couldNotRollBackTag,
    TResult? Function(_Unexpected value)? unexpected,
  }) {
    return couldNotRollBackTag?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidTagDataFailure value)? invalidTagData,
    TResult Function(TagDatabaseExceptionFailure value)? tagDatabaseException,
    TResult Function(CouldNotRollBackTagFailure value)? couldNotRollBackTag,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (couldNotRollBackTag != null) {
      return couldNotRollBackTag(this);
    }
    return orElse();
  }
}

abstract class CouldNotRollBackTagFailure implements TagFailure {
  const factory CouldNotRollBackTagFailure(
      final CouldNotRollBackException exception) = _$CouldNotRollBackTagFailure;

  CouldNotRollBackException get exception;
  _$$CouldNotRollBackTagFailureCopyWith<_$CouldNotRollBackTagFailure>
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
    extends _$TagFailureCopyWithImpl<$Res, _$_Unexpected>
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
    return 'TagFailure.unexpected()';
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
    required TResult Function(InvalidDataException exception) invalidTagData,
    required TResult Function(DriftWrappedException exception)
        tagDatabaseException,
    required TResult Function(CouldNotRollBackException exception)
        couldNotRollBackTag,
    required TResult Function() unexpected,
  }) {
    return unexpected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InvalidDataException exception)? invalidTagData,
    TResult? Function(DriftWrappedException exception)? tagDatabaseException,
    TResult? Function(CouldNotRollBackException exception)? couldNotRollBackTag,
    TResult? Function()? unexpected,
  }) {
    return unexpected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InvalidDataException exception)? invalidTagData,
    TResult Function(DriftWrappedException exception)? tagDatabaseException,
    TResult Function(CouldNotRollBackException exception)? couldNotRollBackTag,
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
    required TResult Function(InvalidTagDataFailure value) invalidTagData,
    required TResult Function(TagDatabaseExceptionFailure value)
        tagDatabaseException,
    required TResult Function(CouldNotRollBackTagFailure value)
        couldNotRollBackTag,
    required TResult Function(_Unexpected value) unexpected,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidTagDataFailure value)? invalidTagData,
    TResult? Function(TagDatabaseExceptionFailure value)? tagDatabaseException,
    TResult? Function(CouldNotRollBackTagFailure value)? couldNotRollBackTag,
    TResult? Function(_Unexpected value)? unexpected,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidTagDataFailure value)? invalidTagData,
    TResult Function(TagDatabaseExceptionFailure value)? tagDatabaseException,
    TResult Function(CouldNotRollBackTagFailure value)? couldNotRollBackTag,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _Unexpected implements TagFailure {
  const factory _Unexpected() = _$_Unexpected;
}
