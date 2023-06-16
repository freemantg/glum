import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/failures/failures.dart';
import '../../domain/models/models.dart';
import '../../infrastructure/repositories/repositories.dart';

part 'cards_notifier.freezed.dart';

@freezed
class CardsState with _$CardsState {
  const CardsState._();
  const factory CardsState.initial({required List<CardModel> cards}) = _Initial;
  const factory CardsState.loadInProgress({required List<CardModel> cards}) =
      _LoadInProgress;
  const factory CardsState.loadSuccess({required List<CardModel> cards}) =
      _LoadSuccess;
  const factory CardsState.failure(CardFailure failure,
      {required List<CardModel> cards}) = _Failure;
}

class CardsStateNotifier extends StateNotifier<CardsState> {
  CardsStateNotifier({required CardRepository repository})
      : _repository = repository,
        super(const CardsState.loadInProgress(cards: [])) {
    _subscription = watchAllCards();
  }

  final CardRepository _repository;
  StreamSubscription<Either<CardFailure, List<CardModel>>>? _subscription;

  StreamSubscription<Either<CardFailure, List<CardModel>>> watchAllCards() {
    final cardStream = _repository.watchAllCards();
    return cardStream.listen(
      (successOrFailure) {
        successOrFailure.fold(
          (failure) {
            state = CardsState.failure(failure, cards: state.cards);
          },
          (cards) {
            state = CardsState.loadSuccess(cards: cards);
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
