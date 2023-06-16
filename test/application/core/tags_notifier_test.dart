import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glum_mood_tracker/application/notifiers.dart';
import 'package:glum_mood_tracker/domain/failures/failures.dart';
import 'package:glum_mood_tracker/domain/models/models.dart';
import 'package:glum_mood_tracker/infrastructure/repositories/repositories.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'tags_notifier_test.mocks.dart';

@GenerateMocks([TagRepository])
void main() {
  late ProviderContainer container;
  late MockTagRepository mockRepository;
  late TagNotifier tagNotifier;

  setUp(() {
    container = ProviderContainer();
    mockRepository = MockTagRepository();
    tagNotifier = TagNotifier(mockRepository);
  });

  tearDown(() {
    container.dispose();
  });

  group('TagNotifier', () {
    test('addTag calls repository to add a new tag', () async {
      // Mock repository method
      const tagName = 'New Tag';
      const tag = TagModel(id: null, title: tagName);
      when(mockRepository.addTag(tag))
          .thenAnswer((_) async => const Right(unit));

      // Call the method being tested
      await tagNotifier.addTag(tagName);

      // Verify the repository method was called
      verify(mockRepository.addTag(tag)).called(1);
    });

// ...

    test('watchTags updates the state correctly on success', () async {
      // Mock repository method and response
      final tags = [
        const TagModel(id: 1, title: 'Tag1'),
        const TagModel(id: 2, title: 'Tag2'),
      ];
      when(mockRepository.watchAllTags())
          .thenAnswer((_) => Stream.value(Right(tags)));

      // Call the method being tested
      await tagNotifier.watchTags();

      // Wait for the state to update
      await Future.delayed(Duration.zero);

      // Verify the state updates
      final state = tagNotifier.state;
      expect(state, TagsState.loadSuccess(tags: tags));
      expect(state.tags, tags);
    });

    test('watchTags updates the state correctly on failure', () async {
      // Mock repository method and response
      const failure = TagFailure.unexpected();
      
      when(mockRepository.watchAllTags()).thenAnswer((_) => Stream.error(failure));

      // Call the method being tested
      await tagNotifier.watchTags();

      // Wait for the state to update
      await Future.delayed(Duration.zero);

      // Verify the state updates
      final state = tagNotifier.state;
      expect(state, const TagsState.failure(failure, tags: []));
      expect(state.tags, []);
    });

    test('deleteTag calls repository to delete the tag', () async {
      // Mock repository method
      const tag = TagModel(id: 1, title: 'Tag1');
      when(mockRepository.deleteTag(tag))
          .thenAnswer((_) async => const Right(unit));

      // Call the method being tested
      await tagNotifier.deleteTag(tag);

      // Verify the repository method was called
      verify(mockRepository.deleteTag(tag)).called(1);
    });
  });
}
