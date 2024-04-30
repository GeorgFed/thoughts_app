import 'package:freezed_annotation/freezed_annotation.dart';

part 'narrator_model.freezed.dart';

@freezed
class NarratorModel with _$NarratorModel {
  const factory NarratorModel({
    required String id,
    required String name,
  }) = _NarratorModel;
}
