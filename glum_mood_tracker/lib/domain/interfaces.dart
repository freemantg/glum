import 'package:dartz/dartz.dart';

import 'failures/failures.dart';
import 'models/models.dart';

abstract class IStoryRepository {
  Stream<Either<StoryFailure, List<StoryModel>>> watchStoriesByMonthYear(
      DateTime monthYear);
  Future<Either<StoryFailure, Unit>> addStory(StoryModel story);
  Future<Either<StoryFailure, Unit>> updateStory(StoryModel story);
  Future<Either<StoryFailure, Unit>> deleteStory(int storyId);
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
  Future<Either<StoryFailure, int>> countAllStories();
  Future<Either<StoryFailure, double>> glumAverage();
  Future<Either<StoryFailure, Map<DateTime, int>>> averageWeek();
  Future<Either<StoryFailure, Map<int, int>>> glumDistribution();
  Future<Either<StoryFailure, Map<DateTime, int>>> yearInGlums();
  Stream<Either<StoryFailure, Map<TagModel, int>>> tagsByMoodsOrGlums(
      bool filterByMoods);
  Stream<Either<StoryFailure, Map<TagModel, int>>> trendingTags();
}
