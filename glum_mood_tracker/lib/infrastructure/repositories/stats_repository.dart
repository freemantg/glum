import 'package:dartz/dartz.dart';
import 'package:glum_mood_tracker/domain/interfaces.dart';
import 'package:glum_mood_tracker/infrastructure/database/drift_database.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/failures/failures.dart';
import '../../domain/models/models.dart';

class StatsRepository implements IStatsRepository {
  final GlumDatabase _db;

  StatsRepository({required GlumDatabase database}) : _db = database;

  @override
  Future<Either<StoryFailure, int>> countAllStories() async {
    try {
      final allStoriesCount = await _db.storyDao.countStories();
      if (allStoriesCount != null) {
        return right(allStoriesCount);
      } else {
        return left(const StoryFailure.unexpected());
      }
    } catch (e) {
      return left(const StoryFailure.unexpected());
    }
  }

  @override
  Future<Either<StoryFailure, double>> glumAverage() async {
    try {
      final averageGlum = await _db.storyDao.glumAverage();
      if (averageGlum != null) {
        return right(averageGlum);
      } else {
        return left(const StoryFailure.unexpected());
      }
    } catch (e) {
      return left(const StoryFailure.unexpected());
    }
  }

  @override
  Future<Either<StoryFailure, Map<int, int>>> glumDistribution() async {
    try {
      final glumDistribution = await _db.storyDao.glumDistribution();
      return right(glumDistribution);
    } catch (e) {
      return left(const StoryFailure.unexpected());
    }
  }

  @override
  Future<Either<StoryFailure, Map<DateTime, int>>> averageWeek() async {
    try {
      final averageWeek = await _db.storyDao.averageWeek();
      return right(averageWeek);
    } catch (e) {
      return left(const StoryFailure.unexpected());
    }
  }

  @override
  Future<Either<StoryFailure, Map<DateTime, int>>> yearInGlums() async {
    try {
      final yearInGlums = await _db.storyDao.yearInGlums();
      return right(yearInGlums);
    } catch (e) {
      return left(const StoryFailure.unexpected());
    }
  }

  @override
  Stream<Either<StoryFailure, Map<TagModel, int>>> trendingTags() async* {
    final stream = _db.tagDao.watchTrendingTags();
    yield* stream.map((tagDtosAndCountMap) {
      final tagsAndCountMap = <TagModel, int>{};
      tagDtosAndCountMap.forEach(
        (dto, count) => tagsAndCountMap[dto.toDomain()] = count,
      );
      return right<StoryFailure, Map<TagModel, int>>(tagsAndCountMap);
    }).onErrorReturnWith(
      (error, stackTrace) {
        return left(const StoryFailure.unexpected());
      },
    );
  }

  @override
  Stream<Either<StoryFailure, Map<TagModel, int>>> tagsByMoodsOrGlums(
      bool filterByMoods) async* {
    final stream = _db.tagDao.watchTagsFilteredByMoodsOrGlums(filterByMoods);
    yield* stream.map((tagDtosAndCountMap) {
      final tagsAndCountMap = <TagModel, int>{};
      tagDtosAndCountMap.forEach(
        (dto, count) => tagsAndCountMap[dto.toDomain()] = count,
      );
      return right<StoryFailure, Map<TagModel, int>>(tagsAndCountMap);
    }).onErrorReturnWith(
      (error, stackTrace) {
        return left(const StoryFailure.unexpected());
      },
    );
  }
}