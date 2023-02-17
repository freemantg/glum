import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:glum_mood_tracker/domain/interfaces.dart';
import 'package:glum_mood_tracker/domain/tag_failure.dart';
import 'package:glum_mood_tracker/infrastructure/drift_database.dart' hide Tag;
import 'package:glum_mood_tracker/infrastructure/tag_dto.dart';
import 'package:rxdart/rxdart.dart';

import '../domain/tag.dart';

class TagRepository implements ITagRepository {
  final GlumDatabase _db;

  TagRepository(this._db);

  @override
  Future<Either<TagFailure, Unit>> addTag(Tag tag) async {
    try {
      await _db.tagDao.insertTag(TagDto.fromDomain(tag));
      return right(unit);
    } catch (e) {
      return left(const TagFailure.unableToUpdate());
    }
  }

  @override
  Future<Either<TagFailure, Unit>> deleteTag(Tag tag) async {
    try {
      await _db.tagDao.deleteTag(TagDto.fromDomain(tag).id);
      return right(unit);
    } catch (e) {
      return left(const TagFailure.unexpected());
    }
  }

  @override
  Future<Either<TagFailure, Unit>> updateTag(Tag tag) {
    // TODO: implement updateTag
    throw UnimplementedError();
  }

  @override
  Stream<Either<TagFailure, List<Tag>>> watchAllTags() async* {
    final tagStream = _db.tagDao.watchTags();
    yield* tagStream
        .map((dtos) => right<TagFailure, List<Tag>>(
              dtos.map((e) => e.toDomain()).toList(),
            ))
        .onErrorReturnWith(
      (error, stackTrace) {
        debugPrint('ERROR');
        return left(const TagFailure.unexpected());
      },
    );
  }
}
