import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_failure.freezed.dart';

@freezed
class StoryFailure with _$StoryFailure {
  const factory StoryFailure.unexpected() = _Unexpected;
  const factory StoryFailure.unableToUpdate() = _UnableToUpdate;
}
