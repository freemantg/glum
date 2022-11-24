import 'package:dartz/dartz.dart';
import 'package:glum_mood_tracker/domain/story_failure.dart';

import 'story.dart';

abstract class IStoryRepository {
  Stream<Either<StoryFailure, Story>> watchStory();
  Stream<Either<StoryFailure, List<Story>>> watchAllStories();
  Future<Either<StoryFailure, Unit>> createStory(Story story);
  Future<Either<StoryFailure, Unit>> updateStory(Story story);
  Future<Either<StoryFailure, Unit>> deleteStory(Story story);
}
