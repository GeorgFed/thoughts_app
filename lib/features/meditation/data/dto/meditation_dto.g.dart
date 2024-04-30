// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meditation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeditationDto _$MeditationDtoFromJson(Map<String, dynamic> json) =>
    MeditationDto(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['audio_file_name'] as String,
      json['cover_file_name'] as String,
      meditationThemeId: (json['meditation_theme_id'] as num?)?.toInt(),
      meditationNarratorId: (json['meditation_narrator_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MeditationDtoToJson(MeditationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'audio_file_name': instance.audioFileName,
      'cover_file_name': instance.coverFileName,
      'meditation_theme_id': instance.meditationThemeId,
      'meditation_narrator_id': instance.meditationNarratorId,
    };
