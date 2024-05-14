import 'package:freezed_annotation/freezed_annotation.dart';

part 'suggestion_result_model.freezed.dart';
part 'suggestion_result_model.g.dart';

@freezed
class SuggestionResultModel with _$SuggestionResultModel {
  const factory SuggestionResultModel({
    required String message,
    @JsonKey(name: 'suggested_meditations')
    required List<SuggestedMeditationModel> suggestedMeditations,
  }) = _SuggestionResultModel;

  factory SuggestionResultModel.fromJson(Map<String, dynamic> json) =>
      _$SuggestionResultModelFromJson(json);
}

@freezed
class SuggestedMeditationModel with _$SuggestedMeditationModel {
  const factory SuggestedMeditationModel({
    required int id,
    required String name,
  }) = _SuggestedMeditationModel;

  factory SuggestedMeditationModel.fromJson(Map<String, dynamic> json) =>
      _$SuggestedMeditationModelFromJson(json);
}
