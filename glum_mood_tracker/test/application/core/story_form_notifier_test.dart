import 'package:flutter_test/flutter_test.dart';
import 'package:glum_mood_tracker/application/notifiers.dart';
import 'package:glum_mood_tracker/domain/models/models.dart';
import 'package:glum_mood_tracker/infrastructure/repositories/repositories.dart';
import 'package:mockito/annotations.dart';

import 'story_form_notifier_test.mocks.dart';

@GenerateMocks([StoryRepository, PhotoRepository])
void main() {
  group(
    'StoryFormNotifier',
    () {
      late StoryFormNotifier storyFormNotifier;
      late MockStoryRepository mockStoryRepository;
      late MockPhotoRepository mockPhotoRepository;

      setUp(() {
        mockStoryRepository = MockStoryRepository();
        mockPhotoRepository = MockPhotoRepository();
        storyFormNotifier = StoryFormNotifier(
          storyRepository: mockStoryRepository,
          photoRepository: mockPhotoRepository,
        );
      });

      // Initialising story
      test(
        'should initialise story with given story model',
        () async {
          final testStory = StoryModel(
            title: 'test title',
            description: 'test description',
            glumRating: 3,
            date: DateTime(2023, 1, 1),
            tags: [],
            photos: [],
          );

          await storyFormNotifier.initialiseStory(testStory);

          expect(
            storyFormNotifier.state.story,
            equals(testStory),
            reason: 'state should contain provided story model',
          );
        },
      );

      // Changing title
      test('should change title', () {
        const title = "Test title";

        storyFormNotifier.titleChanged(title);

        expect(
          storyFormNotifier.state.story.title,
          equals(title),
          reason: 'state should contain updated title',
        );
      });

      // Changing rating
      test('should change rating', () {
        const rating = 4;

        storyFormNotifier.ratingChanged(rating);

        expect(
          storyFormNotifier.state.story.glumRating,
          equals(rating),
          reason: 'state should contain updated rating',
        );
      });

      // Changing description
      test('should change description', () {
        const description = "Test description";

        storyFormNotifier.descriptionChanged(description);

        expect(
          storyFormNotifier.state.story.description,
          equals(description),
          reason: 'state should contain updated description',
        );
      });

      // Changing date
      test('should change date', () {
        final date = DateTime.now();

        storyFormNotifier.dateChanged(date);

        expect(
          storyFormNotifier.state.story.date,
          equals(date),
          reason: 'state should contain updated date',
        );
      });

      // Toggling a tag
      test('should toggle a tag', () {
        const tag = TagModel(id: 1, title: 'test tag');

        storyFormNotifier.toggleTag(tag);

        expect(
          storyFormNotifier.state.selectedTags.contains(tag),
          isTrue,
          reason: 'state should contain toggled tag',
        );
      });
    },
  );
}
