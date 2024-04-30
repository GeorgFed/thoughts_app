import 'package:json_annotation/json_annotation.dart';

part 'narrator_dto.g.dart';

@JsonSerializable()
class NarratorDto {
  final int id;
  final String name;

  NarratorDto(this.id, this.name);

  factory NarratorDto.fromJson(Map<String, dynamic> json) =>
      _$NarratorDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NarratorDtoToJson(this);
}
