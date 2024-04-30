// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'narrator_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NarratorDto _$NarratorDtoFromJson(Map<String, dynamic> json) => NarratorDto(
      (json['id'] as num).toInt(),
      json['name'] as String,
    );

Map<String, dynamic> _$NarratorDtoToJson(NarratorDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
