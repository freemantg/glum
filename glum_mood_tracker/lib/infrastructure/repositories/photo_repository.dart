import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:glum_mood_tracker/infrastructure/database/drift_database.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/failures/failures.dart';
import '../../domain/models/models.dart';


class PhotoRepository {
  final ImagePicker _imagePicker;
  final GlumDatabase _glumDatabase;

  PhotoRepository({
    required ImagePicker imagePicker,
    required GlumDatabase glumDatabase,
  })  : _imagePicker = imagePicker,
        _glumDatabase = glumDatabase;

  // Get all photos from the database
  Future<Either<PhotoFailure, List<PhotoModel>>> getAllPhotos() async {
    try {
      final photos = await _glumDatabase.photoDao.getAllPhotos();
      return right(photos.map((e) => e.toDomain()).toList());
    } catch (e) {
      return left(const PhotoFailure.unexpected());
    }
  }

  // Pick a photo from the gallery and crop it
  Future<PhotoModel?> pickPhoto() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final croppedFile =
          await ImageCropper().cropImage(sourcePath: pickedFile.path);
      if (croppedFile != null) {
        final fileName = croppedFile.path;
        final photo = PhotoModel(
          file: File(croppedFile.path),
          fileName: fileName,
          filePath: croppedFile.path,
        );
        return photo;
      }
    }
    return null;
  }

  // Save a photo to the local storage
  Future<File> savePhoto(PhotoModel photo) async {
    final file = File(photo.filePath);
    final photoFile = photo.file;
    return file.writeAsBytes(await photoFile!.readAsBytes());
  }
}