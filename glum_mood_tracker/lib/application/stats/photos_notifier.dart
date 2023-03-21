import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/failures/failures.dart';
import '../../domain/models/models.dart';
import '../../infrastructure/repositories/repositories.dart';


part 'photos_notifier.freezed.dart';

@freezed
class PhotosState with _$PhotosState {
  const PhotosState._();
  const factory PhotosState.initial({required List<PhotoModel> photos}) =
      _Initial;
  const factory PhotosState.loadInProgress({required List<PhotoModel> photos}) =
      _LoadInProgress;
  const factory PhotosState.loadSuccess({required List<PhotoModel> photos}) =
      _LoadSuccess;
  const factory PhotosState.failure(
    PhotoFailure failure, {
    required List<PhotoModel> photos,
  }) = _Failure;
}

class PhotosStateNotifier extends StateNotifier<PhotosState> {
  PhotosStateNotifier({required PhotoRepository repository})
      : _repository = repository,
        super(const PhotosState.initial(photos: []));

  final PhotoRepository _repository;

  Future<void> getAllPhotos() async {
    state = PhotosState.loadInProgress(photos: state.photos);
    final successOrFailure = await _repository.getAllPhotos();
    state = successOrFailure.fold(
      (failure) => PhotosState.failure(failure, photos: state.photos),
      (photos) => PhotosState.loadSuccess(photos: photos),
    );
  }
}
