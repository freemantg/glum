import 'package:drift/drift.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_failure.freezed.dart';

@freezed
class StatusFailure with _$StatusFailure {
  const factory StatusFailure.invalidStatusData(
      InvalidDataException exception) = InvalidStatusFailure;
  const factory StatusFailure.storyDatabaseException(
      DriftWrappedException exception) = StoryDatabaseExceptionFailure;
  const factory StatusFailure.couldNotRollBackStory(
      CouldNotRollBackException exception) = CouldNotRollBackStoryFailure;
  const factory StatusFailure.unexpected() = _Unexpected;
}
