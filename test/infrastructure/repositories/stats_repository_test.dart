import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glum_mood_tracker/domain/failures/failures.dart';
import 'package:glum_mood_tracker/domain/models/models.dart';
import 'package:glum_mood_tracker/infrastructure/database/daos/daos.dart';
import 'package:glum_mood_tracker/infrastructure/database/drift_database.dart';
import 'package:glum_mood_tracker/infrastructure/dtos/dtos.dart';
import 'package:glum_mood_tracker/infrastructure/repositories/stats_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'stats_repository_test.mocks.dart';

@GenerateMocks([GlumDatabase, TagDao, StoryDao])
void main() {
  late StatsRepository statsRepository;
  late MockGlumDatabase mockGlumDatabase;
  late MockStoryDao mockStoryDao;
  late MockTagDao mockTagDao;

  setUp(
    () {
      mockGlumDatabase = MockGlumDatabase();
      mockStoryDao = MockStoryDao();
      mockTagDao = MockTagDao();
      statsRepository = StatsRepository(database: mockGlumDatabase);
      when(mockGlumDatabase.storyDao).thenReturn(mockStoryDao);
      when(mockGlumDatabase.tagDao).thenReturn(mockTagDao);
    },
  );

  group('countAllStories', () {
    test('returns the number of stories from the DAO', () async {
      // Arrange
      const storyCount = 5;
      when(mockStoryDao.countStories())
          .thenAnswer((_) => Future.value(storyCount));

      // Act
      final result = await statsRepository.countAllStories();

      // Assert
      expect(result, equals(right<StatusFailure, int>(storyCount)));
      verify(mockStoryDao.countStories()).called(1);
    });

    test('returns a failure when an error occurs', () async {
      // Arrange
      final error = DriftWrappedException(message: 'Test exception');
      when(mockStoryDao.countStories()).thenThrow(error);

      // Act
      final result = await statsRepository.countAllStories();

      // Assert
      expect(
          result,
          equals(left<StatusFailure, int>(
              StatusFailure.statusDatabaseException(error))));
      verify(mockStoryDao.countStories()).called(1);
    });
  });

  group('glumAverage', () {
    test('returns the glum average from the DAO', () async {
      // Arrange
      const glumAverage = 3.5;
      when(mockStoryDao.glumAverage())
          .thenAnswer((_) => Future.value(glumAverage));

      // Act
      final result = await statsRepository.glumAverage();

      // Assert
      expect(result, equals(right<StatusFailure, double>(glumAverage)));
      verify(mockStoryDao.glumAverage()).called(1);
    });

    test('returns a failure when an error occurs', () async {
      // Arrange
      final error = DriftWrappedException(message: 'Test exception');
      when(mockStoryDao.glumAverage()).thenThrow(error);

      // Act
      final result = await statsRepository.glumAverage();

      // Assert
      expect(
          result,
          equals(left<StatusFailure, double>(
              StatusFailure.statusDatabaseException(error))));
      verify(mockStoryDao.glumAverage()).called(1);
    });
  });

  group('glumDistribution', () {
    test('returns the glum distribution from the DAO', () async {
      // Arrange
      final glumDistribution = {1: 5, 2: 10, 3: 7};
      when(mockStoryDao.glumDistribution())
          .thenAnswer((_) => Future.value(glumDistribution));

      // Act
      final result = await statsRepository.glumDistribution();

      // Assert
      expect(result,
          equals(right<StatusFailure, Map<int, int>>(glumDistribution)));
      verify(mockStoryDao.glumDistribution()).called(1);
    });

    test('returns a failure when an error occurs', () async {
      // Arrange
      final error = DriftWrappedException(message: 'Test exception');
      when(mockStoryDao.glumDistribution()).thenThrow(error);

      // Act
      final result = await statsRepository.glumDistribution();

      // Assert
      expect(
          result,
          equals(left<StatusFailure, Map<int, int>>(
              StatusFailure.statusDatabaseException(error))));
      verify(mockStoryDao.glumDistribution()).called(1);
    });
  });

  group('averageWeek', () {
    test('returns the average week from the DAO', () async {
      // Arrange
      final averageWeek = {DateTime(2023, 1): 3, DateTime(2023, 2): 4};
      when(mockStoryDao.averageWeek())
          .thenAnswer((_) => Future.value(averageWeek));

      // Act
      final result = await statsRepository.averageWeek();

      // Assert
      expect(result,
          equals(right<StatusFailure, Map<DateTime, int>>(averageWeek)));
      verify(mockStoryDao.averageWeek()).called(1);
    });

    test('returns a failure when an error occurs', () async {
      // Arrange
      final error = DriftWrappedException(message: 'Test exception');
      when(mockStoryDao.averageWeek()).thenThrow(error);

      // Act
      final result = await statsRepository.averageWeek();

      // Assert
      expect(
          result,
          equals(left<StatusFailure, Map<DateTime, int>>(
              StatusFailure.statusDatabaseException(error))));
      verify(mockStoryDao.averageWeek()).called(1);
    });
  });

  group('yearInGlums', () {
    test('returns the year in glums from the DAO', () async {
      // Arrange
      final yearInGlums = {DateTime(2023, 1): 10, DateTime(2023, 2): 5};
      when(mockStoryDao.yearInGlums())
          .thenAnswer((_) => Future.value(yearInGlums));

      // Act
      final result = await statsRepository.yearInGlums();

      // Assert
      expect(result,
          equals(right<StatusFailure, Map<DateTime, int>>(yearInGlums)));
      verify(mockStoryDao.yearInGlums()).called(1);
    });

    test('returns a failure when an error occurs', () async {
      // Arrange
      final error = DriftWrappedException(message: 'Test exception');
      when(mockStoryDao.yearInGlums()).thenThrow(error);

      // Act
      final result = await statsRepository.yearInGlums();

      // Assert
      expect(
          result,
          equals(left<StatusFailure, Map<DateTime, int>>(
              StatusFailure.statusDatabaseException(error))));
      verify(mockStoryDao.yearInGlums()).called(1);
    });
  });

  group('trendingTags', () {
    test('emits the trending tags from the DAO', () async {
      // Arrange
      final trendingTags = {
        const TagModel(id: 1, title: 'Tag 1'): 5,
        const TagModel(id: 2, title: 'Tag 2'): 10,
        const TagModel(id: 3, title: 'Tag 3'): 7,
      };
      final tagDtosAndCountMap = trendingTags
          .map((key, value) => MapEntry(TagDto.fromDomain(key), value));

      when(mockTagDao.watchTrendingTags())
          .thenAnswer((_) => Stream.value(tagDtosAndCountMap));

      // Act
      final result = statsRepository.trendingTags();

      // Assert
      await expectLater(
          result,
          emitsInOrder([
            isA<Right<StatusFailure, Map<TagModel, int>>>().having(
              (r) => r.value,
              'value',
              trendingTags,
            ),
          ]));
      verify(mockTagDao.watchTrendingTags()).called(1);
    });

    test('emits a failure when an error occurs', () async {
      // Arrange
      final error = DriftWrappedException(message: 'Test exception');
      when(mockTagDao.watchTrendingTags())
          .thenAnswer((_) => Stream.error(error));

      // Act
      final result = statsRepository.trendingTags();

      // Assert
      await expectLater(
          result,
          emitsInOrder([
            isA<Left<StatusFailure, Map<TagModel, int>>>().having(
              (l) => l.value,
              'value',
              StatusFailure.statusDatabaseException(error),
            ),
          ]));
      verify(mockTagDao.watchTrendingTags()).called(1);
    });
  });

  group('tagsByMoodsOrGlums', () {
    test('emits the tags filtered by moods or glums from the DAO', () async {
      // Arrange
      const bool filterByMoods = true;
      final tagsByMoodsOrGlums = {
        const TagModel(id: 1, title: 'Tag 1'): 5,
        const TagModel(id: 2, title: 'Tag 2'): 10,
        const TagModel(id: 3, title: 'Tag 3'): 7,
      };
      final tagDtosAndCountMap = tagsByMoodsOrGlums
          .map((key, value) => MapEntry(TagDto.fromDomain(key), value));

      when(mockTagDao.watchTagsFilteredByMoodsOrGlums(filterByMoods))
          .thenAnswer((_) => Stream.value(tagDtosAndCountMap));

      // Act
      final result = statsRepository.tagsByMoodsOrGlums(filterByMoods);

      // Assert
      await expectLater(
          result,
          emitsInOrder([
            isA<Right<StatusFailure, Map<TagModel, int>>>().having(
              (r) => r.value,
              'value',
              tagsByMoodsOrGlums,
            ),
          ]));
      verify(mockTagDao.watchTagsFilteredByMoodsOrGlums(filterByMoods))
          .called(1);
    });

    test('emits a failure when an error occurs', () async {
      // Arrange
      const bool filterByMoods = false;
      final error = DriftWrappedException(message: 'Test exception');
      when(mockTagDao.watchTagsFilteredByMoodsOrGlums(filterByMoods))
          .thenAnswer((_) => Stream.error(error));

      // Act
      final result = statsRepository.tagsByMoodsOrGlums(filterByMoods);

      // Assert
      await expectLater(
          result,
          emitsInOrder([
            isA<Left<StatusFailure, Map<TagModel, int>>>().having(
              (l) => l.value,
              'value',
              StatusFailure.statusDatabaseException(error),
            ),
          ]));
      verify(mockTagDao.watchTagsFilteredByMoodsOrGlums(filterByMoods))
          .called(1);
    });
  });
}
