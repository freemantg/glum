import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/failures/failures.dart';
import '../../domain/models/models.dart';
import '../../infrastructure/repositories/repositories.dart';

part 'card_form_notifier.freezed.dart';

@freezed
class CardFormState with _$CardFormState {
  const CardFormState._();
  const factory CardFormState({
    required CardModel card,
    required bool isEditing,
    required bool isSaving,
    required bool isLoading,
    required Option<Either<CardFailure, Unit>> failureOrSuccess,
  }) = _CardFormState;

  factory CardFormState.initial({required DateTime now}) {
    return CardFormState(
      card: CardModel(monthYear: now),
      isEditing: false,
      isSaving: false,
      isLoading: false,
      failureOrSuccess: none(),
    );
  }
}

class CardFormNotifier extends StateNotifier<CardFormState> {
  CardFormNotifier(
      {required CardRepository cardRepository,
      required PhotoRepository photoRepository,
      DateTime? now})
      : _cardRepository = cardRepository,
        _photoRepository = photoRepository,
        super(CardFormState.initial(now: now ?? DateTime.now()));

  final CardRepository _cardRepository;
  final PhotoRepository _photoRepository;

  Future<void> initialiseCard(CardModel? card) async {
    if (card != null) {
      state = state.copyWith(
        card: card,
        isEditing: true,
      );
    }
  }

  void monthYearChanged(DateTime monthYear) {
    state = state.copyWith(card: state.card.copyWith(monthYear: monthYear));
  }

  Future<void> photoChanged() async {
    state = state.copyWith(isLoading: true);

    final failureOrPhoto = await _photoRepository.pickAndCropPhoto();
    failureOrPhoto.fold(
      (failure) => state = state.copyWith(
          failureOrSuccess: optionOf(
        left(const CardFailure.unexpected()),
      )),
      (photo) async {
        await _photoRepository.savePhoto(photo);
        state = state.copyWith(card: state.card.copyWith(photo: photo));
        saved();
      },
    );
    state = state.copyWith(isLoading: true);
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
      state = state.copyWith(
          failureOrSuccess: optionOf(left(const CardFailure.unexpected())));
    }
    state = state.copyWith(isSaving: false);
  }
}
