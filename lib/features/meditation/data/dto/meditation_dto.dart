import 'package:json_annotation/json_annotation.dart';

part 'meditation_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MeditationDto {
  final int id;
  final String name;
  final String audioFileUrl;
  final String coverFileUrl;
  final int meditationTheme;
  final int meditationNarrator;

  MeditationDto(
    this.id,
    this.name,
    this.audioFileUrl,
    this.coverFileUrl,
    this.meditationTheme,
    this.meditationNarrator,
  );

  factory MeditationDto.fromJson(Map<String, dynamic> json) =>
      _$MeditationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MeditationDtoToJson(this);
}
