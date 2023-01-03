import 'package:dartz/dartz.dart';
import 'package:glum_mood_tracker/domain/interfaces.dart';
import 'package:glum_mood_tracker/domain/story_failure.dart';
import 'package:glum_mood_tracker/domain/story.dart';
import 'package:glum_mood_tracker/domain/tag.dart';
import 'package:glum_mood_tracker/infrastructure/drift_database.dart';

class StatsRepository implements IStatsRepository {
  final GlumDatabase _database;

  StatsRepository({required GlumDatabase database}) : _database = database;

  @override
  Future<Either<StoryFailure, int>> countAllStories() async {
    try {
      final allStoriesCount = await _database.storyDao.countStories();
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
  Stream<Either<StoryFailure, List<Story>>> watchAllStories() {
    return const Stream.empty();
  }

  @override
  Future<Either<StoryFailure, Unit>> fetchStats() {
    // TODO: implement fetchStats
    throw UnimplementedError();
  }

  @override
  Future<Either<StoryFailure, double>> glumAverage() async {
    try {
      final averageGlum = await _database.storyDao.glumAverage();
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
  Future<Either<StoryFailure, Map<int, double>>> glumDistribution() async {
    try {
      final glumDistribution = await _database.storyDao.glumDistribution();
      return right(glumDistribution);
    } catch (e) {
      return left(const StoryFailure.unexpected());
    }
  }

  @override
  Future<Either<StoryFailure, Map<DateTime, int>>> averageWeek() async {
    try {
      final averageWeek = await _database.storyDao.averageWeek();
      return right(averageWeek);
    } catch (e) {
      return left(const StoryFailure.unexpected());
    }
  }

  @override
  Future<Either<StoryFailure, Map<DateTime, int>>> yearInGlums() async {
    try {
      final yearInGlums = await _database.storyDao.yearInGlums();
      return right(yearInGlums);
    } catch (e) {
      return left(const StoryFailure.unexpected());
    }
  }

  @override
  Future<Either<StoryFailure, List<Tag>>> trendingTags() {
    // TODO: implement trendingTags
    throw UnimplementedError();
  }
}
