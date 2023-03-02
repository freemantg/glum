// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cards_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CardsState {
  List<Card> get cards => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Card> cards) initial,
    required TResult Function(List<Card> cards) loadInProgress,
    required TResult Function(List<Card> cards) loadSuccess,
    required TResult Function(CardFailure failure, List<Card> cards) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Card> cards)? initial,
    TResult? Function(List<Card> cards)? loadInProgress,
    TResult? Function(List<Card> cards)? loadSuccess,
    TResult? Function(CardFailure failure, List<Card> cards)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Card> cards)? initial,
    TResult Function(List<Card> cards)? loadInProgress,
    TResult Function(List<Card> cards)? loadSuccess,
    TResult Function(CardFailure failure, List<Card> cards)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardsStateCopyWith<CardsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardsStateCopyWith<$Res> {
  factory $CardsStateCopyWith(
          CardsState value, $Res Function(CardsState) then) =
      _$CardsStateCopyWithImpl<$Res, CardsState>;
  @useResult
  $Res call({List<Card> cards});
}

/// @nodoc
class _$CardsStateCopyWithImpl<$Res, $Val extends CardsState>
    implements $CardsStateCopyWith<$Res> {
  _$CardsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = null,
  }) {
    return _then(_value.copyWith(
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<Card>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $CardsStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Card> cards});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$CardsStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = null,
  }) {
    return _then(_$_Initial(
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<Card>,
    ));
  }
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial({required final List<Card> cards})
      : _cards = cards,
        super._();

  final List<Card> _cards;
  @override
  List<Card> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  String toString() {
    return 'CardsState.initial(cards: $cards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other._cards, _cards));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cards));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Card> cards) initial,
    required TResult Function(List<Card> cards) loadInProgress,
    required TResult Function(List<Card> cards) loadSuccess,
    required TResult Function(CardFailure failure, List<Card> cards) failure,
  }) {
    return initial(cards);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Card> cards)? initial,
    TResult? Function(List<Card> cards)? loadInProgress,
    TResult? Function(List<Card> cards)? loadSuccess,
    TResult? Function(CardFailure failure, List<Card> cards)? failure,
  }) {
    return initial?.call(cards);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Card> cards)? initial,
    TResult Function(List<Card> cards)? loadInProgress,
    TResult Function(List<Card> cards)? loadSuccess,
    TResult Function(CardFailure failure, List<Card> cards)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(cards);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends CardsState {
  const factory _Initial({required final List<Card> cards}) = _$_Initial;
  const _Initial._() : super._();

  @override
  List<Card> get cards;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadInProgressCopyWith<$Res>
    implements $CardsStateCopyWith<$Res> {
  factory _$$_LoadInProgressCopyWith(
          _$_LoadInProgress value, $Res Function(_$_LoadInProgress) then) =
      __$$_LoadInProgressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Card> cards});
}

/// @nodoc
class __$$_LoadInProgressCopyWithImpl<$Res>
    extends _$CardsStateCopyWithImpl<$Res, _$_LoadInProgress>
    implements _$$_LoadInProgressCopyWith<$Res> {
  __$$_LoadInProgressCopyWithImpl(
      _$_LoadInProgress _value, $Res Function(_$_LoadInProgress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = null,
  }) {
    return _then(_$_LoadInProgress(
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<Card>,
    ));
  }
}

/// @nodoc

class _$_LoadInProgress extends _LoadInProgress {
  const _$_LoadInProgress({required final List<Card> cards})
      : _cards = cards,
        super._();

  final List<Card> _cards;
  @override
  List<Card> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  String toString() {
    return 'CardsState.loadInProgress(cards: $cards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadInProgress &&
            const DeepCollectionEquality().equals(other._cards, _cards));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cards));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadInProgressCopyWith<_$_LoadInProgress> get copyWith =>
      __$$_LoadInProgressCopyWithImpl<_$_LoadInProgress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Card> cards) initial,
    required TResult Function(List<Card> cards) loadInProgress,
    required TResult Function(List<Card> cards) loadSuccess,
    required TResult Function(CardFailure failure, List<Card> cards) failure,
  }) {
    return loadInProgress(cards);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Card> cards)? initial,
    TResult? Function(List<Card> cards)? loadInProgress,
    TResult? Function(List<Card> cards)? loadSuccess,
    TResult? Function(CardFailure failure, List<Card> cards)? failure,
  }) {
    return loadInProgress?.call(cards);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Card> cards)? initial,
    TResult Function(List<Card> cards)? loadInProgress,
    TResult Function(List<Card> cards)? loadSuccess,
    TResult Function(CardFailure failure, List<Card> cards)? failure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(cards);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_Failure value) failure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_Failure value)? failure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress extends CardsState {
  const factory _LoadInProgress({required final List<Card> cards}) =
      _$_LoadInProgress;
  const _LoadInProgress._() : super._();

  @override
  List<Card> get cards;
  @override
  @JsonKey(ignore: true)
  _$$_LoadInProgressCopyWith<_$_LoadInProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadSuccessCopyWith<$Res>
    implements $CardsStateCopyWith<$Res> {
  factory _$$_LoadSuccessCopyWith(
          _$_LoadSuccess value, $Res Function(_$_LoadSuccess) then) =
      __$$_LoadSuccessCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Card> cards});
}

