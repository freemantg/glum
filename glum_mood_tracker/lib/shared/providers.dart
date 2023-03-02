import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glum_mood_tracker/application/core/card_form_notifier.dart';
import 'package:glum_mood_tracker/application/core/card_notifier.dart';
import 'package:glum_mood_tracker/application/core/date_time_notifier.dart';
import 'package:glum_mood_tracker/application/core/stories_notifier.dart';
import 'package:glum_mood_tracker/application/core/story_form_notifier.dart';
import 'package:glum_mood_tracker/application/core/tags_notifier.dart';
import 'package:glum_mood_tracker/infrastructure/drift_database.dart' hide Card;
import 'package:glum_mood_tracker/infrastructure/photo_repository.dart';
import 'package:glum_mood_tracker/infrastructure/story_repository.dart';
import 'package:glum_mood_tracker/infrastructure/tag_repository.dart';

import '../application/stats/stats_notifier.dart';
import '../domain/card.dart';
import '../infrastructure/card_repository.dart';
import '../infrastructure/stats_repository.dart';

final storiesNotifierProvider =
    StateNotifierProvider<StoriesNotifier, StoriesState>(
        (ref) => StoriesNotifier(ref.watch(storyRepositoryProvider)));

final storyFormNotifierProvider =
    StateNotifierProvider.autoDispose<StoryFormNotifier, StoryFormState>(
  (ref) => StoryFormNotifier(ref.watch(storyRepositoryProvider)),
);

final tagFormNotifierProvider = StateNotifierProvider<TagNotifier, TagsState>(
  (ref) => TagNotifier(ref.watch(tagRepositoryProvider)),
);

final storyRepositoryProvider = Provider(
  (ref) => StoryRepository(
      ref.watch(glumDatabaseProvider),
      ref.watch(
        photoRepositoryProvider,
      )),
);

final tagRepositoryProvider = Provider(
  (ref) => TagRepository(ref.watch(glumDatabaseProvider)),
);

final photoRepositoryProvider = Provider((ref) => PhotoRepository());

final glumDatabaseProvider = Provider((ref) => GlumDatabase());

final dateTimeNotifierProvider =
    StateNotifierProvider<DateTimeNotifier, AsyncValue<DateTime>>(
  (ref) => DateTimeNotifier(),
);

final statsRepositoryProvider = Provider(
    (ref) => StatsRepository(database: ref.watch(glumDatabaseProvider)));

final statsNotifierProvider = StateNotifierProvider<StatsNotifier, StatsState>(
    (ref) => StatsNotifier(repository: ref.watch(statsRepositoryProvider)));

final cardsNotifierProvider =
    StateNotifierProvider<CardsNotifier, AsyncValue<List<Card?>>>(
        (ref) => CardsNotifier(ref.watch(cardRepositoryProvider)));

final cardRepositoryProvider = Provider(
    (ref) => CardRepository(database: ref.watch(glumDatabaseProvider)));

final cardFormNotifierProvider =
    StateNotifierProvider<CardFormNotifier, CardFormState>(
  (ref) => CardFormNotifier(ref.watch(cardRepositoryProvider)),
);
