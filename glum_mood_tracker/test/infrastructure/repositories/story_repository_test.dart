import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glum_mood_tracker/domain/failures/failures.dart';
import 'package:glum_mood_tracker/domain/models/models.dart';
import 'package:glum_mood_tracker/infrastructure/database/daos/daos.dart';
import 'package:glum_mood_tracker/infrastructure/database/drift_database.dart';
import 'package:glum_mood_tracker/infrastructure/dtos/dtos.dart';
import 'package:glum_mood_tracker/infrastructure/repositories/repositories.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'story_repository_test.mocks.dart';

@GenerateMocks([StoryDao, GlumDatabase, PhotoRepository, File])
void main() {
  late StoryRepository storyRepository;
  late MockGlumDatabase mockGlumDatabase;
  late MockPhotoRepository mockPhotoRepository;
  late MockStoryDao mockStoryDao;
  late MockFile mockFile;

  setUp(() {
    mockGlumDatabase = MockGlumDatabase();
    mockPhotoRepository = MockPhotoRepository();
    mockStoryDao = MockStoryDao();
    mockFile = MockFile();
    when(mockGlumDatabase.storyDao).thenReturn(mockStoryDao);
    storyRepository = StoryRepository(mockGlumDatabase, mockPhotoRepository);
  });

  group('addStory', () {
    test('returns right(unit) when story insertion is successful', () async {
      // Arrange
      final mockFile = MockFile();
      when(mockFile.path).thenReturn('/path/to/test.jpg');

      final story = StoryModel(
        title: 'Test',
        description: 'Test Description',
        glumRating: 5,
        date: DateTime.now(),
        tags: [],
        photos: [],
      );

      final storyDto = StoryDto.fromDomain(story);
      when(mockStoryDao.insertStoryWithTagsAndPhotos(storyDto))
          .thenAnswer((_) => Future.value());
      when(mockPhotoRepository.savePhoto(any))
          .thenAnswer((_) => Future.value());

      // Act
      final result = await storyRepository.addStory(story);

      // Assert
      expect(result, equals(right<StoryFailure, Unit>(unit)));
      verify(mockStoryDao.insertStoryWithTagsAndPhotos(storyDto)).called(1);
      verify(mockPhotoRepository.savePhoto(any)).called(1);
    });
  });

  group('deleteStory', () {
    test('returns right(unit) when story deletion is successful', () async {
      // Arrange

      when(mockStoryDao.deleteStory(any)).thenAnswer((_) => Future.value());

      // Act
      final result = await storyRepository.deleteStory(1);

      // Assert
      expect(result, equals(right<StoryFailure, Unit>(unit)));
      verify(mockStoryDao.deleteStory(any)).called(1);
    });

    test('returns left(StoryFailure.unexpected()) when story deletion fails',
        () async {
      // Arrange
      const storyId = 1;
      when(mockStoryDao.deleteStory(storyId)).thenThrow(Exception());

      // Act
      final result = await storyRepository.deleteStory(storyId);

      // Assert
      expect(result,
          equals(left<StoryFailure, Unit>(const StoryFailure.unexpected())));
      verify(mockStoryDao.deleteStory(storyId)).called(1);
    });
  });

  group('countStories', () {
    test('returns the number of stories from the DAO', () async {
      // Arrange
      const storyCount = 5;
      when(mockStoryDao.countStories())
          .thenAnswer((_) => Future.value(storyCount));

      // Act
      final result = await storyRepository.countStories();

      // Assert
      expect(result, equals(right<StoryFailure, int>(storyCount)));
      verify(mockStoryDao.countStories()).called(1);
    });

    test('returns a failure when an error occurs', () async {
      // Arrange
      final error = DriftWrappedException(message: 'Test exception');
      when(mockStoryDao.countStories()).thenThrow(error);

      // Act
      final result = await storyRepository.countStories();

      // Assert
      expect(
          result,
          equals(left<StoryFailure, int>(
              StoryFailure.storyDatabaseException(error))));
      verify(mockStoryDao.countStories()).called(1);
    });
  });

  group('updateStory', () {
    test('returns right(unit) when story update is successful', () async {
      // Arrange
      final story = StoryModel(
        id: 1,
        title: 'Test',
        description: 'Test Description',
        glumRating: 5,
        date: DateTime(2023, 1),
        tags: [],
        photos: [],
      );

      final storyDto = StoryDto.fromDomain(story);
      when(mockStoryDao.updateStoryWithTagsAndPhotos(storyDto))
          .thenAnswer((_) => Future.value());

      // Act
      final result = await storyRepository.updateStory(story);

      // Assert
      expect(result, equals(right<StoryFailure, Unit>(unit)));
      verify(mockStoryDao.updateStoryWithTagsAndPhotos(storyDto)).called(1);
    });

    test('returns a failure when an error occurs', () async {
      // Arrange
      final error = DriftWrappedException(message: 'Test exception');
      when(mockStoryDao.updateStoryWithTagsAndPhotos(any)).thenThrow(error);

      // Act
      final result = await storyRepository.updateStory(StoryModel.empty());

      // Assert
      expect(
          result,
          equals(left<StoryFailure, Unit>(
              StoryFailure.storyDatabaseException(error))));
      verify(mockStoryDao.updateStoryWithTagsAndPhotos(any)).called(1);
    });
  });

  group('watchStoriesByMonthYear', () {
    test('emits correct list of stories on success', () {
      final monthYear = DateTime(2023, 1);
      final storyDtos = [
        StoryDto(
          id: 1,
          title: 'Story 1',
          description: 'Description 1',
          glumRating: 3,
          date: DateTime(2023, 1),
          tags: [],
          photos: [],
        ),
        StoryDto(
          id: 2,
          title: 'Story 2',
          description: 'Description 2',
          glumRating: 3,
          date: DateTime(2023, 1),
          tags: [],
          photos: [],
        ),
        StoryDto(
          id: 3,
          title: 'Story 3',
          description: 'Description 3',
          glumRating: 3,
          date: DateTime(2023, 1),
          tags: [],
          photos: [],
        ),
      ];
      final expectedStories = storyDtos.map((dto) => dto.toDomain()).toList();
      when(mockStoryDao.watchStoriesByMonthAndYear(monthYear))
          .thenAnswer((_) => Stream.value(storyDtos));

      final result = storyRepository.watchStoriesByMonthYear(monthYear);

      expectLater(
          result,
          emitsInOrder([
            isA<Right<StoryFailure, List<StoryModel>>>().having(
              (r) => r.value,
              'value',
              expectedStories,
            ),
          ]));
    });

    test('emits a failure when an error occurs', () {
      final monthYear = DateTime(2023, 1);
      final error = DriftWrappedException(message: 'Test exception');
      when(mockStoryDao.watchStoriesByMonthAndYear(monthYear))
          .thenAnswer((_) => Stream.error(error));

      final result = storyRepository.watchStoriesByMonthYear(monthYear);

      expectLater(
          result,
          emitsInOrder([
            isA<Left<StoryFailure, List<StoryModel>>>().having(
              (l) => l.value,
              'value',
              StoryFailure.storyDatabaseException(error),
            ),
          ]));
    });
  });
}
