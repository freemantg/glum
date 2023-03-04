import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../domain/photo.dart';

class PhotoRepository {
  final ImagePicker _imagePicker;

  PhotoRepository({required ImagePicker imagePicker})
      : _imagePicker = imagePicker;

  Future<String> _getDocumentDirectoryPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<Photo?> pickPhoto() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    final path = await _getDocumentDirectoryPath();

    if (pickedFile != null) {
      final fileName = pickedFile.path;
      final photo = Photo(
        file: File(pickedFile.path),
        fileName: fileName,
        filePath: pickedFile.path,
      );
      return photo;
    }
    return null;
  }

  Future<File> savePhoto(Photo photo) async {
    final file = File(photo.filePath);
    final photoFile = photo.file;
    return file.writeAsBytes(await photoFile!.readAsBytes());
  }
}
