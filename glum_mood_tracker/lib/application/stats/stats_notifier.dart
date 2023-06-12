import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/models/models.dart';
import '../../infrastructure/repositories/repositories.dart';

part 'stats_notifier.freezed.dart';

@freezed
@freezed
class StoryStats with _$StoryStats {
  const factory StoryStats({
    required int allStoriesCount,
    required double glumAverage,
    required Map<int, int> glumDistribution,
    required Map<DateTime, int> weeklyGlum,
  }) = _StoryStats;
}

@freezed
class TrendingStats with _$TrendingStats {
  const factory TrendingStats({
    required Map<TagModel, int> trendingTags,
    required Map<TagModel, int> trendingMoodsOrGlums,
  }) = _TrendingStats;
}

@freezed
class StatsState with _$StatsState {
  const factory StatsState({
    required StoryStats storyStats,
    required TrendingStats trendingStats,
    required Map<DateTime, int> yearInGlums,
    required bool isLoading,
    required Option<String> errorMessage,
  }) = _StatsState;

  factory StatsState.initial() => const StatsState(
        storyStats: StoryStats(
          allStoriesCount: 0,
          glumAverage: 0.0,
          glumDistribution: {},
          weeklyGlum: {},
        ),
        trendingStats: TrendingStats(
          trendingTags: {},
          trendingMoodsOrGlums: {},
        ),
        yearInGlums: {},
        isLoading: false,
        errorMessage: None(),
      );
}

class StatsNotifier extends StateNotifier<StatsState> {
  final StatsRepository _repository;
  StatsNotifier({required StatsRepository repository})
      : _repository = repository,
        super(StatsState.initial());

  Future<void> fetchStats() async {
    state = state.copyWith(isLoading: true);
    await Future.wait([
      countAllStories(),
      glumAverage(),
      glumDistribution(),
      averageWeek(),
      yearInGlums(),
      trendingTags(),
      tagsByMoodsOrGlums(true),
    ]);
    state = state.copyWith(isLoading: false);
  }

  Future<void> countAllStories() async {
    final failureOrAllStoriesCount = await _repository.countAllStories();
    state = failureOrAllStoriesCount.fold(
      (failure) => state.copyWith(errorMessage: Some(failure.toString())),
      (count) => state.copyWith(
          storyStats: state.storyStats.copyWith(allStoriesCount: count)),
    );
  }

  Future<void> glumAverage() async {
    final failureOrGlumAverage = await _repository.glumAverage();
    state = failureOrGlumAverage.fold(
      (failure) => state.copyWith(errorMessage: Some(failure.toString())),
      (average) => state.copyWith(
          storyStats: state.storyStats.copyWith(glumAverage: average)),
    );
  }

  Future<void> glumDistribution() async {
    final failureOrGlumAverage = await _repository.glumDistribution();
    state = failureOrGlumAverage.fold(
      (failure) => state.copyWith(errorMessage: Some(failure.toString())),
      (distribution) => state.copyWith(
          storyStats:
              state.storyStats.copyWith(glumDistribution: distribution)),
    );
  }

  Future<void> averageWeek() async {
    final failureOrAverageWeek = await _repository.averageWeek();
    state = failureOrAverageWeek.fold(
      (failure) => state.copyWith(errorMessage: Some(failure.toString())),
      (averageWeek) => state.copyWith(
          storyStats: state.storyStats.copyWith(weeklyGlum: averageWeek)),
    );
  }

  Future<void> yearInGlums() async {
    final failureOrAverageWeek = await _repository.yearInGlums();
    state = failureOrAverageWeek.fold(
      (failure) => state.copyWith(errorMessage: Some(failure.toString())),
      (yearInGlums) => state.copyWith(yearInGlums: yearInGlums),
    );
  }

  Future<void> trendingTags() async {
    final stream = _repository.trendingTags();
    stream.listen(
      (failureOrTrendingTags) {
        failureOrTrendingTags.fold(
          (failure) =>
              state = state.copyWith(errorMessage: Some(failure.toString())),
          (trendingTags) {
            state = state.copyWith(
                trendingStats:
                    state.trendingStats.copyWith(trendingTags: trendingTags));
          },
        );
      },
    );
  }

  Future<void> tagsByMoodsOrGlums(bool filterByMoods) async {
    final stream = _repository.tagsByMoodsOrGlums(filterByMoods);
    stream.listen(
      (failureOrTrendingTags) {
        failureOrTrendingTags.fold(
          (failure) =>
              state = state.copyWith(errorMessage: Some(failure.toString())),
          (trendingTags) {
            state = state.copyWith(
                trendingStats: state.trendingStats
                    .copyWith(trendingMoodsOrGlums: trendingTags));
          },
        );
      },
    );
  }
}
