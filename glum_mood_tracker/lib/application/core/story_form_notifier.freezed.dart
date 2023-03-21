// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_form_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StoryFormState {
  StoryModel get story => throw _privateConstructorUsedError;
  List<TagModel> get selectedTags => throw _privateConstructorUsedError;
  bool get isEditing => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  Option<Either<StoryFailure, Unit>> get failureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoryFormStateCopyWith<StoryFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryFormStateCopyWith<$Res> {
  factory $StoryFormStateCopyWith(
          StoryFormState value, $Res Function(StoryFormState) then) =
      _$StoryFormStateCopyWithImpl<$Res, StoryFormState>;
  @useResult
  $Res call(
      {StoryModel story,
      List<TagModel> selectedTags,
      bool isEditing,
      bool isSaving,
      Option<Either<StoryFailure, Unit>> failureOrSuccess});

  $StoryModelCopyWith<$Res> get story;
}

/// @nodoc
class _$StoryFormStateCopyWithImpl<$Res, $Val extends StoryFormState>
    implements $StoryFormStateCopyWith<$Res> {
  _$StoryFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? story = null,
    Object? selectedTags = null,
    Object? isEditing = null,
    Object? isSaving = null,
    Object? failureOrSuccess = null,
  }) {
    return _then(_value.copyWith(
      story: null == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as StoryModel,
      selectedTags: null == selectedTags
          ? _value.selectedTags
          : selectedTags // ignore: cast_nullable_to_non_nullable
              as List<TagModel>,
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
              as Option<Either<StoryFailure, Unit>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StoryModelCopyWith<$Res> get story {
    return $StoryModelCopyWith<$Res>(_value.story, (value) {
      return _then(_value.copyWith(story: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StoryFormStateCopyWith<$Res>
    implements $StoryFormStateCopyWith<$Res> {
  factory _$$_StoryFormStateCopyWith(
          _$_StoryFormState value, $Res Function(_$_StoryFormState) then) =
      __$$_StoryFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StoryModel story,
      List<TagModel> selectedTags,
      bool isEditing,
      bool isSaving,
      Option<Either<StoryFailure, Unit>> failureOrSuccess});

  @override
  $StoryModelCopyWith<$Res> get story;
}

/// @nodoc
class __$$_StoryFormStateCopyWithImpl<$Res>
    extends _$StoryFormStateCopyWithImpl<$Res, _$_StoryFormState>
    implements _$$_StoryFormStateCopyWith<$Res> {
  __$$_StoryFormStateCopyWithImpl(
      _$_StoryFormState _value, $Res Function(_$_StoryFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? story = null,
    Object? selectedTags = null,
    Object? isEditing = null,
    Object? isSaving = null,
    Object? failureOrSuccess = null,
  }) {
    return _then(_$_StoryFormState(
      story: null == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as StoryModel,
      selectedTags: null == selectedTags
          ? _value._selectedTags
          : selectedTags // ignore: cast_nullable_to_non_nullable
              as List<TagModel>,
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
              as Option<Either<StoryFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_StoryFormState extends _StoryFormState {
  const _$_StoryFormState(
      {required this.story,
      required final List<TagModel> selectedTags,
      required this.isEditing,
      required this.isSaving,
      required this.failureOrSuccess})
      : _selectedTags = selectedTags,
        super._();

  @override
  final StoryModel story;
  final List<TagModel> _selectedTags;
  @override
  List<TagModel> get selectedTags {
    if (_selectedTags is EqualUnmodifiableListView) return _selectedTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedTags);
  }

  @override
  final bool isEditing;
  @override
  final bool isSaving;
  @override
  final Option<Either<StoryFailure, Unit>> failureOrSuccess;

  @override
  String toString() {
    return 'StoryFormState(story: $story, selectedTags: $selectedTags, isEditing: $isEditing, isSaving: $isSaving, failureOrSuccess: $failureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoryFormState &&
            (identical(other.story, story) || other.story == story) &&
            const DeepCollectionEquality()
                .equals(other._selectedTags, _selectedTags) &&
            (identical(other.isEditing, isEditing) ||
                other.isEditing == isEditing) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.failureOrSuccess, failureOrSuccess) ||
                other.failureOrSuccess == failureOrSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      story,
      const DeepCollectionEquality().hash(_selectedTags),
      isEditing,
      isSaving,
      failureOrSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoryFormStateCopyWith<_$_StoryFormState> get copyWith =>
      __$$_StoryFormStateCopyWithImpl<_$_StoryFormState>(this, _$identity);
}

abstract class _StoryFormState extends StoryFormState {
  const factory _StoryFormState(
          {required final StoryModel story,
          required final List<TagModel> selectedTags,
          required final bool isEditing,
          required final bool isSaving,
          required final Option<Either<StoryFailure, Unit>> failureOrSuccess}) =
      _$_StoryFormState;
  const _StoryFormState._() : super._();

  @override
  StoryModel get story;
  @override
  List<TagModel> get selectedTags;
  @override
  bool get isEditing;
  @override
  bool get isSaving;
  @override
  Option<Either<StoryFailure, Unit>> get failureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$$_StoryFormStateCopyWith<_$_StoryFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
