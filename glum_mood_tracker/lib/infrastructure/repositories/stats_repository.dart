import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:glum_mood_tracker/domain/interfaces.dart';
import 'package:glum_mood_tracker/infrastructure/database/drift_database.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/failures/failures.dart';
import '../../domain/models/models.dart';
import '../dtos/dtos.dart';

class StatsRepository implements IStatsRepository {
  final GlumDatabase _db;

  StatsRepository({required GlumDatabase database}) : _db = database;

  Future<Either<StatusFailure, T>> _getFromDb<T>(
      Future<T?> Function() dbOperation) async {
    try {
      final result = await dbOperation();
      if (result != null) {
        return right(result);
      } else {
        return left(StatusFailure.invalidStatusData(InvalidDataException('')));
      }
    } on InvalidDataException catch (e) {
      return left(StatusFailure.invalidStatusData(e));
    } on DriftWrappedException catch (e) {
      return left(StatusFailure.statusDatabaseException(e));
    } on CouldNotRollBackException catch (e) {
      return left(StatusFailure.couldNotRollBackStory(e));
    } catch (e) {
      return left(const StatusFailure.unexpected());
    }
  }

  Stream<Either<StatusFailure, Map<TagModel, int>>> _streamFromDb(
      Stream<Map<TagDto, int>> Function() dbOperation) async* {
    final stream = dbOperation();
    yield* stream.map((tagDtosAndCountMap) {
      final tagsAndCountMap = <TagModel, int>{};
      tagDtosAndCountMap.forEach(
        (dto, count) => tagsAndCountMap[dto.toDomain()] = count,
      );
      return right<StatusFailure, Map<TagModel, int>>(tagsAndCountMap);
    }).onErrorReturnWith((error, stackTrace) {
      if (error is InvalidDataException) {
        return left(StatusFailure.invalidStatusData(error));
      } else if (error is DriftWrappedException) {
        return left(StatusFailure.statusDatabaseException(error));
      } else if (error is CouldNotRollBackException) {
        return left(StatusFailure.couldNotRollBackStory(error));
      } else {
        return left(const StatusFailure.unexpected());
      }
    });
  }

  @override
  Future<Either<StatusFailure, int>> countAllStories() =>
      _getFromDb(() => _db.storyDao.countStories());

  @override
  Future<Either<StatusFailure, double>> glumAverage() =>
      _getFromDb(() => _db.storyDao.glumAverage());

  @override
  Future<Either<StatusFailure, Map<int, int>>> glumDistribution() =>
      _getFromDb(() => _db.storyDao.glumDistribution());

  @override
  Future<Either<StatusFailure, Map<DateTime, int>>> averageWeek() =>
      _getFromDb(() => _db.storyDao.averageWeek());

  @override
  Future<Either<StatusFailure, Map<DateTime, int>>> yearInGlums() =>
      _getFromDb(() => _db.storyDao.yearInGlums());

  @override
  Stream<Either<StatusFailure, Map<TagModel, int>>> trendingTags() =>
      _streamFromDb(() => _db.tagDao.watchTrendingTags());

  @override
  Stream<Either<StatusFailure, Map<TagModel, int>>> tagsByMoodsOrGlums(
          bool filterByMoods) =>
      _streamFromDb(
          () => _db.tagDao.watchTagsFilteredByMoodsOrGlums(filterByMoods));
}
