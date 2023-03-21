import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/photo_model.dart';

part 'photo_dto.freezed.dart';
part 'photo_dto.g.dart';

@freezed
class PhotoDto with _$PhotoDto {
  const PhotoDto._();
  const factory PhotoDto({
    required String fileName,
    required String filePath,
  }) = _PhotoDto;

  factory PhotoDto.fromDomain(PhotoModel photo) {
    return PhotoDto(
      fileName: photo.fileName,
      filePath: photo.filePath,
    );
  }

  factory PhotoDto.fromJson(Map<String, dynamic> json) =>
      _$PhotoDtoFromJson(json);

  PhotoModel toDomain() {
    return PhotoModel(
      file: File(filePath),
      fileName: fileName,
      filePath: filePath,
    );
  }
}
