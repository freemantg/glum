import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glum_mood_tracker/domain/photo_model.dart';

part 'card_model.freezed.dart';

@freezed
class CardModel with _$CardModel {
  const CardModel._();
  const factory CardModel({
    int? id,
    required DateTime monthYear,
    Color? color,
    PhotoModel? photo,
  }) = _CardModel;
}
