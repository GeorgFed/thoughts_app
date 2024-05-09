import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/dto/meditation_dto.dart';
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

  static MeditationModel fromDto(
    MeditationDto dto,
    CategoryModel? category,
    NarratorModel? narrator,
  ) =>
      MeditationModel(
        id: dto.id.toString(),
        title: dto.name,
        coverUrl: dto.coverFileUrl,
        trackUrl: dto.audioFileUrl,
        tags: [],
        narrator: narrator,
        category: category,
      );
}
