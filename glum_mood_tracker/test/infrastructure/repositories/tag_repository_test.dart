import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glum_mood_tracker/domain/failures/failures.dart';
import 'package:glum_mood_tracker/domain/failures/failures.dart';
import 'package:glum_mood_tracker/domain/failures/failures.dart';
import 'package:glum_mood_tracker/domain/models/models.dart';
import 'package:glum_mood_tracker/infrastructure/database/daos/daos.dart';
import 'package:glum_mood_tracker/infrastructure/database/drift_database.dart';
import 'package:glum_mood_tracker/infrastructure/dtos/dtos.dart';
import 'package:glum_mood_tracker/infrastructure/repositories/tag_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'tag_repository_test.mocks.dart';

@GenerateMocks([GlumDatabase, TagDao])
void main() {
  late TagRepository tagRepository;
  late MockGlumDatabase mockGlumDatabase;
  late MockTagDao mockTagDao;

  setUp(() {
    mockGlumDatabase = MockGlumDatabase();
    mockTagDao = MockTagDao();
    when(mockGlumDatabase.tagDao).thenReturn(mockTagDao);
    when(mockTagDao.insertTag(any)).thenAnswer((_) => Future.value());
    tagRepository = TagRepository(mockGlumDatabase);
  });

  group('addTag', () {
    test('should return Right(Unit) when tag insertion is successful',
        () async {
      const tag = TagModel(id: 1, title: 'test');
      when(mockTagDao.insertTag(any)).thenAnswer((_) => Future.value());

      final result = await tagRepository.addTag(tag);

      expect(result, equals(right(unit)));
      verify(mockGlumDatabase.tagDao).called(1);
      verify(mockTagDao.insertTag(TagDto.fromDomain(tag))).called(1);
    });
  });

  group('deleteTag', () {
    test('should return Right(Unit) when tag deletion is successful', () async {
      const tag = TagModel(id: 1, title: 'test');

      // Arrange
      when(mockTagDao.deleteTag(any)).thenAnswer((_) => Future.value());

      // Act
      final result = await tagRepository.deleteTag(tag);

      // Assert
      expect(result, equals(right(unit)));
      verify(mockGlumDatabase.tagDao).called(1);
      verify(mockTagDao.deleteTag(tag.id!)).called(1);
    });

    test(
      'returns Left(TagFailure.invalidTagData) when InvalidDataException is thrown',
      () async {
        const tag = TagModel(id: 1, title: 'test');
        final dto = TagDto.fromDomain(tag);

        when(mockTagDao.insertTag(dto))
            .thenThrow(InvalidDataException('Test exception'));

        final result = await tagRepository.addTag(tag);

        expect(result.isLeft(), true);
        expect(
            result.fold(
              (failure) => failure,
              (_) => throw Error(),
            ),
            isA<TagFailure>());
      },
    );

    test(
      'returns Left(TagFailure.tagDatabaseException) when DriftWrappedException is thrown',
      () async {
        const tag = TagModel(id: 1, title: 'test');
        final dto = TagDto.fromDomain(tag);

        when(mockTagDao.insertTag(dto))
            .thenThrow(DriftWrappedException(message: 'Test exception'));

        final result = await tagRepository.addTag(tag);

        expect(result.isLeft(), true);
        expect(
            result.fold(
              (failure) => failure,
              (_) => throw Error(),
            ),
            isA<TagFailure>());
      },
    );

    test(
      'returns Left(TagFailure.couldNotRollBackTag) when CouldNotRollBackException is thrown',
      () async {
        const tag = TagModel(id: 1, title: 'test');
        final tagDto = TagDto.fromDomain(tag);

        when(mockTagDao.insertTag(tagDto)).thenThrow(
          CouldNotRollBackException(
            'Test exception',
            StackTrace.empty,
            '',
          ),
        );

        final result = await tagRepository.addTag(tag);

        expect(result.isLeft(), true);
        expect(
            result.fold(
              (failure) => failure,
              (_) => throw Error(),
            ),
            isA<TagFailure>());
      },
    );

    test(
        'should return Left(TagFailure.unexpected()) when an unexpected exception occurs',
        () async {
      const tag = TagModel(id: 1, title: 'test');

      // Arrange
      when(mockTagDao.deleteTag(any)).thenThrow(Exception());

      // Act
      final result = await tagRepository.deleteTag(tag);

      // Assert
      expect(result, equals(left(const TagFailure.unexpected())));
      verify(mockGlumDatabase.tagDao).called(1);
      verify(mockTagDao.deleteTag(tag.id!)).called(1);
    });
  });

  group('watchAllTags', () {
    test('emits correct list of tags on success', () {
      final tagDtos = [
        const TagDto(id: 1, title: 'Tag 1'),
        const TagDto(id: 2, title: 'Tag 2'),
        const TagDto(id: 3, title: 'Tag 3'),
      ];
      final expectedTags = tagDtos.map((dto) => dto.toDomain()).toList();

      when(mockTagDao.watchTags()).thenAnswer((_) => Stream.value(tagDtos));

      final result = tagRepository.watchAllTags();

      expect(
          result,
          emitsInOrder([
            isA<Right<TagFailure, List<TagModel>>>().having(
              (r) => r.value,
              'value',
              expectedTags,
            ),
          ]));
    });

    test('emits TagFailure.tagDatabaseException on DriftWrappedException', () {
      when(mockTagDao.watchTags()).thenAnswer((_) =>
          Stream.error(DriftWrappedException(message: 'Test exception')));

      final result = tagRepository.watchAllTags();

      expectLater(
        result,
        emitsInOrder([
          isA<Left<TagFailure, List<TagModel>>>()
              .having((l) => l.value.type, 'type', 'TagDatabaseException'),
          emitsDone
        ]),
      );
    });

    test('emits TagFailure.unexpected on any other Exception', () {
      when(mockTagDao.watchTags()).thenAnswer((_) => Stream.error(Exception()));

      final result = tagRepository.watchAllTags();

      expect(
          result,
          emits(equals(left<TagFailure, List<TagModel>>(
              const TagFailure.unexpected()))));
    });
  });
}
