// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TagDto _$$_TagDtoFromJson(Map<String, dynamic> json) => _$_TagDto(
      id: json['id'] as int?,
      title: json['title'] as String,
    );

Map<String, dynamic> _$$_TagDtoToJson(_$_TagDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['title'] = instance.title;
  return val;
}
