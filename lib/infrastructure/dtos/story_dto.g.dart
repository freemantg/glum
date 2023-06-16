// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoryDto _$$_StoryDtoFromJson(Map<String, dynamic> json) => _$_StoryDto(
      id: json['id'] as int?,
      title: json['title'] as String,
      description: json['description'] as String,
      glumRating: json['glumRating'] as int,
      date: DateTime.parse(json['date'] as String),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => TagDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      photos: (json['photos'] as List<dynamic>)
          .map((e) => PhotoDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_StoryDtoToJson(_$_StoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'glumRating': instance.glumRating,
      'date': instance.date.toIso8601String(),
      'tags': instance.tags,
      'photos': instance.photos,
    };
