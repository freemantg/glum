import 'package:glum_mood_tracker/domain/story_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:glum_mood_tracker/domain/interfaces.dart';
import 'package:glum_mood_tracker/infrastructure/database/drift_database.dart'
    hide Story;
import 'package:glum_mood_tracker/infrastructure/photo_repository.dart';
import 'package:glum_mood_tracker/infrastructure/story_dto.dart';
import 'package:rxdart/rxdart.dart';

import '../domain/story.dart';

class StoryRepository implements IStoryRepository {
  final GlumDatabase _db;
  final PhotoRepository _photoRepository;

  StoryRepository(this._db, this._photoRepository);

  @override
  Future<Either<StoryFailure, Unit>> addStory(Story story) async {
    try {
      Future.wait([
        _db.storyDao.insertStoryWithTagsAndPhotos(StoryDto.fromDomain(story)),
        _photoRepository.savePhoto(story.photos.first),
      ]);

      return right(unit);
    } catch (e) {
      return left(const StoryFailure.unexpected());
    }
  }

  @override
  Future<Either<StoryFailure, Unit>> deleteStory(int storyId) async {
    try {
      await _db.storyDao.deleteStory(storyId);
      return right(unit);
    } catch (e) {
      return left(const StoryFailure.unexpected());
    }
  }

  @override
  Future<Either<StoryFailure, Unit>> updateStory(Story story) async {
    try {
      await _db.storyDao
          .updateStoryWithTagsAndPhotos(StoryDto.fromDomain(story));

      return right(unit);
    } catch (e) {
      return left(const StoryFailure.unexpected());
    }
  }

  @override
  Stream<Either<StoryFailure, List<Story>>> watchStoriesByMonthYear(
      DateTime monthYear) async* {
    final storyStream = _db.storyDao.watchStoriesByMonthAndYear(monthYear);
    yield* storyStream
        .map((dtos) => right<StoryFailure, List<Story>>(
              dtos.map((e) => e.toDomain()).toList(),
            ))
        .onErrorReturnWith(
          (error, stackTrace) => left(const StoryFailure.unexpected()),
        );
  }

  Future<Either<StoryFailure, int>> countStories() async {
    try {
      final storiesCount = await _db.storyDao.countStories();
      if (storiesCount != null) {
        return right(storiesCount);
      } else {
        return left(const StoryFailure.unexpected());
      }
    } catch (e) {
      return left(const StoryFailure.unexpected());
    }
  }
}
