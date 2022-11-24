import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glum_mood_tracker/infrastructure/story_repository.dart';

import '../../domain/story.dart';
import '../../domain/story_failure.dart';

part 'story_form_notifier.freezed.dart';

@freezed
class StoryFormState with _$StoryFormState {
  const StoryFormState._();
  const factory StoryFormState({
    required Story story,
    required bool isEditing,
    required bool isSaving,
    required Option<Either<StoryFailure, Unit>> failureOrSuccess,
  }) = _StoryFormState;

  factory StoryFormState.initial() => StoryFormState(
        story: Story.empty(),
        isEditing: false,
        isSaving: false,
        failureOrSuccess: none(),
      );
}

class StoryFormNotifier extends StateNotifier<StoryFormState> {
  final StoryRepository _repository;

  StoryFormNotifier(this._repository) : super(StoryFormState.initial());

  Future<void> save() async {
    final successOrFailure = await _repository.createStory(state.story);
    state = successOrFailure.fold(
      (l) => state.copyWith(failureOrSuccess: optionOf(successOrFailure)),
      (r) => state.copyWith(isSaving: false),
    );
  }

  Future<void> titleChanged(String str) async =>
      state = state.copyWith(story: state.story.copyWith(title: str));

  Future<void> ratingChanged(int rating) async =>
      state = state.copyWith(story: state.story.copyWith(glumRating: rating));

  Future<void> descriptionChanged(String str) async =>
      state = state.copyWith(story: state.story.copyWith(description: str));

  Future<void> dateChanged(DateTime date) async =>
      state = state.copyWith(story: state.story.copyWith(date: date));
}
