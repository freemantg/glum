import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart' hide Card;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glum_mood_tracker/infrastructure/card_repository.dart';

import '../../domain/card.dart';
import '../../domain/card_failure.dart';
import '../../infrastructure/photo_repository.dart';

part 'card_form_notifier.freezed.dart';

@freezed
class CardFormState with _$CardFormState {
  const CardFormState._();
  const factory CardFormState({
    required Card card,
    required bool isEditing,
    required bool isSaving,
    required Option<Either<CardFailure, Unit>> failureOrSuccess,
  }) = _CardFormState;

  factory CardFormState.initial() {
    return CardFormState(
      card: Card(monthYear: DateTime.now()),
      isEditing: false,
      isSaving: false,
      failureOrSuccess: none(),
    );
  }
}

class CardFormNotifier extends StateNotifier<CardFormState> {
  CardFormNotifier({
    required CardRepository cardRepository,
    required PhotoRepository photoRepository,
  })  : _cardRepository = cardRepository,
        _photoRepository = photoRepository,
        super(CardFormState.initial());

  final CardRepository _cardRepository;
  final PhotoRepository _photoRepository;

  Future<void> initialiseCard(Card? card) async {
    if (card != null) {
      state = state.copyWith(
        card: card,
        isEditing: true,
      );
    }
  }

  Future<void> monthYearChanged(DateTime monthYear) async {
    state = CardFormState.initial();
    state = state.copyWith(card: state.card.copyWith(monthYear: monthYear));
  }

  Future<void> photoChanged() async {
    final photo = await _photoRepository.pickPhoto();
    if (photo != null) {
      await _photoRepository.savePhoto(photo);
      state = state.copyWith(card: state.card.copyWith(photo: photo));
      saved();
    }
  }

  Future<void> colorChanged(Color color) async {
    state = state.copyWith(card: state.card.copyWith(color: color));
    saved();
  }

  Future<void> saved() async {
    state = state.copyWith(isSaving: true);
    try {
      state.isEditing
          ? await _cardRepository.updateCard(state.card)
          : await _cardRepository.addCard(state.card);
    } catch (e) {
      state = state;
    }
    state = state.copyWith(isSaving: false);
  }
}
