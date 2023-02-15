import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';

@freezed
class Photo with _$Photo {
  const Photo._();
  const factory Photo({
    required File file,
    required String fileName,
    required String filePath,
  }) = _Photo;
}
