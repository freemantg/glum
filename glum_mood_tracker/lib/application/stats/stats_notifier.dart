import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glum_mood_tracker/infrastructure/stats_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/models/models.dart';

part 'stats_notifier.freezed.dart';

@freezed
class StatsState with _$StatsState {
  const StatsState._();
  const factory StatsState({
    required int allStoriesCount,
    required double glumAverage,
    required Map<int, int> glumDistribution,
    required Map<DateTime, int> weeklyGlum,
    required Map<TagModel, int> trendingTags,
    required Map<TagModel, int> trendingMoodsOrGlums,
    required Map<DateTime, int> yearInGlums,
    required bool isLoading,
    required bool showErrorMessage,
  }) = _StatsState;

  factory StatsState.initial() => const StatsState(
        allStoriesCount: 0,
        glumAverage: 0.0,
        glumDistribution: {},
        weeklyGlum: {},
        trendingTags: {},
        trendingMoodsOrGlums: {},
        yearInGlums: {},
        isLoading: false,
        showErrorMessage: false,
      );
}

class StatsNotifier extends StateNotifier<StatsState> {
  final StatsRepository _repository;
  StatsNotifier({required StatsRepository repository})
      : _repository = repository,
        super(StatsState.initial());

  Future<void> fetchStats() async {
    state = state.copyWith(isLoading: true);
    Future.wait([
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
      (failure) => state.copyWith(showErrorMessage: true),
      (count) => state.copyWith(allStoriesCount: count),
    );
  }

  Future<void> glumAverage() async {
    final failureOrGlumAverage = await _repository.glumAverage();
    state = failureOrGlumAverage.fold(
      (failure) => state.copyWith(showErrorMessage: true),
      (average) => state.copyWith(glumAverage: average),
    );
  }

  Future<void> glumDistribution() async {
    final failureOrGlumAverage = await _repository.glumDistribution();
    state = failureOrGlumAverage.fold(
      (failure) => state.copyWith(showErrorMessage: true),
      (distribution) => state.copyWith(glumDistribution: distribution),
    );
  }

  Future<void> averageWeek() async {
    final failureOrAverageWeek = await _repository.averageWeek();
    state = failureOrAverageWeek.fold(
      (failure) => state.copyWith(showErrorMessage: true),
      (averageWeek) => state.copyWith(weeklyGlum: averageWeek),
    );
  }

  Future<void> yearInGlums() async {
    final failureOrAverageWeek = await _repository.yearInGlums();
    state = failureOrAverageWeek.fold(
      (failure) => state.copyWith(showErrorMessage: true),
      (yearInGlums) => state.copyWith(yearInGlums: yearInGlums),
    );
  }

  Future<void> trendingTags() async {
    final stream = _repository.trendingTags();
    stream.listen(
      (failureOrTrendingTags) {
        failureOrTrendingTags.fold(
          (failure) => state = state.copyWith(showErrorMessage: true),
          (trendingTags) {
            state = state.copyWith(trendingTags: trendingTags);
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
          (failure) => state = state.copyWith(showErrorMessage: true),
          (trendingTags) {
            state = state.copyWith(trendingMoodsOrGlums: trendingTags);
          },
        );
      },
    );
  }
}
