import 'package:drift/drift.dart' hide JsonKey;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_failure.freezed.dart';

@freezed
class StatusFailure with _$StatusFailure {
  const StatusFailure._();
  const factory StatusFailure.invalidStatusData(
      InvalidDataException exception) = _InvalidStatusFailure;
  const factory StatusFailure.statusDatabaseException(
      DriftWrappedException exception) = _StatusDatabaseExceptionFailure;
  const factory StatusFailure.couldNotRollBackStory(
      CouldNotRollBackException exception) = _CouldNotRollBackStoryFailure;
  const factory StatusFailure.unexpected() = _Unexpected;

   String get type {
    return when(
      invalidStatusData: (_) => 'InvalidStatusData',
      statusDatabaseException: (_) => 'StatusDatabaseException',
      couldNotRollBackStory: (_) => 'CouldNotRollBackStory',
      unexpected: () => 'Unexpected',
    );
  }
}
