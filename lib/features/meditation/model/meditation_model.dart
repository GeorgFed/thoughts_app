import 'package:freezed_annotation/freezed_annotation.dart';

part 'meditation_model.freezed.dart';
part 'meditation_model.g.dart';

@freezed
abstract class MeditationModel with _$MeditationModel {
  factory MeditationModel({
    required int id,
    required String title,
    required String author,
    required String description,
    required String category,
    required String cover,
    required String mediaFile,
    required List<String> tags,
  }) = _MeditationModel;

  factory MeditationModel.fromJson(Map<String, dynamic> json) =>
      _$MeditationModelFromJson(json);
}
