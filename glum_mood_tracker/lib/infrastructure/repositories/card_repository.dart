import 'package:dartz/dartz.dart';
import 'package:glum_mood_tracker/domain/interfaces.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/failures/failures.dart';
import '../../domain/models/models.dart';
import '../database/drift_database.dart';
import '../dtos/dtos.dart';



class CardRepository extends ICardRepository {
  final GlumDatabase _db;

  CardRepository({required GlumDatabase database}) : _db = database;

  @override
  Future<Either<CardFailure, Unit>> addCard(CardModel card) async {
    try {
      await _db.cardDao.insertCard(CardDto.fromDomain(card));
      return right(unit);
    } catch (e) {
      return left(const CardFailure.unexpected());
    }
  }

  @override
  Future<Either<CardFailure, Unit>> updateCard(CardModel card) async {
    try {
      await _db.cardDao.updateCard(CardDto.fromDomain(card));
      return right(unit);
    } catch (e) {
      return left(const CardFailure.unableToUpdate());
    }
  }

  @override
  Stream<Either<CardFailure, List<CardModel>>> watchAllCards() async* {
    final stream = _db.cardDao.watchAllCards();
    yield* stream.map(
      (dtos) {
        final cards = dtos.map((e) => e.toDomain()).toList();
        return right<CardFailure, List<CardModel>>(cards);
      },
    ).onErrorReturnWith(
      (error, stackTrace) {
        return left(const CardFailure.unexpected());
      },
    );
  }
}
