// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meditation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeditationDto _$MeditationDtoFromJson(Map<String, dynamic> json) =>
    MeditationDto(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['audio_file_url'] as String,
      json['cover_file_url'] as String,
      (json['meditation_theme'] as num).toInt(),
      (json['meditation_narrator'] as num).toInt(),
    );

Map<String, dynamic> _$MeditationDtoToJson(MeditationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'audio_file_url': instance.audioFileUrl,
      'cover_file_url': instance.coverFileUrl,
      'meditation_theme': instance.meditationTheme,
      'meditation_narrator': instance.meditationNarrator,
    };
