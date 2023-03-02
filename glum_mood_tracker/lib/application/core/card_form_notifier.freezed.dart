// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_form_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CardFormState {
  Card get card => throw _privateConstructorUsedError;
  bool get isEditing => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  Option<Either<CardFailure, Unit>> get failureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardFormStateCopyWith<CardFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardFormStateCopyWith<$Res> {
  factory $CardFormStateCopyWith(
          CardFormState value, $Res Function(CardFormState) then) =
      _$CardFormStateCopyWithImpl<$Res, CardFormState>;
  @useResult
  $Res call(
      {Card card,
      bool isEditing,
      bool isSaving,
      Option<Either<CardFailure, Unit>> failureOrSuccess});

  $CardCopyWith<$Res> get card;
}

/// @nodoc
class _$CardFormStateCopyWithImpl<$Res, $Val extends CardFormState>
    implements $CardFormStateCopyWith<$Res> {
  _$CardFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? card = null,
    Object? isEditing = null,
    Object? isSaving = null,
    Object? failureOrSuccess = null,
  }) {
    return _then(_value.copyWith(
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as Card,
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccess: null == failureOrSuccess
          ? _value.failureOrSuccess
          : failureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<CardFailure, Unit>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CardCopyWith<$Res> get card {
    return $CardCopyWith<$Res>(_value.card, (value) {
      return _then(_value.copyWith(card: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CardFormStateCopyWith<$Res>
    implements $CardFormStateCopyWith<$Res> {
  factory _$$_CardFormStateCopyWith(
          _$_CardFormState value, $Res Function(_$_CardFormState) then) =
      __$$_CardFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Card card,
      bool isEditing,
      bool isSaving,
      Option<Either<CardFailure, Unit>> failureOrSuccess});

  @override
  $CardCopyWith<$Res> get card;
}

/// @nodoc
class __$$_CardFormStateCopyWithImpl<$Res>
    extends _$CardFormStateCopyWithImpl<$Res, _$_CardFormState>
    implements _$$_CardFormStateCopyWith<$Res> {
  __$$_CardFormStateCopyWithImpl(
      _$_CardFormState _value, $Res Function(_$_CardFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? card = null,
    Object? isEditing = null,
    Object? isSaving = null,
    Object? failureOrSuccess = null,
  }) {
    return _then(_$_CardFormState(
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as Card,
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccess: null == failureOrSuccess
          ? _value.failureOrSuccess
          : failureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<CardFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_CardFormState extends _CardFormState {
  const _$_CardFormState(
      {required this.card,
      required this.isEditing,
      required this.isSaving,
      required this.failureOrSuccess})
      : super._();

  @override
  final Card card;
  @override
  final bool isEditing;
  @override
  final bool isSaving;
  @override
  final Option<Either<CardFailure, Unit>> failureOrSuccess;

  @override
  String toString() {
    return 'CardFormState(card: $card, isEditing: $isEditing, isSaving: $isSaving, failureOrSuccess: $failureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardFormState &&
            (identical(other.card, card) || other.card == card) &&
            (identical(other.isEditing, isEditing) ||
                other.isEditing == isEditing) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.failureOrSuccess, failureOrSuccess) ||
                other.failureOrSuccess == failureOrSuccess));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, card, isEditing, isSaving, failureOrSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardFormStateCopyWith<_$_CardFormState> get copyWith =>
      __$$_CardFormStateCopyWithImpl<_$_CardFormState>(this, _$identity);
}

abstract class _CardFormState extends CardFormState {
  const factory _CardFormState(
          {required final Card card,
          required final bool isEditing,
          required final bool isSaving,
          required final Option<Either<CardFailure, Unit>> failureOrSuccess}) =
      _$_CardFormState;
  const _CardFormState._() : super._();

  @override
  Card get card;
  @override
  bool get isEditing;
  @override
  bool get isSaving;
  @override
  Option<Either<CardFailure, Unit>> get failureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$$_CardFormStateCopyWith<_$_CardFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