/// @nodoc
class __$$_LoadSuccessCopyWithImpl<$Res>
    extends _$CardsStateCopyWithImpl<$Res, _$_LoadSuccess>
    implements _$$_LoadSuccessCopyWith<$Res> {
  __$$_LoadSuccessCopyWithImpl(
      _$_LoadSuccess _value, $Res Function(_$_LoadSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = null,
  }) {
    return _then(_$_LoadSuccess(
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<Card>,
    ));
  }
}

/// @nodoc

class _$_LoadSuccess extends _LoadSuccess {
  const _$_LoadSuccess({required final List<Card> cards})
      : _cards = cards,
        super._();

  final List<Card> _cards;
  @override
  List<Card> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  String toString() {
    return 'CardsState.loadSuccess(cards: $cards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadSuccess &&
            const DeepCollectionEquality().equals(other._cards, _cards));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cards));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadSuccessCopyWith<_$_LoadSuccess> get copyWith =>
      __$$_LoadSuccessCopyWithImpl<_$_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Card> cards) initial,
    required TResult Function(List<Card> cards) loadInProgress,
    required TResult Function(List<Card> cards) loadSuccess,
    required TResult Function(CardFailure failure, List<Card> cards) failure,
  }) {
    return loadSuccess(cards);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Card> cards)? initial,
    TResult? Function(List<Card> cards)? loadInProgress,
    TResult? Function(List<Card> cards)? loadSuccess,
    TResult? Function(CardFailure failure, List<Card> cards)? failure,
  }) {
    return loadSuccess?.call(cards);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Card> cards)? initial,
    TResult Function(List<Card> cards)? loadInProgress,
    TResult Function(List<Card> cards)? loadSuccess,
    TResult Function(CardFailure failure, List<Card> cards)? failure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(cards);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_Failure value) failure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_Failure value)? failure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess extends CardsState {
  const factory _LoadSuccess({required final List<Card> cards}) =
      _$_LoadSuccess;
  const _LoadSuccess._() : super._();

  @override
  List<Card> get cards;
  @override
  @JsonKey(ignore: true)
  _$$_LoadSuccessCopyWith<_$_LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FailureCopyWith<$Res> implements $CardsStateCopyWith<$Res> {
  factory _$$_FailureCopyWith(
          _$_Failure value, $Res Function(_$_Failure) then) =
      __$$_FailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CardFailure failure, List<Card> cards});

  $CardFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_FailureCopyWithImpl<$Res>
    extends _$CardsStateCopyWithImpl<$Res, _$_Failure>
    implements _$$_FailureCopyWith<$Res> {
  __$$_FailureCopyWithImpl(_$_Failure _value, $Res Function(_$_Failure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
    Object? cards = null,
  }) {
    return _then(_$_Failure(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as CardFailure,
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<Card>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CardFailureCopyWith<$Res> get failure {
    return $CardFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_Failure extends _Failure {
  const _$_Failure(this.failure, {required final List<Card> cards})
      : _cards = cards,
        super._();

  @override
  final CardFailure failure;
  final List<Card> _cards;
  @override
  List<Card> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  String toString() {
    return 'CardsState.failure(failure: $failure, cards: $cards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Failure &&
            (identical(other.failure, failure) || other.failure == failure) &&
            const DeepCollectionEquality().equals(other._cards, _cards));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, failure, const DeepCollectionEquality().hash(_cards));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      __$$_FailureCopyWithImpl<_$_Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Card> cards) initial,
    required TResult Function(List<Card> cards) loadInProgress,
    required TResult Function(List<Card> cards) loadSuccess,
    required TResult Function(CardFailure failure, List<Card> cards) failure,
  }) {
    return failure(this.failure, cards);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Card> cards)? initial,
    TResult? Function(List<Card> cards)? loadInProgress,
    TResult? Function(List<Card> cards)? loadSuccess,
    TResult? Function(CardFailure failure, List<Card> cards)? failure,
  }) {
    return failure?.call(this.failure, cards);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Card> cards)? initial,
    TResult Function(List<Card> cards)? loadInProgress,
    TResult Function(List<Card> cards)? loadSuccess,
    TResult Function(CardFailure failure, List<Card> cards)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this.failure, cards);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure extends CardsState {
  const factory _Failure(final CardFailure failure,
      {required final List<Card> cards}) = _$_Failure;
  const _Failure._() : super._();

  CardFailure get failure;
  @override
  List<Card> get cards;
  @override
  @JsonKey(ignore: true)
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      throw _privateConstructorUsedError;
}
