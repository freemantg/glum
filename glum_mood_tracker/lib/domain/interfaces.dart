import 'package:dartz/dartz.dart';
import 'package:glum_mood_tracker/domain/card.dart';
import 'package:glum_mood_tracker/domain/story_failure.dart';
import 'package:glum_mood_tracker/domain/tag.dart';
import 'package:glum_mood_tracker/domain/tag_failure.dart';

import 'card_failure.dart';
import 'story.dart';

abstract class IStoryRepository {
  Stream<Either<StoryFailure, List<Story>>> watchStoriesByMonthYear(
      DateTime monthYear);
  Future<Either<StoryFailure, Unit>> addStory(Story story);
  Future<Either<StoryFailure, Unit>> updateStory(Story story);
  Future<Either<StoryFailure, Unit>> deleteStory(int storyId);
}

abstract class ICardRepository {
  Stream<Either<CardFailure, List<Card?>>> watchAllCards();
  Future<Either<CardFailure, Unit>> addCard(Card card);
  Future<Either<CardFailure, Unit>> updateCard(Card card);
}

abstract class ITagRepository {
  Stream<Either<TagFailure, List<Tag>>> watchAllTags();
  Future<Either<TagFailure, Unit>> addTag(Tag tag);
  Future<Either<TagFailure, Unit>> updateTag(Tag tag);
  Future<Either<TagFailure, Unit>> deleteTag(Tag tag);
}

abstract class IStatsRepository {
  Stream<Either<StoryFailure, List<Story>>> watchAllStories();
  Future<Either<StoryFailure, int>> countAllStories();
  Future<Either<StoryFailure, double>> glumAverage();
  Future<Either<StoryFailure, Map<DateTime, int>>> averageWeek();
  Future<Either<StoryFailure, Map<int, int>>> glumDistribution();
  Future<Either<StoryFailure, Unit>> fetchStats();
  Future<Either<StoryFailure, Map<DateTime, int>>> yearInGlums();
  Stream<Either<StoryFailure, Map<Tag, int>>> tagsByMoodsOrGlums(
      bool filterByMoods);
  Stream<Either<StoryFailure, Map<Tag, int>>> trendingTags();
}
