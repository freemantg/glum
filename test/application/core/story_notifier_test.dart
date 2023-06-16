import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glum_mood_tracker/application/notifiers.dart';
import 'package:glum_mood_tracker/domain/failures/failures.dart';
import 'package:glum_mood_tracker/domain/models/models.dart';
import 'package:glum_mood_tracker/infrastructure/repositories/repositories.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'story_notifier_test.mocks.dart';

@GenerateMocks([StoryRepository])
void main() {
  late ProviderContainer container;
  late MockStoryRepository mockRepository;
  late StoryNotifier storyNotifier;

  setUp(() {
    container = ProviderContainer();
    mockRepository = MockStoryRepository();
    storyNotifier = StoryNotifier(storyRepository: mockRepository);
  });

  tearDown(() {
    container.dispose();
  });

  group('StoryNotifier', () {
    test('watchStoriesByMonthYear updates the state correctly on success',
        () async {
      // Mock repository method and response
      final stories = [
        StoryModel(
          id: 1,
          title: 'Story 1',
          description: 'Description 1',
          glumRating: 3,
          date: DateTime(2022, 1, 1),
          tags: [],
          photos: [],
        ),
        StoryModel(
          id: 2,
          title: 'Story 2',
          description: 'Description 2',
          glumRating: 4,
          date: DateTime(2022, 1, 2),
          tags: [],
          photos: [],
        ),
      ];
      final monthYear = DateTime(2022, 1);
      when(mockRepository.watchStoriesByMonthYear(monthYear))
          .thenAnswer((_) => Stream.value(right(stories)));

      // Call the method being tested
      await storyNotifier.watchStoriesByMonthYear(monthYear);

      // Wait for the state to update
      await Future.delayed(Duration.zero);

      // Verify the state updates
      final state = storyNotifier.state;
      expect(state, StoryState.loadSuccess(stories: stories));
      expect(state.stories, stories);
    });

    test('watchStoriesByMonthYear updates the state correctly on failure',
        () async {
      // Mock repository method and response
      const failure = StoryFailure.unexpected();
      final monthYear = DateTime(2022, 1);

      when(mockRepository.watchStoriesByMonthYear(monthYear))
          .thenAnswer((_) => Stream.error(failure));

      // Call the method being tested
      await storyNotifier.watchStoriesByMonthYear(monthYear);

      // Wait for the state to update
      await Future.delayed(Duration.zero);

      // Verify the state updates
      final state = storyNotifier.state;
      expect(state, const StoryState.failure(failure, stories: []));
      expect(state.stories, []);
    });

    test('deleteStory updates the state correctly on success', () async {
      // Mock repository method and response
      const storyId = 1;
      when(mockRepository.deleteStory(storyId))
          .thenAnswer((_) async => const Right(unit));

      // Set initial state with some stories
      final initialStories = [
        StoryModel(
          id: 1,
          title: 'Story 1',
          description: 'Description 1',
          glumRating: 3,
          date: DateTime(2022, 1, 1),
          tags: [],
          photos: [],
        ),
        StoryModel(
          id: 2,
          title: 'Story 2',
          description: 'Description 2',
          glumRating: 4,
          date: DateTime(2022, 1, 2),
          tags: [],
          photos: [],
        ),
      ];
      storyNotifier = StoryNotifier(storyRepository: mockRepository);
      storyNotifier.state = StoryState.loadSuccess(stories: initialStories);

      // Call the method being tested
      await storyNotifier.deleteStory(storyId);

      // Verify the state updates
      final state = storyNotifier.state;
      expect(state, StoryState.initial(stories: initialStories));
      expect(state.stories, initialStories);
    });

    test('deleteStory updates the state correctly on failure', () async {
      // Mock repository method and response
      const failure = StoryFailure.unexpected();
      const storyId = 1;
      when(mockRepository.deleteStory(storyId))
          .thenAnswer((_) async => const Left(failure));

      // Set initial state with some stories
      final initialStories = [
        StoryModel(
          id: 1,
          title: 'Story 1',
          description: 'Description 1',
          glumRating: 3,
          date: DateTime(2022, 1, 1),
          tags: [],
          photos: [],
        ),
        StoryModel(
          id: 2,
          title: 'Story 2',
          description: 'Description 2',
          glumRating: 4,
          date: DateTime(2022, 1, 2),
          tags: [],
          photos: [],
        ),
      ];
      storyNotifier = StoryNotifier(storyRepository: mockRepository);
      storyNotifier.state = StoryState.loadSuccess(stories: initialStories);

      // Call the method being tested
      await storyNotifier.deleteStory(storyId);

      // Verify the state updates
      final state = storyNotifier.state;
      expect(state, StoryState.failure(failure, stories: initialStories));
      expect(state.stories, initialStories);
    });
  });
}
