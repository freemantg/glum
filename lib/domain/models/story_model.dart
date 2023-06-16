import 'package:freezed_annotation/freezed_annotation.dart';

import 'photo_model.dart';
import 'tag_model.dart';

part 'story_model.freezed.dart';

@freezed
class StoryModel with _$StoryModel {
  const StoryModel._();
  const factory StoryModel({
    int? id,
    required String title,
    required String description,
    required int glumRating,
    required DateTime date,
    required List<TagModel> tags,
    required List<PhotoModel> photos,
  }) = _StoryModel;

  factory StoryModel.empty() => StoryModel(
        title: '',
        description: '',
        glumRating: 3,
        date: DateTime.now(),
        tags: [],
        photos: [],
      );
}
