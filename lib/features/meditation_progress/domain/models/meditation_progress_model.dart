import 'package:freezed_annotation/freezed_annotation.dart';

part 'meditation_progress_model.freezed.dart';
part 'meditation_progress_model.g.dart';

@freezed
class MeditationProgressModel with _$MeditationProgressModel {
  const factory MeditationProgressModel({
    @JsonKey(name: 'level_name') required String levelName,
    @JsonKey(name: 'next_level_count') required int nextLevelCount,
    @JsonKey(name: 'current_level_count') required int currentLevelCount,
  }) = _MeditationProgressModel;

  factory MeditationProgressModel.fromJson(Map<String, dynamic> json) =>
      _$MeditationProgressModelFromJson(json);
}
