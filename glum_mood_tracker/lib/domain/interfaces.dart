import 'package:dartz/dartz.dart';

import 'failures/failures.dart';
import 'failures/status_failure.dart';
import 'models/models.dart';

abstract class IStoryRepository {
  Stream<Either<StoryFailure, List<StoryModel>>> watchStoriesByMonthYear(
      DateTime monthYear);
  Future<Either<StoryFailure, Unit>> addStory(StoryModel story);
  Future<Either<StoryFailure, Unit>> updateStory(StoryModel story);
  Future<Either<StoryFailure, Unit>> deleteStory(int storyId);
  Future<Either<StoryFailure, int>> countStories();
}

abstract class ICardRepository {
  Stream<Either<CardFailure, List<CardModel?>>> watchAllCards();
  Future<Either<CardFailure, Unit>> addCard(CardModel card);
  Future<Either<CardFailure, Unit>> updateCard(CardModel card);
}

abstract class ITagRepository {
  Stream<Either<TagFailure, List<TagModel>>> watchAllTags();
  Future<Either<TagFailure, Unit>> addTag(TagModel tag);
  Future<Either<TagFailure, Unit>> deleteTag(TagModel tag);
}

abstract class IStatsRepository {
  Future<Either<StatusFailure, int>> countAllStories();
  Future<Either<StatusFailure, double>> glumAverage();
  Future<Either<StatusFailure, Map<DateTime, int>>> averageWeek();
  Future<Either<StatusFailure, Map<int, int>>> glumDistribution();
  Future<Either<StatusFailure, Map<DateTime, int>>> yearInGlums();
  Stream<Either<StatusFailure, Map<TagModel, int>>> tagsByMoodsOrGlums(
      bool filterByMoods);
  Stream<Either<StatusFailure, Map<TagModel, int>>> trendingTags();
}
