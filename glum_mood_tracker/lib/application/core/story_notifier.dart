import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/failures/failures.dart';
import '../../domain/models/models.dart';
import '../../infrastructure/repositories/repositories.dart';

part 'story_notifier.freezed.dart';

@freezed
class StoryState with _$StoryState {
  const StoryState._();
  const factory StoryState.initial({required List<StoryModel> stories}) =
      _Initial;
  const factory StoryState.loadInProgress({required List<StoryModel> stories}) =
      _LoadInProgress;
  const factory StoryState.loadSuccess({required List<StoryModel> stories}) =
      _LoadSuccess;
  const factory StoryState.failure(StoryFailure failure,
      {required List<StoryModel> stories}) = _Failure;
}

class StoryNotifier extends StateNotifier<StoryState> {
  StoryNotifier({required StoryRepository storyRepository})
      : _storyRepository = storyRepository,
        super(const StoryState.initial(stories: []));

  final StoryRepository _storyRepository;

  Future<void> watchStoriesByMonthYear(DateTime monthYear) async {
    state = StoryState.loadInProgress(stories: state.stories);
    final storyStream = _storyRepository.watchStoriesByMonthYear(monthYear);
    storyStream.listen(
      (successOrFailure) {
        successOrFailure.fold(
          (failure) =>
              state = StoryState.failure(failure, stories: state.stories),
          (stories) => state = StoryState.loadSuccess(stories: stories),
        );
      },
    );
  }

  Future<void> deleteStory(int storyId) async {
    state = StoryState.loadInProgress(stories: state.stories);
    final failureOrSuccess = await _storyRepository.deleteStory(storyId);
    state = failureOrSuccess.fold(
      (failure) => StoryState.failure(failure, stories: state.stories),
      (success) => StoryState.initial(stories: state.stories),
    );
  }
}
