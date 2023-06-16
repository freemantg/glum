import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_model.freezed.dart';

@freezed
class PhotoModel with _$PhotoModel {
  const PhotoModel._();
  const factory PhotoModel({
    required File? file,
    required String fileName,
    required String filePath,
  }) = _PhotoModel;

  factory PhotoModel.empty() {
    return const PhotoModel(
      file: null,
      fileName: '',
      filePath: '',
    );
  }
}
