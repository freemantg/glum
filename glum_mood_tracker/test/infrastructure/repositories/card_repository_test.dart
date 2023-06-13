import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glum_mood_tracker/domain/failures/failures.dart';
import 'package:glum_mood_tracker/domain/models/models.dart';
import 'package:glum_mood_tracker/infrastructure/database/daos/daos.dart';
import 'package:glum_mood_tracker/infrastructure/database/drift_database.dart';
import 'package:glum_mood_tracker/infrastructure/dtos/card_dto.dart';
import 'package:glum_mood_tracker/infrastructure/repositories/card_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'card_repository_test.mocks.dart';

@GenerateMocks([
  GlumDatabase,
  CardDao,
])
void main() {
  late MockGlumDatabase mockGlumDatabase;
  late MockCardDao mockCardDao;
  late CardRepository cardRepository;

  setUp(
    () {
      mockGlumDatabase = MockGlumDatabase();
      mockCardDao = MockCardDao();
      when(mockGlumDatabase.cardDao).thenReturn(mockCardDao);
      cardRepository = CardRepository(database: mockGlumDatabase);
    },
  );

  group('CardRepository', () {
    group('addCard', () {
      test('returns right(unit) when no exception is thrown', () async {
        when(mockCardDao.insertCard(any)).thenAnswer((_) => Future.value());

        final result = await cardRepository
            .addCard(CardModel(monthYear: DateTime(2023, 1)));

        expect(result.isRight(), true);
        expect(result.fold((l) => '', (r) => 'Success'), 'Success');
      });
    });

    test('returns CardFailure.cardDatabaseException on DriftWrappedException',
        () async {
      when(mockCardDao.insertCard(any))
          .thenThrow(DriftWrappedException(message: 'Test exception'));

      final result =
          await cardRepository.addCard(CardModel(monthYear: DateTime(2023, 1)));

      expect(result.isLeft(), true);
      expect(result.fold((l) => l.type, (r) => ''), 'CardDatabaseException');
    });

    test('returns CardFailure.invalidCardData on InvalidDataException',
        () async {
      when(mockCardDao.insertCard(any))
          .thenThrow(InvalidDataException("Test exception"));

      final result =
          await cardRepository.addCard(CardModel(monthYear: DateTime(2023, 1)));

      expect(result.isLeft(), true);
      expect(result.fold((l) => l.type, (r) => ''), 'InvalidCardData');
    });

    test(
        'returns CardFailure.couldNotRollBackStory on CouldNotRollBackException',
        () async {
      when(mockCardDao.insertCard(any)).thenThrow(
          CouldNotRollBackException("Test exception", StackTrace.empty, ''));

      final result =
          await cardRepository.addCard(CardModel(monthYear: DateTime(2023, 1)));
      expect(result.isLeft(), true);
      expect(result.fold((l) => l.type, (r) => ''), 'CouldNotRollBackStory');
    });

    group('updateCard', () {
      test('returns right unit on success', () async {
        when(mockCardDao.updateCard(any)).thenAnswer((_) async {});

        final result = await cardRepository
            .updateCard(CardModel(monthYear: DateTime(2023, 1)));

        expect(result.isRight(), true);
        expect(result.fold((l) => '', (r) => 'Success'), 'Success');
      });

      test(
          'returns CardFailure.couldNotRollBackStory on CouldNotRollBackException',
          () async {
        when(mockCardDao.updateCard(any)).thenThrow(
            CouldNotRollBackException("Test exception", StackTrace.empty, ''));

        final result = await cardRepository
            .updateCard(CardModel(monthYear: DateTime(2023, 1)));

        expect(result.isLeft(), true);
        expect(result.fold((l) => l.type, (r) => ''), 'CouldNotRollBackStory');
      });

      test('returns CardFailure.invalidCardData on InvalidDataException',
          () async {
        when(mockCardDao.updateCard(any))
            .thenThrow(InvalidDataException("Test exception"));

        final result = await cardRepository
            .updateCard(CardModel(monthYear: DateTime(2023, 1)));

        expect(result.isLeft(), true);
        expect(result.fold((l) => l.type, (r) => ''), 'InvalidCardData');
      });

      test('returns CardFailure.unexpected on any other Exception', () async {
        when(mockCardDao.updateCard(any)).thenThrow(Exception());

        final result = await cardRepository
            .updateCard(CardModel(monthYear: DateTime(2023, 1)));

        expect(result.isLeft(), true);
        expect(result.fold((l) => l.type, (r) => ''), 'Unexpected');
      });
    });

    group(
      'watchAllCards',
      () {
        test('emits correct CardModel on success', () async {
          final cardModelList = [
            CardModel(monthYear: DateTime(2023, 1)),
            CardModel(monthYear: DateTime(2023, 2)),
            CardModel(monthYear: DateTime(2023, 3)),
          ];

          final cardDtos =
              cardModelList.map((e) => CardDto.fromDomain(e)).toList();

          when(mockCardDao.watchAllCards())
              .thenAnswer((_) => Stream.value(cardDtos));

          final result = cardRepository.watchAllCards();

          await expectLater(
              result,
              emitsInOrder([
                isA<Right<CardFailure, List<CardModel>>>().having(
                  (r) => r.value,
                  'value',
                  cardModelList,
                ),
              ]));
        });

        test(
          'returns CardFailure.cardDatabaseException on DriftWrappedException',
          () async {
            when(mockCardDao.watchAllCards()).thenAnswer((_) =>
                Stream.error(DriftWrappedException(message: "Test exception")));

            final result = cardRepository.watchAllCards();

            await expectLater(
                result,
                emitsInOrder([
                  isA<Left<CardFailure, List<CardModel>>>().having(
                      (l) => l.value.type, 'type', 'CardDatabaseException'),
                  emitsDone
                ]));
          },
        );

        test('returns CardFailure.invalidCardData on InvalidDataException',
            () async {
          when(mockCardDao.watchAllCards()).thenAnswer((_) =>
              Stream.error(InvalidDataException("Test exception")));

          final result = cardRepository.watchAllCards();

          await expectLater(
              result,
              emitsInOrder([
                isA<Left<CardFailure, List<CardModel>>>().having(
                  (l) => l.value.type,
                  'type',
                  'InvalidCardData',
                ),
                emitsDone,
              ]));
        });

        test(
            'returns CardFailure.couldNotRollBackStory on CouldNotRollBackException',
            () async {
          when(mockCardDao.watchAllCards()).thenAnswer(
            (_) => Stream.error(CouldNotRollBackException(
                "Test exception", StackTrace.empty, '')),
          );

          final result = cardRepository.watchAllCards();

          await expectLater(
              result,
              emitsInOrder([
                isA<Left<CardFailure, List<CardModel>>>().having(
                  (l) => l.value.type,
                  'type',
                  'CouldNotRollBackStory',
                ),
                emitsDone,
              ]));
        });

        test('returns CardFailure.unexpected on any other Exception', () async {
          when(mockCardDao.watchAllCards())
              .thenAnswer((_) => Stream.error(Exception("Test exception")));

          final result = cardRepository.watchAllCards();

          await expectLater(
              result,
              emitsInOrder([
                isA<Left<CardFailure, List<CardModel>>>().having(
                  (l) => l.value.type,
                  'type',
                  'Unexpected',
                ),
                emitsDone,
              ]));
        });
      },
    );
  });
}
