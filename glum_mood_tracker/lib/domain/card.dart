import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glum_mood_tracker/domain/photo.dart';

part 'card.freezed.dart';

@freezed
class Card with _$Card {
  const Card._();
  const factory Card({
    int? id,
    required DateTime monthYear,
    Color? color,
    Photo? photo,
  }) = _Card;
}
