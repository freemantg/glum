import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glum_mood_tracker/application/core/date_time_notifier.dart';
import 'package:glum_mood_tracker/application/core/stories_notifier.dart';
import 'package:glum_mood_tracker/application/core/story_form_notifier.dart';
import 'package:glum_mood_tracker/infrastructure/drift_database.dart';
import 'package:glum_mood_tracker/infrastructure/story_repository.dart';

final storiesNotifierProvider =
    StateNotifierProvider<StoriesNotifier, StoriesState>(
        (ref) => StoriesNotifier(ref.watch(storyRepositoryProvider)));

final storyFormNotifierProvider =
    StateNotifierProvider.autoDispose<StoryFormNotifier, StoryFormState>(
        (ref) => StoryFormNotifier(ref.watch(storyRepositoryProvider)));

final storyRepositoryProvider = Provider(
  (ref) => StoryRepository(ref.watch(glumDatabaseProvider)),
);

final glumDatabaseProvider = Provider((ref) => GlumDatabase());

final dateTimeNotifierProvider =
    StateNotifierProvider<DateTimeNotifier, AsyncValue<DateTime>>(
  (ref) => DateTimeNotifier(),
);
