import 'package:freezed_annotation/freezed_annotation.dart';

import 'category_model.dart';
import 'narrator_model.dart';

part 'meditation_model.freezed.dart';

@freezed
class MeditationModel with _$MeditationModel {
  factory MeditationModel({
    required String id,
    required String title,
    required String coverUrl,
    required String trackUrl,
    required List<String> tags,
    NarratorModel? narrator,
    CategoryModel? category,
  }) = _MeditationModel;
}
