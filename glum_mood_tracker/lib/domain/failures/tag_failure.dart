import 'package:drift/drift.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_failure.freezed.dart';

@freezed
class TagFailure with _$TagFailure {
  const factory TagFailure.invalidTagData(InvalidDataException exception) =
      InvalidTagDataFailure;
  const factory TagFailure.tagDatabaseException(
      DriftWrappedException exception) = TagDatabaseExceptionFailure;
  const factory TagFailure.couldNotRollBackTag(
      CouldNotRollBackException exception) = CouldNotRollBackTagFailure;
  const factory TagFailure.unexpected() = _Unexpected;
}
