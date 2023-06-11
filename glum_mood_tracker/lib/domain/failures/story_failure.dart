import 'package:drift/drift.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_failure.freezed.dart';


part 'story_failure.freezed.dart';

@freezed
abstract class StoryFailure with _$StoryFailure {
  const factory StoryFailure.invalidStoryData(InvalidDataException exception) = InvalidStoryDataFailure;
  const factory StoryFailure.storyDatabaseException(DriftWrappedException exception) = StoryDatabaseExceptionFailure;
  const factory StoryFailure.couldNotRollBackStory(CouldNotRollBackException exception) = CouldNotRollBackStoryFailure;
  const factory StoryFailure.unexpected() = _Unexpected;
}
