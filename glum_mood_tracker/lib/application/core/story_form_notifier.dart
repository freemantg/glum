import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glum_mood_tracker/infrastructure/story_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

import '../../domain/photo.dart';
import '../../domain/story.dart';
import '../../domain/story_failure.dart';
import '../../domain/tag.dart';

part 'story_form_notifier.freezed.dart';

@freezed
class StoryFormState with _$StoryFormState {
  const StoryFormState._();
  const factory StoryFormState({
    required Story story,
    required List<Tag> selectedTags,
    required bool isEditing,
    required bool isSaving,
    required Option<Either<StoryFailure, Unit>> failureOrSuccess,
  }) = _StoryFormState;

  factory StoryFormState.initial() => StoryFormState(
        story: Story.empty(),
        selectedTags: [],
        isEditing: false,
        isSaving: false,
        failureOrSuccess: none(),
      );
}

class StoryFormNotifier extends StateNotifier<StoryFormState> {
  final StoryRepository _storyRepository;

  StoryFormNotifier(this._storyRepository) : super(StoryFormState.initial());

  Future<void> initialiseStory(Story? story) async {
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

  Future<void> titleChanged(String str) async =>
      state = state.copyWith(story: state.story.copyWith(title: str));

  Future<void> ratingChanged(int rating) async =>
      state = state.copyWith(story: state.story.copyWith(glumRating: rating));

  Future<void> descriptionChanged(String str) async =>
      state = state.copyWith(story: state.story.copyWith(description: str));

  Future<void> dateChanged(DateTime date) async =>
      state = state.copyWith(story: state.story.copyWith(date: date));

  Future<void> photoChanged() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final fileName = path.basename(pickedFile.path);
      final photo = Photo(
        file: File(pickedFile.path),
        fileName: fileName,
        filePath: pickedFile.path,
      );
      state = state.copyWith(story: state.story.copyWith(photos: [photo]));
    }
  }

  Future<void> toggleTag(Tag tag) async {
    List<Tag> updatedTags = List.empty();
    if (state.selectedTags.contains(tag)) {
      updatedTags = List.from(state.selectedTags)..remove(tag);
    } else {
      updatedTags = List.from(state.selectedTags)..add(tag);
    }
    state = state.copyWith(selectedTags: updatedTags);
  }
}
