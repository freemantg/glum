import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:glum_mood_tracker/domain/interfaces.dart';

import '../../domain/failures/failures.dart';
import '../../domain/models/models.dart';
import '../database/drift_database.dart';
import '../dtos/dtos.dart';

class CardRepository extends ICardRepository {
  final GlumDatabase _db;

  CardRepository({required GlumDatabase database}) : _db = database;

  Future<Either<CardFailure, Unit>> _executeDbOperation(
      Future Function() dbOperation) async {
    try {
      await dbOperation();
      return right(unit);
    } on InvalidDataException catch (e) {
      return left(CardFailure.invalidStatusData(e));
    } on DriftWrappedException catch (e) {
      return left(CardFailure.statusDatabaseException(e));
    } on CouldNotRollBackException catch (e) {
      return left(CardFailure.couldNotRollBackStory(e));
    } catch (e) {
      return left(const CardFailure.unexpected());
    }
  }

  @override
  Future<Either<CardFailure, Unit>> addCard(CardModel card) =>
      _executeDbOperation(
          () => _db.cardDao.insertCard(CardDto.fromDomain(card)));

  @override
  Future<Either<CardFailure, Unit>> updateCard(CardModel card) =>
      _executeDbOperation(
          () => _db.cardDao.updateCard(CardDto.fromDomain(card)));

  @override
  Stream<Either<CardFailure, List<CardModel>>> watchAllCards() async* {
    final stream = _db.cardDao.watchAllCards();
    yield* stream.map(
      (dtos) {
        final cards = dtos.map((e) => e.toDomain()).toList();
        return right<CardFailure, List<CardModel>>(cards);
      },
    ).handleError(
      (error) {
        if (error is InvalidDataException) {
          return left(CardFailure.invalidStatusData(error));
        } else if (error is DriftWrappedException) {
          return left(CardFailure.statusDatabaseException(error));
        } else if (error is CouldNotRollBackException) {
          return left(CardFailure.couldNotRollBackStory(error));
        } else {
          return left(const CardFailure.unexpected());
        }
      },
    );
  }
}
