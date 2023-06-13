import 'package:drift/drift.dart' hide JsonKey;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_failure.freezed.dart';

@freezed
class CardFailure with _$CardFailure {
  const CardFailure._();
  const factory CardFailure.invalidCardData(InvalidDataException exception) =
      _InvalidCardFailure;
  const factory CardFailure.cardDatabaseException(
      DriftWrappedException exception) = _CardDatabaseExceptionFailure;
  const factory CardFailure.couldNotRollBackStory(
      CouldNotRollBackException exception) = _CouldNotRollBackCardFailure;
  const factory CardFailure.unexpected() = _Unexpected;

  String get type {
    return when(
      invalidCardData: (_) => 'InvalidCardData',
      cardDatabaseException: (_) => 'CardDatabaseException',
      couldNotRollBackStory: (_) => 'CouldNotRollBackStory',
      unexpected: () => 'Unexpected',
    );
  }

  
}
