// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CardDto _$$_CardDtoFromJson(Map<String, dynamic> json) => _$_CardDto(
      id: json['id'] as int?,
      monthYear: DateTime.parse(json['monthYear'] as String),
      colorValue: json['colorValue'] as int?,
      photo: json['photo'] == null
          ? null
          : PhotoDto.fromJson(json['photo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CardDtoToJson(_$_CardDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'monthYear': instance.monthYear.toIso8601String(),
      'colorValue': instance.colorValue,
      'photo': instance.photo,
    };
