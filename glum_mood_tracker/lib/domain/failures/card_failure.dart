import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_failure.freezed.dart';

@freezed
class CardFailure with _$CardFailure {
  const factory CardFailure.unexpected() = _Unexpected;
  const factory CardFailure.unableToUpdate() = _UnableToUpdate;
}
