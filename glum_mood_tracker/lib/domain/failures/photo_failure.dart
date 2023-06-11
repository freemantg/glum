import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_failure.freezed.dart';

@freezed
class PhotoFailure with _$PhotoFailure {
  const factory PhotoFailure.unexpected() = _Unexpected;
  const factory PhotoFailure.unableToUpdate() = _UnableToUpdate;
  const factory PhotoFailure.permissionDenied() = _PermissionDenied;
  const factory PhotoFailure.croppingFailed() = _CroppingFailed;
}
