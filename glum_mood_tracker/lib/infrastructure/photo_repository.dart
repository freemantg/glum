import 'dart:io';

import 'package:path_provider/path_provider.dart';

class PhotoRepository {
  Future<String> _getDocumentDirectoryPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> savePhoto(File photo, String fileName) async {
    final directoryPath = await _getDocumentDirectoryPath();
    final filePath = '$directoryPath/$fileName';
    final file = File(filePath);
    return file.writeAsBytes(await photo.readAsBytes());
  }

  Future<File> loadPhoto(String fileName) async {
    final directoryPath = await _getDocumentDirectoryPath();
    final filePath = '$directoryPath/$fileName';
    final file = File(filePath);
    return file;
  }
}
