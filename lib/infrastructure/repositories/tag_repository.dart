import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:glum_mood_tracker/domain/interfaces.dart';
import 'package:glum_mood_tracker/infrastructure/database/drift_database.dart'
    hide Tag;
import 'package:rxdart/rxdart.dart';

import '../../domain/failures/failures.dart';
import '../../domain/models/models.dart';
import '../dtos/dtos.dart';

class TagRepository implements ITagRepository {
  final GlumDatabase _db;

  TagRepository(this._db);

  @override
  Future<Either<TagFailure, Unit>> addTag(TagModel tag) async {
    try {
      await _db.tagDao.insertTag(TagDto.fromDomain(tag));
      return right(unit);
    } catch (e) {
      if (e is InvalidDataException) {
        return left(TagFailure.invalidTagData(e));
      } else if (e is DriftWrappedException) {
        return left(TagFailure.tagDatabaseException(e));
      } else if (e is CouldNotRollBackException) {
        return left(TagFailure.couldNotRollBackTag(e));
      }
      return left(const TagFailure.unexpected());
    }
  }

  @override
  Future<Either<TagFailure, Unit>> deleteTag(TagModel tag) async {
    try {
      await _db.tagDao.deleteTag(TagDto.fromDomain(tag).id!);
      return right(unit);
    } catch (e) {
      if (e is DriftWrappedException) {
        return left(TagFailure.tagDatabaseException(e));
      }
      return left(const TagFailure.unexpected());
    }
  }

  @override
  Stream<Either<TagFailure, List<TagModel>>> watchAllTags() async* {
    final tagStream = _db.tagDao.watchTags();
    yield* tagStream
        .map((dtos) => right<TagFailure, List<TagModel>>(
              dtos.map((e) => e.toDomain()).toList(),
            ))
        .onErrorReturnWith((error, stackTrace) {
      if (error is DriftWrappedException) {
        return left(TagFailure.tagDatabaseException(error));
      }
      return left(const TagFailure.unexpected());
    });
  }
}
