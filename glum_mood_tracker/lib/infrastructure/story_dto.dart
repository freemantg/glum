import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glum_mood_tracker/domain/tag.dart';

import '../domain/story.dart';
import 'drift_database.dart';

part 'story_dto.freezed.dart';

@freezed
class StoryDto with _$StoryDto {
  const StoryDto._();
  const factory StoryDto({
    required StoryData story,
    required List<TagData> tags,
    required List<PhotoData> photos,
  }) = _StoryDto;

  factory StoryDto.fromDomain(Story story) => StoryDto(
        story: StoryData(
          id: story.id ?? 0,
          title: story.title,
          description: story.description,
          glumRating: story.glumRating,
          date: story.date,
        ),
        tags: [
          for (var tag in story.tags)
            TagData(
              id: tag.id!,
              title: tag.title,
            )
        ],
        photos: [],
      );

  Story toDomain() => Story(
        id: story.id,
        title: story.title,
        description: story.description,
        glumRating: story.glumRating,
        date: story.date,
        tags: tags
            .map(
              (tagData) => Tag(
                id: tagData.id,
                title: tagData.title,
              ),
            )
            .toList(),
        photos: [],
      );
}
