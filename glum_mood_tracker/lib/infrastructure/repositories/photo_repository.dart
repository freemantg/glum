import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:glum_mood_tracker/infrastructure/database/drift_database.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/failures/failures.dart';
import '../../domain/models/models.dart';

class PhotoRepository {
  final ImagePicker _imagePicker;
  final ImageCropper _imageCropper;
  final GlumDatabase _glumDatabase;

  PhotoRepository({
    required ImagePicker imagePicker,
    required ImageCropper imageCropper,
    required GlumDatabase glumDatabase,
  })  : _imagePicker = imagePicker,
        _imageCropper = imageCropper,
        _glumDatabase = glumDatabase;

  Future<Either<PhotoFailure, List<PhotoModel>>> getAllPhotos() async {
    try {
      final photos = await _glumDatabase.photoDao.getAllPhotos();
      return right(photos.map((e) => e.toDomain()).toList());
    } catch (e) {
      return left(const PhotoFailure.unexpected());
    }
  }

  Future<Either<PhotoFailure, PhotoModel>> pickAndCropPhoto() async {
    try {
      final pickedFile =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final croppedFile =
            await _imageCropper.cropImage(sourcePath: pickedFile.path);
        if (croppedFile != null) {
          final fileName = croppedFile.path;
          final photo = PhotoModel(
            file: File(croppedFile.path),
            fileName: fileName,
            filePath: croppedFile.path,
          );
          return right(photo);
        }
      }
      return left(const PhotoFailure.croppingFailed());
    } on PlatformException catch (e) {
      if (e.message?.contains('permission') ?? false) {
        return left(const PhotoFailure.permissionDenied());
      } else if (e.message?.contains('cropping') ?? false) {
        return left(const PhotoFailure.croppingFailed());
      } else {
        return left(const PhotoFailure.unexpected());
      }
    } catch (e) {
      return left(const PhotoFailure.unexpected());
    }
  }

  Future<File> savePhoto(PhotoModel photo) async {
    final file = File(photo.filePath);
    final photoFile = photo.file;
    return file.writeAsBytes(await photoFile!.readAsBytes());
  }
}
