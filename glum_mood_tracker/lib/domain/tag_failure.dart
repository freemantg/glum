import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_failure.freezed.dart';

@freezed
class TagFailure with _$TagFailure {
  const factory TagFailure.unexpected() = _Unexpected;
  const factory TagFailure.unableToUpdate() = _UnableToUpdate;
}
