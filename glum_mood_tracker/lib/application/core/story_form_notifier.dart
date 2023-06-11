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
      isEditing: true,
      story: story,
      selectedTags: story.tags,
    );
  }

  Future<void> save() async {
    state = state.copyWith(isSaving: true);
    final failureOrSuccess = state.isEditing
        ? await _storyRepository.updateStory(
            state.story.copyWith(tags: state.selectedTags),
          )
        : await _storyRepository.addStory(
            state.story.copyWith(tags: state.selectedTags),
          );
    state = state.copyWith(
      isSaving: false,
      failureOrSuccess: optionOf(failureOrSuccess),
    );
  }

  void titleChanged(String str) =>
      state = state.copyWith(story: state.story.copyWith(title: str));

  void ratingChanged(int rating) =>
      state = state.copyWith(story: state.story.copyWith(glumRating: rating));

  void descriptionChanged(String str) =>
      state = state.copyWith(story: state.story.copyWith(description: str));

  void dateChanged(DateTime date) =>
      state = state.copyWith(story: state.story.copyWith(date: date));

  Future<void> photoChanged() async {
    final failureOrPhoto = await _photoRepository.pickAndCropPhoto();
    failureOrPhoto.fold(
      (failure) => state = state.copyWith(
          failureOrSuccess: optionOf(left(const StoryFailure.unexpected()))),
      (photo) async {
        await _photoRepository.savePhoto(photo);
        state = state.copyWith(story: state.story.copyWith(photos: [photo]));
      },
    );
  }

  void toggleTag(TagModel tag) {
    state = state.copyWith(
      selectedTags: state.selectedTags.contains(tag)
          ? state.selectedTags.where((t) => t != tag).toList()
          : [...state.selectedTags, tag],
    );
  }
}
