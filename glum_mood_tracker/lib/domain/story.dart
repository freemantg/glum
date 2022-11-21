import 'package:freezed_annotation/freezed_annotation.dart';

import 'tag.dart';

part 'story.freezed.dart';

@freezed
class Story with _$Story {
  const Story._();
  const factory Story({
    required int id,
    required String title,
    required String description,
    required int glumRating,
    required DateTime date,
    required List<Tag> tags,
  }) = _Story;

  factory Story.empty() => Story(
        id: 0,
        title: '',
        description: '',
        glumRating: 3,
        date: DateTime.now(),
        tags: [],
      );
}
