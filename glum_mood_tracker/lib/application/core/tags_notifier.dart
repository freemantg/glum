import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glum_mood_tracker/domain/tag.dart';
import 'package:glum_mood_tracker/infrastructure/tag_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/tag_failure.dart';

part 'tags_notifier.freezed.dart';

@freezed
class TagsState with _$TagsState {
  const TagsState._();
  const factory TagsState.initial({required List<Tag> tags}) = _Initial;
  const factory TagsState.loadInProgress({required List<Tag> tags}) =
      _LoadInProgress;
  const factory TagsState.loadSuccess({required List<Tag> tags}) = _LoadSuccess;
  const factory TagsState.failure(TagFailure failure,
      {required List<Tag> tags}) = _Failure;
}

class TagNotifier extends StateNotifier<TagsState> {
  final TagRepository _repository;

  TagNotifier(this._repository) : super(const TagsState.initial(tags: []));

  Future<void> addTag(String tagName) async {
    final tag = Tag(title: tagName);
    await _repository.addTag(tag);
    await watchTags();
  }

  Future<void> watchTags() async {
    state = TagsState.loadInProgress(tags: state.tags);
    final tagStream = _repository.watchAllTags();
    tagStream.listen(
      (successOrFailure) {
        state = successOrFailure.fold(
          (failure) => TagsState.failure(failure, tags: state.tags),
          (tags) => TagsState.loadSuccess(tags: tags),
        );
      },
    );
  }
}
