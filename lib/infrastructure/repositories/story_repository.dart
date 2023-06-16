import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/failures/failures.dart';
import '../../domain/interfaces.dart';
import '../../domain/models/models.dart';

import '../database/drift_database.dart';
import '../dtos/dtos.dart';
import 'repositories.dart';

class StoryRepository implements IStoryRepository {
  final GlumDatabase _db;
  final PhotoRepository _photoRepository;

  StoryRepository(this._db, this._photoRepository);

  Future<Either<StoryFailure, Unit>> _executeDbOperation(
      Future Function() dbOperation) async {
    try {
      await dbOperation();
      return right(unit);
    } on InvalidDataException catch (e) {
      return left(StoryFailure.invalidStoryData(e));
    } on DriftWrappedException catch (e) {
      return left(StoryFailure.storyDatabaseException(e));
    } on CouldNotRollBackException catch (e) {
      return left(StoryFailure.couldNotRollBackStory(e));
    } catch (e) {
      return left(const StoryFailure.unexpected());
    }
  }

  Future<Either<StoryFailure, T>> _executeDbWithValue<T>(
      Future<T?> Function() dbOperation) async {
    try {
      final value = await dbOperation();
      if (value == null) {
        return left(StoryFailure.invalidStoryData(
            InvalidDataException("Returned value is null")));
      }
      return right(value);
    } on InvalidDataException catch (e) {
      return left(StoryFailure.invalidStoryData(e));
    } on DriftWrappedException catch (e) {
      return left(StoryFailure.storyDatabaseException(e));
    } on CouldNotRollBackException catch (e) {
      return left(StoryFailure.couldNotRollBackStory(e));
    } catch (e) {
      return left(const StoryFailure.unexpected());
    }
  }

  @override
  Future<Either<StoryFailure, Unit>> addStory(StoryModel story) =>
      _executeDbOperation(() async {
        await _db.transaction(() async {
          await _db.storyDao
              .insertStoryWithTagsAndPhotos(StoryDto.fromDomain(story));
          await _photoRepository.savePhoto(story.photos.first);
        });
      });

  @override
  Future<Either<StoryFailure, Unit>> deleteStory(int storyId) =>
      _executeDbOperation(() async {
        await _db.storyDao.deleteStory(storyId);
      });

  @override
  Future<Either<StoryFailure, Unit>> updateStory(StoryModel story) =>
      _executeDbOperation(() async {
        await _db.storyDao
            .updateStoryWithTagsAndPhotos(StoryDto.fromDomain(story));
      });
  @override
  Stream<Either<StoryFailure, List<StoryModel>>> watchStoriesByMonthYear(
      DateTime monthYear) async* {
    final storyStream = _db.storyDao.watchStoriesByMonthAndYear(monthYear);
    yield* storyStream
        .map((dtos) => right<StoryFailure, List<StoryModel>>(
              dtos.map((e) => e.toDomain()).toList(),
            ))
        .onErrorReturnWith((error, stackTrace) {
      if (error is InvalidDataException) {
        return left(StoryFailure.invalidStoryData(error));
      } else if (error is DriftWrappedException) {
        return left(StoryFailure.storyDatabaseException(error));
      } else if (error is CouldNotRollBackException) {
        return left(StoryFailure.couldNotRollBackStory(error));
      } else {
        return left(const StoryFailure.unexpected());
      }
    });
  }

  @override
  Future<Either<StoryFailure, int>> countStories() =>
      _executeDbWithValue(() => _db.storyDao.countStories());
}
