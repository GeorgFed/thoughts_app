// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meditation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MeditationModelImpl _$$MeditationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MeditationModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      author: json['author'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      cover: json['cover'] as String,
      mediaFile: json['mediaFile'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$MeditationModelImplToJson(
        _$MeditationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'description': instance.description,
      'category': instance.category,
      'cover': instance.cover,
      'mediaFile': instance.mediaFile,
      'tags': instance.tags,
    };
