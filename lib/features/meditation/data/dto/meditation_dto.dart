import 'package:json_annotation/json_annotation.dart';

part 'meditation_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MeditationDto {
  final int id;
  final String name;
  final String audioFileName;
  final String coverFileName;
  final int? meditationThemeId;
  final int? meditationNarratorId;

  MeditationDto(
    this.id,
    this.name,
    this.audioFileName,
    this.coverFileName, {
    this.meditationThemeId,
    this.meditationNarratorId,
  });

  factory MeditationDto.fromJson(Map<String, dynamic> json) =>
      _$MeditationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MeditationDtoToJson(this);
}
