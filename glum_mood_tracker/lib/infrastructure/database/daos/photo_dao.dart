import 'package:drift/drift.dart';

import '../../dtos.dart';
import '../drift_database.dart';

part 'photo_dao.g.dart';

@DriftAccessor(tables: [Photos])
class PhotoDao extends DatabaseAccessor<GlumDatabase> with _$PhotoDaoMixin {
  PhotoDao(this.db) : super(db);
  final GlumDatabase db;

  Future<List<PhotoDto>> getAllPhotos() async {
    final photoData = await select(photos).get();
    return photoData.map((e) => PhotoDto.fromJson(e.toJson())).toList();
  }

  Future<int> insertPhoto(PhotoDto photoDto) async {
    final photo = PhotosCompanion.insert(
      fileName: photoDto.fileName,
      filePath: photoDto.filePath,
    );
    return await into(photos).insert(photo);
  }

  Future<PhotoDto?> getPhotoById(int id) async {
    final query = select(photos)..where((row) => row.id.equals(id));
    final photo = await query.getSingleOrNull();
    if (photo != null) {
      return PhotoDto.fromJson(photo.toJson());
    }
    return null;
  }
}
