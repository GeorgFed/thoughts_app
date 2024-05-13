// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meditation_progress_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MeditationProgressModelImpl _$$MeditationProgressModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MeditationProgressModelImpl(
      levelName: json['level_name'] as String,
      nextLevelCount: (json['next_level_count'] as num).toInt(),
      currentLevelCount: (json['current_level_count'] as num).toInt(),
    );

Map<String, dynamic> _$$MeditationProgressModelImplToJson(
        _$MeditationProgressModelImpl instance) =>
    <String, dynamic>{
      'level_name': instance.levelName,
      'next_level_count': instance.nextLevelCount,
      'current_level_count': instance.currentLevelCount,
    };
