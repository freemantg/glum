import 'package:drift/drift.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_failure.freezed.dart';

@freezed
class StatusFailure with _$StatusFailure {
  const factory StatusFailure.invalidStatusData(
      InvalidDataException exception) = _InvalidStatusFailure;
  const factory StatusFailure.statusDatabaseException(
      DriftWrappedException exception) = _StatusDatabaseExceptionFailure;
  const factory StatusFailure.couldNotRollBackStory(
      CouldNotRollBackException exception) = _CouldNotRollBackStoryFailure;
  const factory StatusFailure.unexpected() = _Unexpected;
}
