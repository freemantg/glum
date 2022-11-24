import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glum_mood_tracker/domain/story_failure.dart';

import '../../domain/story.dart';
import '../../infrastructure/story_repository.dart';

part 'stories_notifier.freezed.dart';

@freezed
class StoriesState with _$StoriesState {
  const StoriesState._();
  const factory StoriesState.initial({required List<Story> stories}) = _Initial;
  const factory StoriesState.loadInProgress({required List<Story> stories}) =
      _LoadInProgress;
  const factory StoriesState.loadSuccess({required List<Story> stories}) =
      _LoadSuccess;
  const factory StoriesState.failure(StoryFailure failure,
      {required List<Story> stories}) = _Failure;
}

class StoriesNotifier extends StateNotifier<StoriesState> {
  StoriesNotifier(this._repository)
      : super(const StoriesState.initial(stories: []));

  final StoryRepository _repository;

  Future<void> watchStoryStream() async {
    state = StoriesState.loadInProgress(stories: state.stories);
    final storyStream = _repository.watchAllStories();
    storyStream.listen(
      (successOrFailure) {
        successOrFailure.fold(
          (failure) =>
              state = StoriesState.failure(failure, stories: state.stories),
          (stories) => state = StoriesState.loadSuccess(stories: stories),
        );
      },
    );
  }

  Future<void> createStory(Story story) async {}
}
