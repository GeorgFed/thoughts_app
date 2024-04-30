import 'package:dio/dio.dart';

import '../../../common/logger.dart';
import '../domain/meditation_repository.dart';
import '../domain/model/meditation_model.dart';
import 'dto/category_dto.dart';
import 'dto/meditation_dto.dart';
import 'dto/narrator_dto.dart';

class MeditationRepositoryImpl implements MeditationRepository {
  final Dio dio;

  MeditationRepositoryImpl({
    required this.dio,
  });

  @override
  List<MeditationModel>? get meditations => _meditationModels;

  @override
  Future<List<MeditationModel>?> getMeditations() async {
    _meditations ??= await _fetchMeditations();
    _narrators ??= await _fetchNarrators();
    _categories ??= await _fetchCategories();

    _meditationModels = _meditations?.map((meditation) {
      final author = _narrators
          ?.firstWhere(
            (element) => element.id == meditation.meditationNarratorId,
          )
          .name;
      final category = _categories
          ?.firstWhere((element) => element.id == meditation.meditationThemeId)
          .name;
      return MeditationModel(
        id: meditation.id,
        title: meditation.name,
        author: author ?? '',
        description: '',
        category: category ?? '',
        cover: meditation.coverFileName,
        mediaFile: meditation.audioFileName,
        tags: [],
      );
    }).toList();

    return _meditationModels;
  }

  List<MeditationModel>? _meditationModels;

  List<MeditationDto>? _meditations;

  List<NarratorDto>? _narrators;

  List<CategoryDto>? _categories;

  Future<List<MeditationDto>?> _fetchMeditations() async {
    try {
      final response = await dio.get<List<dynamic>>('/meditation/');
      final meditations = response.data
          ?.map((e) => MeditationDto.fromJson(e as Map<String, dynamic>))
          .toList();
      return meditations ?? [];
    } on DioException catch (e) {
      logger.e('meditation query failed: $e');
      return null;
    }
  }

  Future<List<NarratorDto>?> _fetchNarrators() async {
    try {
      final response = await dio.get<List<dynamic>>('/meditation_narrator/');
      final narrators = response.data
          ?.map((e) => NarratorDto.fromJson(e as Map<String, dynamic>))
          .toList();
      return narrators ?? [];
    } on DioException catch (e) {
      logger.e('narrator query failed: $e');
      return null;
    }
  }

  Future<List<CategoryDto>?> _fetchCategories() async {
    try {
      final response = await dio.get<List<dynamic>>('/meditation_theme/');
      final categories = response.data
          ?.map((e) => CategoryDto.fromJson(e as Map<String, dynamic>))
          .toList();
      return categories ?? [];
    } on DioException catch (e) {
      logger.e('category query failed: $e');
      return null;
    }
  }
}
