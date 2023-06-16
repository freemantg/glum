import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glum_mood_tracker/application/notifiers.dart';
import 'package:glum_mood_tracker/domain/models/models.dart';
import 'package:glum_mood_tracker/infrastructure/repositories/repositories.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'stats_notifier_test.mocks.dart';

@GenerateMocks([StatsRepository])
void main() {
  late ProviderContainer container;
  late MockStatsRepository mockRepository;
  late StatsNotifier statsNotifier;

  setUp(
    () {
      container = ProviderContainer();
      mockRepository = MockStatsRepository();
      statsNotifier = StatsNotifier(repository: mockRepository);
    },
  );

  tearDown(() => container.dispose());

  group('StatsNotifier', () {
    test('fetchStats updates the state correctly', () async {
      // Mock repository methods and responses
      when(mockRepository.countAllStories())
          .thenAnswer((_) async => const Right(10));
      when(mockRepository.glumAverage())
          .thenAnswer((_) async => const Right(4.5));
      when(mockRepository.glumDistribution())
          .thenAnswer((_) async => const Right({1: 5, 2: 10, 3: 7}));
      when(mockRepository.averageWeek()).thenAnswer((_) async => Right({
            DateTime(2022, 1, 1): 2,
            DateTime(2022, 1, 8): 4,
            DateTime(2022, 1, 15): 6,
          }));
      when(mockRepository.yearInGlums()).thenAnswer((_) async => Right({
            DateTime(2022): 20,
            DateTime(2023): 30,
          }));
      when(mockRepository.trendingTags()).thenAnswer((_) =>
          Stream.value(Right({const TagModel(id: 1, title: 'Tag1'): 5})));
      when(mockRepository.tagsByMoodsOrGlums(true)).thenAnswer((_) =>
          Stream.value(Right({const TagModel(id: 2, title: 'Tag2'): 3})));

      // Call the method being tested
      await statsNotifier.fetchStats();

      // Verify the state updates
      final state = statsNotifier.state;
      expect(state.isLoading, false);
      expect(state.errorMessage, const None());
      expect(state.storyStats.allStoriesCount, 10);
      expect(state.storyStats.glumAverage, 4.5);
      expect(state.storyStats.glumDistribution, {1: 5, 2: 10, 3: 7});
      expect(state.storyStats.weeklyGlum, {
        DateTime(2022, 1, 1): 2,
        DateTime(2022, 1, 8): 4,
        DateTime(2022, 1, 15): 6,
      });
      expect(state.yearInGlums, {
        DateTime(2022): 20,
        DateTime(2023): 30,
      });
      expect(state.trendingStats.trendingTags,
          {const TagModel(id: 1, title: 'Tag1'): 5});
      expect(state.trendingStats.trendingMoodsOrGlums,
          {const TagModel(id: 2, title: 'Tag2'): 3});
    });
  });
}
