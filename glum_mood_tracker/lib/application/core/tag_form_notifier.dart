import 'package:glum_mood_tracker/infrastructure/story_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TagFormNotifier extends StateNotifier<AsyncValue<String>> {
  final StoryRepository _repository;

  TagFormNotifier(this._repository) : super(const AsyncValue.loading());

  Future<void> addTag(String tag) async {
    
  }
}
