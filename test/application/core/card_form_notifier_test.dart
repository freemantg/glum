import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glum_mood_tracker/application/notifiers.dart';
import 'package:glum_mood_tracker/domain/failures/failures.dart';
import 'package:glum_mood_tracker/domain/models/models.dart';
import 'package:glum_mood_tracker/infrastructure/repositories/repositories.dart';
import 'package:glum_mood_tracker/shared/providers.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cards_notifier_test.mocks.dart';

@GenerateMocks([CardRepository, PhotoRepository])
void main() {
  group(
    'CardFormNotifier',
    () {
      late MockCardRepository mockCardRepository;
      late MockPhotoRepository mockPhotoRepository;
      late ProviderContainer container;
      late CardFormNotifier cardFormNotifier;
      final fixedDateTime = DateTime(2023, 1);
      final tCardModel = CardModel(monthYear: fixedDateTime);
      final tPhotoModel =
          PhotoModel(file: File('test'), fileName: 'test', filePath: 'test');

      setUp(() {
        mockCardRepository = MockCardRepository();
        mockPhotoRepository = MockPhotoRepository();
        container = ProviderContainer(overrides: [
          cardRepositoryProvider.overrideWithValue(mockCardRepository),
          photoRepositoryProvider.overrideWithValue(mockPhotoRepository),
        ]);
        cardFormNotifier = container.read(cardFormNotifierProvider.notifier);
      });

      test('should initialise with tCardModel', () async {
        final expectedState = CardFormState(
          card: CardModel(monthYear: fixedDateTime),
          isEditing: true,
          isSaving: false,
          isLoading: false,
          failureOrSuccess: none(),
        );

        container
            .read(cardFormNotifierProvider.notifier)
            .initialiseCard(tCardModel);

        expect(cardFormNotifier.state, equals(expectedState));
      });

      test('should change card month and year', () async {
        final newDate = DateTime(2023, 6, 15);
        cardFormNotifier.monthYearChanged(newDate);
        expect(cardFormNotifier.state.card.monthYear, equals(newDate));
      });

      test('should change photo', () async {
        when(mockPhotoRepository.pickAndCropPhoto())
            .thenAnswer((_) async => Right(tPhotoModel));

        final expectedPhoto =
            File('test/photo.jpg'); // Use the appropriate file path

        final completer = Completer<void>();
        completer.complete();

        when(mockPhotoRepository.savePhoto(any))
            .thenAnswer((_) => completer.future.then((_) => expectedPhoto));

        await cardFormNotifier.photoChanged();

        verify(mockPhotoRepository.pickAndCropPhoto()).called(1);
        verify(mockPhotoRepository.savePhoto(tPhotoModel)).called(1);
        expect(cardFormNotifier.state.card.photo, equals(expectedPhoto));
      });

      test('should change color', () async {
        cardFormNotifier.colorChanged(Colors.pink);
        expect(cardFormNotifier.state.card.color, equals(Colors.pink));
      });

      test('should save and add new card', () async {
        when(mockCardRepository.addCard(any))
            .thenAnswer((_) async => const Right(unit));

        await cardFormNotifier.saved();

        verify(mockCardRepository.addCard(tCardModel)).called(1);
        expect(cardFormNotifier.state.isSaving, isFalse);
        expect(cardFormNotifier.state.failureOrSuccess,
            equals(some(const Right(unit))));
      });

      test('should save and update existing card', () async {
        final updatedCardModel = tCardModel.copyWith(id: 1);
        cardFormNotifier.state = cardFormNotifier.state.copyWith(
          card: updatedCardModel,
          isEditing: true,
        );

        when(mockCardRepository.updateCard(any))
            .thenAnswer((_) async => const Right(unit));

        await cardFormNotifier.saved();

        verify(mockCardRepository.updateCard(updatedCardModel)).called(1);
        expect(cardFormNotifier.state.isSaving, isFalse);
        expect(cardFormNotifier.state.failureOrSuccess,
            equals(some(const Right(unit))));
      });

      test('should handle save failure', () async {
        when(mockCardRepository.addCard(any))
            .thenAnswer((_) async => const Left(CardFailure.unexpected()));

        await cardFormNotifier.saved();

        verify(mockCardRepository.addCard(tCardModel)).called(1);
        expect(cardFormNotifier.state.isSaving, isFalse);
        expect(
          cardFormNotifier.state.failureOrSuccess,
          equals(some(const Left(CardFailure.unexpected()))),
        );
      });
    },
  );
}
