import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glum_mood_tracker/infrastructure/database/drift_database.dart';
import 'package:image_picker/image_picker.dart';

import '../application/notifiers.dart';
import '../infrastructure/repositories/repositories.dart';

// Providers
final storyRepositoryProvider = Provider(
  (ref) => StoryRepository(
    ref.watch(databaseProvider),
    ref.watch(photoRepositoryProvider),
  ),
);

final tagRepositoryProvider = Provider(
  (ref) => TagRepository(ref.watch(databaseProvider)),
);

final photoRepositoryProvider = Provider(
  (ref) => PhotoRepository(
    imagePicker: ref.watch(imagePickerProvider),
    glumDatabase: ref.watch(databaseProvider),
  ),
);
final databaseProvider = Provider((ref) => GlumDatabase());
final imagePickerProvider = Provider((ref) => ImagePicker());

final statsRepositoryProvider = Provider(
  (ref) => StatsRepository(database: ref.watch(databaseProvider)),
);

final cardRepositoryProvider = Provider(
  (ref) => CardRepository(database: ref.watch(databaseProvider)),
);

// Notifiers
final storyNotifierProvider = StateNotifierProvider<StoryNotifier, StoryState>(
  (ref) => StoryNotifier(storyRepository: ref.watch(storyRepositoryProvider)),
);

final storyFormNotifierProvider =
    StateNotifierProvider.autoDispose<StoryFormNotifier, StoryFormState>(
  (ref) => StoryFormNotifier(
    storyRepository: ref.watch(storyRepositoryProvider),
    photoRepository: ref.watch(photoRepositoryProvider),
  ),
);
final tagNotifierProvider = StateNotifierProvider<TagNotifier, TagsState>(
  (ref) => TagNotifier(ref.watch(tagRepositoryProvider)),
);

final dateTimeNotifierProvider =
    StateNotifierProvider<DateTimeNotifier, AsyncValue<DateTime>>(
  (ref) => DateTimeNotifier(),
);

final statsNotifierProvider = StateNotifierProvider<StatsNotifier, StatsState>(
  (ref) => StatsNotifier(repository: ref.watch(statsRepositoryProvider)),
);

final cardFormNotifierProvider =
    StateNotifierProvider<CardFormNotifier, CardFormState>(
  (ref) => CardFormNotifier(
      cardRepository: ref.watch(cardRepositoryProvider),
      photoRepository: ref.watch(photoRepositoryProvider)),
);

final cardsStateNotifierProvider =
    StateNotifierProvider<CardsStateNotifier, CardsState>(
  (ref) => CardsStateNotifier(repository: ref.watch(cardRepositoryProvider)),
);

final photosStateNotifierProvider =
    StateNotifierProvider<PhotosStateNotifier, PhotosState>(
  (ref) => PhotosStateNotifier(repository: ref.watch(photoRepositoryProvider)),
);
