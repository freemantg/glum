import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../domain/photo.dart';

class PhotoRepository {
  Future<String> _getDocumentDirectoryPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> savePhoto(Photo photo) async {
    final file = File(photo.filePath);
    final photoFile = photo.file;
    return file.writeAsBytes(await photoFile!.readAsBytes());
  }

  Future<File> loadPhoto(String fileName) async {
    final directoryPath = await _getDocumentDirectoryPath();
    final filePath = '$directoryPath/$fileName';
    final file = File(filePath);
    return file;
  }
}
