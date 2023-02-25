import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glum_mood_tracker/infrastructure/card_repository.dart';

import '../../domain/card.dart';

class CardsNotifier extends StateNotifier<AsyncValue<List<Card?>>> {
  final CardRepository _cardRepository;

  CardsNotifier(this._cardRepository) : super(const AsyncValue.loading());

  void watchCards() {
    _cardRepository.watchAllCards().listen(
      (data) {
        state = data.fold(
          (failure) => AsyncValue.error(failure, StackTrace.current),
          (cards) => AsyncValue.data(cards),
        );
      },
    );
  }
}
