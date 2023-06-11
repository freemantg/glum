import 'package:drift/drift.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_failure.freezed.dart';

@freezed
class StoryFailure with _$StoryFailure {
  const factory StoryFailure.invalidStoryData(InvalidDataException exception) =
     _InvalidStoryDataFailure;
  const factory StoryFailure.storyDatabaseException(
      DriftWrappedException exception) = _StoryDatabaseExceptionFailure;
  const factory StoryFailure.couldNotRollBackStory(
      CouldNotRollBackException exception) = _CouldNotRollBackStoryFailure;
  const factory StoryFailure.unexpected() = _Unexpected;
}
