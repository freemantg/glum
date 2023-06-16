import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glum_mood_tracker/application/notifiers.dart';
import 'package:glum_mood_tracker/application/notifiers.dart';
import 'package:glum_mood_tracker/domain/failures/failures.dart';
import 'package:glum_mood_tracker/domain/models/models.dart';
import 'package:glum_mood_tracker/infrastructure/repositories/repositories.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../infrastructure/repositories/story_repository_test.mocks.dart';

@GenerateMocks([PhotoRepository])
void main() {
  late ProviderContainer container;
  late MockPhotoRepository mockRepository;
  late PhotosStateNotifier photosNotifier;

  setUp(() {
    container = ProviderContainer();
    mockRepository = MockPhotoRepository();
    photosNotifier = PhotosStateNotifier(repository: mockRepository);
  });

  tearDown(() {
    container.dispose();
  });

  group('PhotosStateNotifier', () {
    test('getAllPhotos updates the state correctly on success', () async {
      // Mock repository method and response
      final photos = [
        const PhotoModel(
            file: null, fileName: 'image1.jpg', filePath: 'path/to/image1.jpg'),
        const PhotoModel(
            file: null, fileName: 'image2.jpg', filePath: 'path/to/image2.jpg'),
      ];
      when(mockRepository.getAllPhotos())
          .thenAnswer((_) async => Right(photos)); // Replace with desired value

      // Call the method being tested
      await photosNotifier.getAllPhotos();

      // Verify the state updates
      final state = photosNotifier.state;
      expect(state, PhotosState.loadSuccess(photos: photos));
      expect(state.photos, photos);
    });

    test('getAllPhotos updates the state correctly on failure', () async {
      // Mock repository method and response
      const failure = PhotoFailure.unexpected();

      when(mockRepository.getAllPhotos())
          .thenAnswer((_) async => const Left(failure));

      // Call the method being tested
      await photosNotifier.getAllPhotos();

      // Verify the state updates
      final state = photosNotifier.state;
      expect(state, PhotosState.failure(failure, photos: state.photos));
      expect(state.photos, state.photos);
    });
  });
}
