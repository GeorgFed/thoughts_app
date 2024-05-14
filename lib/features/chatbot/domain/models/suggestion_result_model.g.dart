// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestion_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SuggestionResultModelImpl _$$SuggestionResultModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SuggestionResultModelImpl(
      message: json['message'] as String,
      suggestedMeditations: (json['suggested_meditations'] as List<dynamic>)
          .map((e) =>
              SuggestedMeditationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SuggestionResultModelImplToJson(
        _$SuggestionResultModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'suggested_meditations': instance.suggestedMeditations,
    };

_$SuggestedMeditationModelImpl _$$SuggestedMeditationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SuggestedMeditationModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$SuggestedMeditationModelImplToJson(
        _$SuggestedMeditationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
