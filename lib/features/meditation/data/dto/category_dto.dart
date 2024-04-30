import 'package:json_annotation/json_annotation.dart';

part 'category_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CategoryDto {
  final int id;
  final String name;
  final String coverFileName;

  CategoryDto(this.id, this.name, this.coverFileName);

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);
}
