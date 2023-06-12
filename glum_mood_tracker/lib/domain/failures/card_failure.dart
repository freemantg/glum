import 'package:drift/drift.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_failure.freezed.dart';


@freezed
class CardFailure with _$CardFailure {
  const factory CardFailure.invalidStatusData(
      InvalidDataException exception) = _InvalidCardFailure;
  const factory CardFailure.statusDatabaseException(
      DriftWrappedException exception) = _CardDatabaseExceptionFailure;
  const factory CardFailure.couldNotRollBackStory(
      CouldNotRollBackException exception) = _CouldNotRollBackCardFailure;
  const factory CardFailure.unexpected() = _Unexpected;
}
