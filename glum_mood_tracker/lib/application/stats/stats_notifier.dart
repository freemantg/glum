import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glum_mood_tracker/infrastructure/stats_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/tag.dart';

part 'stats_notifier.freezed.dart';

@freezed
class StatsState with _$StatsState {
  const StatsState._();
  const factory StatsState({
    required int allStoriesCount,
    required double glumAverage,
    required Map<int, double> glumDistribution,
    required Map<DateTime, int> weeklyGlum,
    required List<Tag> trendingTags,
    required List<Tag> trendingMoodsOrGlums,
    required Map<DateTime, int> yearInGlums,
    required bool isLoading,
    required bool showErrorMessage,
  }) = _StatsState;

  factory StatsState.initial() => const StatsState(
        allStoriesCount: 0,
        glumAverage: 0.0,
        glumDistribution: {},
        weeklyGlum: {},
        trendingTags: [],
        trendingMoodsOrGlums: [],
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
    await countAllStories();
    await glumAverage();
    await glumDistribution();
    await averageWeek();
    await yearInGlums();
  }

  Future<void> trendingTagsByCategoryToggle() async {}

  Future<void> countAllStories() async {
    state = state.copyWith(isLoading: true);
    final failureOrAllStoriesCount = await _repository.countAllStories();
    state = failureOrAllStoriesCount.fold(
      (failure) => state.copyWith(showErrorMessage: true),
      (count) => state.copyWith(allStoriesCount: count),
    );
    state = state.copyWith(isLoading: false);
  }

  Future<void> glumAverage() async {
    state = state.copyWith(isLoading: true);
    final failureOrGlumAverage = await _repository.glumAverage();
    state = failureOrGlumAverage.fold(
      (failure) => state.copyWith(showErrorMessage: true),
      (average) => state.copyWith(glumAverage: average),
    );
    state = state.copyWith(isLoading: false);
  }

  Future<void> glumDistribution() async {
    state = state.copyWith(isLoading: true);
    final failureOrGlumAverage = await _repository.glumDistribution();
    state = failureOrGlumAverage.fold(
      (failure) => state.copyWith(showErrorMessage: true),
      (distribution) => state.copyWith(glumDistribution: distribution),
    );
    state = state.copyWith(isLoading: false);
  }

  Future<void> averageWeek() async {
    state = state.copyWith(isLoading: true);
    final failureOrAverageWeek = await _repository.averageWeek();
    state = failureOrAverageWeek.fold(
      (failure) => state.copyWith(showErrorMessage: true),
      (averageWeek) => state.copyWith(weeklyGlum: averageWeek),
    );
    state = state.copyWith(isLoading: false);
  }

  Future<void> yearInGlums() async {
    state = state.copyWith(isLoading: true);
    final failureOrAverageWeek = await _repository.yearInGlums();
    state = failureOrAverageWeek.fold(
      (failure) => state.copyWith(showErrorMessage: true),
      (yearInGlums) => state.copyWith(yearInGlums: yearInGlums),
    );
    state = state.copyWith(isLoading: false);
  }
}
