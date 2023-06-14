import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glum_mood_tracker/application/notifiers.dart';
import 'package:glum_mood_tracker/domain/failures/failures.dart';
import 'package:glum_mood_tracker/domain/models/models.dart';
import 'package:glum_mood_tracker/infrastructure/repositories/repositories.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cards_notifier_test.mocks.dart';

@GenerateMocks([CardRepository, PhotoRepository])
void main() {
  group('CardsStateNotifier', () {
    late CardsStateNotifier cardsStateNotifier;
    late MockCardRepository mockCardRepository;
    late ProviderContainer container;

    setUp(() {
      mockCardRepository = MockCardRepository();
      when(mockCardRepository.watchAllCards())
          .thenAnswer((_) => Stream.value(right([])));
      cardsStateNotifier = CardsStateNotifier(repository: mockCardRepository);
      container = ProviderContainer();
    });

    tearDown(() {
      cardsStateNotifier.dispose();
    });

    // Test 1: Verify initial state
    test('should initialise with LoadSuccess state', () async {
      expect(
        cardsStateNotifier.state,
        equals(const CardsState.loadSuccess(cards: [])),
      );
    });

    // Test 2: Test a successful cards load
    test('should update state to LoadSuccess on successful cards fetch',
        () async {
      final cards = [CardModel(monthYear: DateTime(2023, 1))];

      final controller =
          StreamController<Either<CardFailure, List<CardModel>>>();

      when(mockCardRepository.watchAllCards())
          .thenAnswer((_) => controller.stream);

      final notifier = CardsStateNotifier(repository: mockCardRepository);
      controller.add(right(cards));

      await Future.delayed(Duration.zero);

      expect(
        notifier.state,
        equals(CardsState.loadSuccess(cards: cards)),
      );

      await controller.close(); // close the stream
    });

    // Test 3: Test a failed cards load
    test('should update state to Failure on failed cards fetch', () async {
      // Arrange
      const failure = CardFailure.unexpected();
      final failureOrCards = left<CardFailure, List<CardModel>>(failure);

      // Act
      when(mockCardRepository.watchAllCards())
          .thenAnswer((_) => Stream.value(failureOrCards));
      await cardsStateNotifier.watchAllCards();

      // Delay the check of the state to give the subscription a chance to process the event
      await Future.delayed(Duration.zero);

      // Assert
      failureOrCards.fold(
        (failure) => expect(
          cardsStateNotifier.state,
          equals(CardsState.failure(failure, cards: [])),
        ),
        (_) => fail('Expected a CardFailure'),
      );
    });
  });
}
