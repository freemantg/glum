import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/models.dart';
import 'photo_dto.dart';
import 'tag_dto.dart';

part 'story_dto.freezed.dart';
part 'story_dto.g.dart';

@freezed
class StoryDto with _$StoryDto {
  const StoryDto._();
  const factory StoryDto({
    required int? id,
    required String title,
    required String description,
    required int glumRating,
    required DateTime date,
    required List<TagDto> tags,
    required List<PhotoDto> photos,
  }) = _StoryDto;

  factory StoryDto.fromDomain(StoryModel story) {
    return StoryDto(
      id: story.id,
      title: story.title,
      description: story.description,
      glumRating: story.glumRating,
      date: story.date,
      tags: story.tags.map((e) => TagDto.fromDomain(e)).toList(),
      photos: story.photos.map((e) => PhotoDto.fromDomain(e)).toList(),
    );
  }

  StoryModel toDomain() {
    return StoryModel(
      id: id,
      title: title,
      description: description,
      glumRating: glumRating,
      date: date,
      tags: tags.map((e) => e.toDomain()).toList(),
      photos: photos.map((e) => e.toDomain()).toList(),
    );
  }

  factory StoryDto.fromJson(Map<String, dynamic> json) =>
      _$StoryDtoFromJson(json);
}
