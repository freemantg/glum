import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/models.dart';


part 'tag_dto.freezed.dart';
part 'tag_dto.g.dart';

@freezed
class TagDto with _$TagDto {
  const TagDto._();
  const factory TagDto({
    int? id,
    required String title,
  }) = _TagDto;

  factory TagDto.fromDomain(TagModel tag) => TagDto(
        id: tag.id,
        title: tag.title,
      );

  factory TagDto.fromJson(Map<String, dynamic> json) => _$TagDtoFromJson(json);

  TagModel toDomain() => TagModel(id: id, title: title);
}
