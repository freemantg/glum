import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:glum_mood_tracker/infrastructure/drift_database.dart'
    hide Photo;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../domain/photo.dart';
import '../domain/photo_failure.dart';

class PhotoRepository {
  final ImagePicker _imagePicker;
  final GlumDatabase _glumDatabase;

  PhotoRepository({
    required ImagePicker imagePicker,
    required GlumDatabase glumDatabase,
  })  : _imagePicker = imagePicker,
        _glumDatabase = glumDatabase;

  Future<String> _getDocumentDirectoryPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<Either<PhotoFailure, List<Photo>>> getAllPhotos() async {
    try {
      final photos = await _glumDatabase.photoDao.getAllPhotos();
      return right(photos.map((e) => e.toDomain()).toList());
    } catch (e) {
      return left(const PhotoFailure.unexpected());
    }
  }

  Future<Photo?> pickPhoto() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final croppedFile =
          await ImageCropper().cropImage(sourcePath: pickedFile.path);
      if (croppedFile != null) {
        final fileName = croppedFile.path;
        final photo = Photo(
          file: File(croppedFile.path),
          fileName: fileName,
          filePath: croppedFile.path,
        );
        return photo;
      }
    }
    return null;
  }

  Future<File> savePhoto(Photo photo) async {
    final file = File(photo.filePath);
    final photoFile = photo.file;
    return file.writeAsBytes(await photoFile!.readAsBytes());
  }
}
