import 'package:drift/drift.dart';

import '../../dtos/dtos.dart';
import '../drift_database.dart';

part 'photo_dao.g.dart';

@DriftAccessor(tables: [Photos])
class PhotoDao extends DatabaseAccessor<GlumDatabase> with _$PhotoDaoMixin {
  // Constructor
  PhotoDao(this.db) : super(db);
  final GlumDatabase db;

  // Fetch all photos from the database
  Future<List<PhotoDto>> getAllPhotos() async {
    final photoData = await select(photos).get();
    return photoData.map((e) => PhotoDto.fromJson(e.toJson())).toList();
  }

  // Insert a new photo record into the database
  Future<int> insertPhoto(PhotoDto photoDto) async {
    final photo = PhotosCompanion.insert(
      fileName: photoDto.fileName,
      filePath: photoDto.filePath,
    );
    return await into(photos).insert(photo);
  }

  // Fetch a photo by its ID
  Future<PhotoDto?> getPhotoById(int id) async {
    final query = select(photos)..where((row) => row.id.equals(id));
    final photo = await query.getSingleOrNull();
    if (photo != null) {
      return PhotoDto.fromJson(photo.toJson());
    }
    return null;
  }
}
