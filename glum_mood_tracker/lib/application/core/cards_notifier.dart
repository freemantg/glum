import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glum_mood_tracker/domain/card_failure.dart';
import 'package:glum_mood_tracker/infrastructure/card_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/card.dart';

part 'cards_notifier.freezed.dart';

@freezed
class CardsState with _$CardsState {
  const CardsState._();
  const factory CardsState.initial({required List<Card> cards}) = _Initial;
  const factory CardsState.loadInProgress({required List<Card> cards}) =
      _LoadInProgress;
  const factory CardsState.loadSuccess({required List<Card> cards}) =
      _LoadSuccess;
  const factory CardsState.failure(CardFailure failure,
      {required List<Card> cards}) = _Failure;
}

class CardsStateNotifier extends StateNotifier<CardsState> {
  CardsStateNotifier({required CardRepository cardRepository})
      : _cardRepository = cardRepository,
        super(const CardsState.initial(cards: []));

  final CardRepository _cardRepository;

  Future<void> watchAllCards() async {
    state = CardsState.loadInProgress(cards: state.cards);
    final cardsStream = _cardRepository.watchAllCards();
    cardsStream.listen(
      (successOrFailure) {
        successOrFailure.fold(
          (failure) {
            state = CardsState.failure(failure, cards: state.cards);
          },
          (cards) {
            final cardsss = cards.map((e) => e).toList();
            state = CardsState.loadSuccess(cards: cardsss);
          },
        );
      },
    );
  }
}
