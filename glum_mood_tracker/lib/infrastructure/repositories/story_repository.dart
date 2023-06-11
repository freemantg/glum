import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';

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

  @override
  Future<Either<StoryFailure, Unit>> addStory(StoryModel story) async {
    try {
      await _db.transaction(() async {
        await _db.storyDao
            .insertStoryWithTagsAndPhotos(StoryDto.fromDomain(story));
        await _photoRepository.savePhoto(story.photos.first);
      });
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

  @override
  Future<Either<StoryFailure, Unit>> deleteStory(int storyId) async {
    try {
      await _db.storyDao.deleteStory(storyId);
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

  @override
  Future<Either<StoryFailure, Unit>> updateStory(StoryModel story) async {
    try {
      await _db.storyDao
          .updateStoryWithTagsAndPhotos(StoryDto.fromDomain(story));

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

  @override
  Stream<Either<StoryFailure, List<StoryModel>>> watchStoriesByMonthYear(
      DateTime monthYear) async* {
    final storyStream = _db.storyDao.watchStoriesByMonthAndYear(monthYear);
    yield* storyStream
        .map((dtos) => right<StoryFailure, List<StoryModel>>(
              dtos.map((e) => e.toDomain()).toList(),
            ))
        .handleError((error, stackTrace) {
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

  Future<Either<StoryFailure, int>> countStories() async {
    try {
      final storiesCount = await _db.storyDao.countStories();
      if (storiesCount != null) {
        return right(storiesCount);
      } else {
        return left(StoryFailure.invalidStoryData(
            InvalidDataException("Story count is null")));
      }
    } on DriftWrappedException catch (e) {
      return left(StoryFailure.storyDatabaseException(e));
    } catch (e) {
      return left(const StoryFailure.unexpected());
    }
  }
}
