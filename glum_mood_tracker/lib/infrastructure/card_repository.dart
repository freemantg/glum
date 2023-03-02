import 'package:glum_mood_tracker/domain/card_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:glum_mood_tracker/domain/interfaces.dart';
import 'package:glum_mood_tracker/infrastructure/card_dto.dart';
import 'package:rxdart/rxdart.dart';

import '../domain/card.dart';
import 'drift_database.dart' hide Card;

class CardRepository extends ICardRepository {
  final GlumDatabase _db;

  CardRepository({required GlumDatabase database}) : _db = database;

  @override
  Future<Either<CardFailure, Unit>> addCard(Card card) async {
    print("ADD CARDDDD: $card");
    try {
      await _db.cardDao.insertCard(CardDto.fromDomain(card));
      return right(unit);
    } catch (e) {
      return left(const CardFailure.unexpected());
    }
  }

  @override
  Future<Either<CardFailure, Unit>> deleteCard(Card card) {
    // TODO: implement deleteCard
    throw UnimplementedError();
  }

  @override
  Future<Either<CardFailure, Unit>> updateCard(Card card) {
    // TODO: implement updateCard
    throw UnimplementedError();
  }

  @override
  Stream<Either<CardFailure, List<Card>>> watchAllCards() async* {
    final stream = _db.cardDao.watchAllCards();
    yield* stream.map(
      (dtos) {
        final cards = dtos.map((e) => e.toDomain()).toList();
        return right<CardFailure, List<Card>>(cards);
      },
    ).onErrorReturnWith(
      (error, stackTrace) {
        return left(const CardFailure.unexpected());
      },
    );
  }
}
