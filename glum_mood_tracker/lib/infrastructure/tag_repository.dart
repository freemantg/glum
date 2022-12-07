import 'package:dartz/dartz.dart';
import 'package:glum_mood_tracker/domain/interfaces.dart';
import 'package:glum_mood_tracker/domain/tag_failure.dart';
import 'package:glum_mood_tracker/domain/tag.dart';
import 'package:glum_mood_tracker/infrastructure/drift_database.dart';
import 'package:glum_mood_tracker/infrastructure/tag_dto.dart';
import 'package:rxdart/rxdart.dart';

class TagRepository implements ITagRepository {
  final GlumDatabase _db;

  TagRepository(this._db);

  @override
  Future<Either<TagFailure, Unit>> addTag(Tag tag) async {
    try {
      await _db.tagDao.insertTag(TagDto(title: tag.title));
      return right(unit);
    } catch (e) {
      return left(const TagFailure.unableToUpdate());
    }
  }

  @override
  Future<Either<TagFailure, Unit>> deleteTag(Tag tag) {
    // TODO: implement deleteTag
    throw UnimplementedError();
  }

  @override
  Future<Either<TagFailure, Unit>> updateTag(Tag tag) {
    // TODO: implement updateTag
    throw UnimplementedError();
  }

  @override
  Stream<Either<TagFailure, List<Tag>>> watchAllTags() async* {
    final stream = _db.tagDao.watchTags();
    yield* stream
        .map(
          (tagsData) => right<TagFailure, List<Tag>>(
            tagsData
                .map((e) => TagDto.FromJson(e.toJson()).toDomain())
                .toList(),
          ),
        )
        .onErrorReturn(left(const TagFailure.unexpected()));
  }
}