import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/tag.dart';

part 'tag_dto.freezed.dart';
part 'tag_dto.g.dart';

@freezed
@JsonSerializable()
class TagDto with _$TagDto {
  const TagDto._();
  const factory TagDto({
    int? id,
    required String title,
  }) = _TagDto;

  factory TagDto.fromDomain(Tag tag) => TagDto(
        id: tag.id,
        title: tag.title,
      );

  Tag toDomain() => Tag(
        id: id ?? 0,
        title: title,
      );

  factory TagDto.FromJson(Map<String, dynamic> json) => _$TagDtoFromJson(json);
}
