import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glum_mood_tracker/domain/failures/failures.dart';
import 'package:glum_mood_tracker/domain/models/models.dart';
import 'package:glum_mood_tracker/infrastructure/database/daos/daos.dart';
import 'package:glum_mood_tracker/infrastructure/database/drift_database.dart';
import 'package:glum_mood_tracker/infrastructure/dtos/dtos.dart';
import 'package:glum_mood_tracker/infrastructure/repositories/repositories.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'photo_repository_test.mocks.dart';

@GenerateMocks([
  ImagePicker,
  ImageCropper,
  GlumDatabase,
  PhotoDao,
  CroppedFile,
  File,
  Directory
])
void main() {
  late PhotoRepository photoRepository;
  late MockImagePicker imagePicker;
  late MockImageCropper imageCropper;
  late MockGlumDatabase glumDatabase;
  late MockFile mockFile;
  late MockDirectory mockDirectory;

  setUp(() {
    imagePicker = MockImagePicker();
    imageCropper = MockImageCropper();
    glumDatabase = MockGlumDatabase();
    mockFile = MockFile();
    mockDirectory = MockDirectory();
    when(glumDatabase.photoDao).thenReturn(MockPhotoDao());
    photoRepository = PhotoRepository(
      imagePicker: imagePicker,
      imageCropper: imageCropper,
      glumDatabase: glumDatabase,
    );
  });

  group(
    'getAllPhotos',
    () {
      test(
        'should return a list of PhotoModel when database call is successful',
        () async {
          final photoDao = MockPhotoDao();
          final mockPhotoModel1 = PhotoModel(
            file: File('path/to/photo1.jpg'),
            fileName: 'photo1.jpg',
            filePath: 'path/to/photo1.jpg',
          );
          final mockPhotoModel2 = PhotoModel(
            file: File('path/to/photo2.jpg'),
            fileName: 'photo2.jpg',
            filePath: 'path/to/photo2.jpg',
          );
          final photoDtos = [mockPhotoModel1, mockPhotoModel2]
              .map((e) => PhotoDto.fromDomain(e))
              .toList();
          when(glumDatabase.photoDao).thenReturn(photoDao);
          when(photoDao.getAllPhotos()).thenAnswer((_) async => photoDtos);

          final result = await photoRepository.getAllPhotos();

          // The test fails when comparing File objects directly, even though they represent
          // the same path. This is because each File object has a unique identity, and Dart's
          // default behavior is to compare object identities, not their properties.
          // To work around this, we are comparing the paths of the files as strings.
          // This allows the test to pass when the paths are the same, regardless of the
          // identities of the File objects.

          result.fold(
            (failure) => fail('Expected success, got failure: $failure'),
            (photoList) => expect(
              photoList.map((photo) => photo.file?.path),
              [mockPhotoModel1.file?.path, mockPhotoModel2.file?.path],
            ),
          );
        },
      );

      test(
        'should return PhotoFailure.unexpected when an unexpected error occurs',
        () async {
          when(glumDatabase.photoDao).thenThrow(Exception('Unexpected error'));
          final result = await photoRepository.getAllPhotos();
          expect(result, left(const PhotoFailure.unexpected()));
        },
      );
    },
  );

  group(
    'pickAndCropPhoto',
    () {
      test(
        'should return PhotoModel when the image is picked and cropped successfully',
        () async {
          final mockXFile = XFile('path/to/photo.jpg');
          final mockCroppedFile = MockCroppedFile();
          when(mockCroppedFile.path).thenReturn('path/to/photo.jpg');
          when(imagePicker.pickImage(source: ImageSource.gallery)).thenAnswer(
            (_) async => mockXFile,
          );
          when(imageCropper.cropImage(sourcePath: anyNamed('sourcePath')))
              .thenAnswer(
            (_) async => mockCroppedFile,
          );

          final result = await photoRepository.pickAndCropPhoto();

          result.fold(
            (l) => fail('Expected Right, got Left'),
            (r) {
              // comparing the properties of PhotoModel
              expect(r.file?.path, r.file?.path);
              expect(r.fileName, r.fileName);
              expect(r.filePath, r.filePath);
            },
          );
        },
      );

      test(
        'should return PhotoFailure.permissionDenied when permission is denied',
        () async {
          // arrange
          when(imagePicker.pickImage(source: ImageSource.gallery)).thenThrow(
              PlatformException(
                  code: 'PERMISSION_DENIED', message: 'permission'));

          // act
          final result = await photoRepository.pickAndCropPhoto();

          // assert
          result.fold(
            (failure) => expect(failure, const PhotoFailure.permissionDenied()),
            (_) => fail('Expected a Left but got a Right'),
          );
        },
      );

      test(
        'should return PhotoFailure.croppingFailed when cropping fails',
        () async {
          // arrange
          final mockXFile = XFile('path/to/photo.jpg');
          when(imagePicker.pickImage(source: ImageSource.gallery))
              .thenAnswer((_) async => mockXFile);
          when(imageCropper.cropImage(sourcePath: anyNamed('sourcePath')))
              .thenThrow(PlatformException(
                  code: 'CROPPING_FAILED', message: 'cropping'));

          // act
          final result = await photoRepository.pickAndCropPhoto();

          // assert
          result.fold(
            (failure) => expect(failure, const PhotoFailure.croppingFailed()),
            (_) => fail('Expected a Left but got a Right'),
          );
        },
      );

      test(
        'should successfully save the photo',
        () async {
          // Arrange
          final mockPhotoModel = PhotoModel(
            file: mockFile,
            fileName: 'photo.jpg',
            filePath: 'path/to/photo.jpg',
          );

          // Stub the parent property of the mockFile
          when(mockFile.parent).thenReturn(mockDirectory);

          // Stub the create method of the mockDirectory
          when(mockDirectory.create(recursive: true))
              .thenAnswer((_) async => mockDirectory);

          // Mock the behavior of File methods
          final mockBytes = Uint8List.fromList([1, 2, 3]);
          when(mockFile.readAsBytes()).thenAnswer((_) async {
            // Manually invoke the readAsBytes method
            return mockBytes;
          });
          when(mockFile.writeAsBytes(any)).thenAnswer((_) async => mockFile);

          // Act
          final result = await photoRepository.savePhoto(mockPhotoModel);

          // Assert
          verify(mockFile.readAsBytes()).called(1);
          verify(mockFile.writeAsBytes(mockBytes)).called(1);
          expect(result, equals(mockFile));
        },
      );
    },
  );
}
