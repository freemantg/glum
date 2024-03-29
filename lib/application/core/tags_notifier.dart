import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/failures/failures.dart';
import '../../domain/models/models.dart';
import '../../infrastructure/repositories/repositories.dart';

part 'tags_notifier.freezed.dart';

@freezed
class TagsState with _$TagsState {
  const TagsState._();
  const factory TagsState.initial({required List<TagModel> tags}) = _Initial;
  const factory TagsState.loadInProgress({required List<TagModel> tags}) =
      _LoadInProgress;
  const factory TagsState.loadSuccess({required List<TagModel> tags}) =
      _LoadSuccess;
  const factory TagsState.failure(TagFailure failure,
      {required List<TagModel> tags}) = _Failure;
}

class TagNotifier extends StateNotifier<TagsState> {
  final TagRepository _repository;

  TagNotifier(this._repository) : super(const TagsState.initial(tags: []));

  Future<void> addTag(String tagName) async {
    final tag = TagModel(id: null, title: tagName);
    await _repository.addTag(tag);
  }

  Future<void> watchTags() async {
    try {
      state = TagsState.loadInProgress(tags: state.tags);
      final tagStream = _repository.watchAllTags();
      tagStream.listen(
        (successOrFailure) {
          successOrFailure.fold(
            (failure) {
              state = TagsState.failure(failure, tags: state.tags);
            },
            (tags) {
              state = TagsState.loadSuccess(tags: tags);
            },
          );
        },
        onError: (error) {
          state = TagsState.failure(const TagFailure.unexpected(),
              tags: state.tags);
        },
      );
    } catch (e) {
      state =
          TagsState.failure(const TagFailure.unexpected(), tags: state.tags);
    }
  }

  Future<void> deleteTag(tag) async => await _repository.deleteTag(tag);
}
