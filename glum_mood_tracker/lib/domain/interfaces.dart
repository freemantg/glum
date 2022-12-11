import 'package:dartz/dartz.dart';
import 'package:glum_mood_tracker/domain/story_failure.dart';
import 'package:glum_mood_tracker/domain/tag.dart';
import 'package:glum_mood_tracker/domain/tag_failure.dart';

import 'story.dart';

abstract class IStoryRepository {
  Stream<Either<StoryFailure, List<Story>>> watchAllStories();
  Future<Either<StoryFailure, Unit>> createStory(Story story);
  Future<Either<StoryFailure, Unit>> updateStory(Story story);
  Future<Either<StoryFailure, Unit>> deleteStory(Story story);
}

abstract class ITagRepository {
  Stream<Either<TagFailure, List<Tag>>> watchAllTags();
  Future<Either<TagFailure, Unit>> addTag(Tag tag);
  Future<Either<TagFailure, Unit>> updateTag(Tag tag);
  Future<Either<TagFailure, Unit>> deleteTag(Tag tag);
}
