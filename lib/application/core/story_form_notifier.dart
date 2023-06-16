import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/failures/failures.dart';
import '../../domain/models/models.dart';
import '../../infrastructure/repositories/repositories.dart';

part 'story_form_notifier.freezed.dart';

@freezed
class StoryFormState with _$StoryFormState {
  const StoryFormState._();
  const factory StoryFormState({
    required StoryModel story,
    required List<TagModel> selectedTags,
    required bool isEditing,
    required bool isSaving,
    required Option<Either<StoryFailure, Unit>> failureOrSuccess,
  }) = _StoryFormState;

  factory StoryFormState.initial() => StoryFormState(
        story: StoryModel.empty(),
        selectedTags: [],
        isEditing: false,
        isSaving: false,
        failureOrSuccess: none(),
      );
}

class StoryFormNotifier extends StateNotifier<StoryFormState> {
  final StoryRepository _storyRepository;
  final PhotoRepository _photoRepository;

  StoryFormNotifier({
    required StoryRepository storyRepository,
    required PhotoRepository photoRepository,
  })  : _storyRepository = storyRepository,
        _photoRepository = photoRepository,
        super(StoryFormState.initial());

  Future<void> initialiseStory(StoryModel? story) async {
    if (story == null) return;
    state = state.copyWith(
      story: story,
      selectedTags: story.tags,
      isEditing: true,
    );
  }

  Future<void> save() async {
    _updateStorySaving(true);
    final failureOrSuccess = await _saveStory();
    _updateFailureOrSuccess(optionOf(failureOrSuccess));
    _updateStorySaving(false);
  }

  void titleChanged(String str) =>
      _updateStory(state.story.copyWith(title: str));

  void ratingChanged(int rating) =>
      _updateStory(state.story.copyWith(glumRating: rating));

  void descriptionChanged(String str) =>
      _updateStory(state.story.copyWith(description: str));

  void dateChanged(DateTime date) =>
      _updateStory(state.story.copyWith(date: date));

  Future<void> photoChanged() async {
    final failureOrPhoto = await _photoRepository.pickAndCropPhoto();
    failureOrPhoto.fold(
      (failure) {
        _updateFailureOrSuccess(
            optionOf(left(const StoryFailure.unexpected())));
      },
      (photo) async {
        await _photoRepository.savePhoto(photo);
        _updateStory(state.story.copyWith(photos: [photo]));
      },
    );
  }

  void toggleTag(TagModel tag) {
    _updateSelectedTags(
      state.selectedTags.contains(tag)
          ? state.selectedTags.where((t) => t != tag).toList()
          : [...state.selectedTags, tag],
    );
  }

  Future<Either<StoryFailure, Unit>> _saveStory() => state.isEditing
      ? _storyRepository
          .updateStory(state.story.copyWith(tags: state.selectedTags))
      : _storyRepository
          .addStory(state.story.copyWith(tags: state.selectedTags));

  void _updateStory(StoryModel story) => state = state.copyWith(story: story);

  void _updateStorySaving(bool isSaving) =>
      state = state.copyWith(isSaving: isSaving);

  void _updateFailureOrSuccess(
          Option<Either<StoryFailure, Unit>> failureOrSuccess) =>
      state = state.copyWith(failureOrSuccess: failureOrSuccess);

  void _updateSelectedTags(List<TagModel> selectedTags) =>
      state = state.copyWith(selectedTags: selectedTags);
}
