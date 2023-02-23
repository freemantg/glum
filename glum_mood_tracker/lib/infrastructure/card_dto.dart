import 'package:flutter/material.dart' hide Card;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glum_mood_tracker/infrastructure/photo_dto.dart';

import '../domain/card.dart';

part 'card_dto.freezed.dart';
part 'card_dto.g.dart';

@freezed
class CardDto with _$CardDto {
  const CardDto._();
  const factory CardDto({
    int? id,
    required DateTime monthYear,
    int? colorValue,
    PhotoDto? photo,
  }) = _CardDto;

  factory CardDto.fromJson(Map<String, dynamic> json) =>
      _$CardDtoFromJson(json);

  factory CardDto.fromDomain(Card card) {
    return CardDto(
      id: card.id,
      monthYear: card.monthYear,
      colorValue: card.color?.value,
      photo: (card.photo != null) ? PhotoDto.fromDomain(card.photo!) : null,
    );
  }

  Card toDomain() {
    return Card(
      id: id,
      monthYear: monthYear,
      color: (colorValue != null) ? Color(colorValue!) : null,
      photo: photo?.toDomain(),
    );
  }
}
