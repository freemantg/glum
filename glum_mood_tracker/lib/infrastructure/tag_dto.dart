import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/tag.dart';

part 'tag_dto.freezed.dart';
part 'tag_dto.g.dart';

@freezed
class TagDto with _$TagDto {
  const TagDto._();
  @JsonSerializable(includeIfNull: false)
  const factory TagDto({
     int? id,
    required String title,
  }) = _TagDto;

  factory TagDto.fromDomain(Tag tag) => TagDto(
        id: tag.id,
        title: tag.title,
      );

  factory TagDto.fromJson(Map<String, dynamic> json) => _$TagDtoFromJson(json);

  Tag toDomain() => Tag(id: id, title: title);
}
