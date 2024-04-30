import 'package:dio/dio.dart';

import '../../../common/logger.dart';
import '../domain/meditation_repository.dart';
import '../domain/model/category_model.dart';
import '../domain/model/meditation_model.dart';
import '../domain/model/narrator_model.dart';
import 'dto/category_dto.dart';
import 'dto/meditation_dto.dart';
import 'dto/narrator_dto.dart';

class MeditationRepositoryImpl implements MeditationRepository {
  final Dio dio;

  MeditationRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<MeditationModel>?> get meditations async {
    if (_meditations == null) await fetchData();

    return _meditations;
  }

  @override
  Future<List<CategoryModel>?> get categories async {
    if (_categories == null) await fetchData();

    return _categories;
  }

  @override
  Future<List<NarratorModel>?> get narrators async {
    if (_narrators == null) await fetchData();

    return _narrators;
  }

  @override
  Future<void> fetchData() async {
    final narrators = await _fetchNarrators();
    final categories = await _fetchCategories();
    final meditations = await _fetchMeditations();
    // final _ = await _fetchRecommendMeditations();

    _categories = categories
        ?.map<CategoryModel>(
          (category) => CategoryModel(
            id: category.id.toString(),
            name: category.name,
          ),
        )
        .toList();

    _narrators = narrators
        ?.map(
          (narrator) => NarratorModel(
            id: narrator.id.toString(),
            name: narrator.name,
          ),
        )
        .toList();

    _meditations = meditations
        ?.map(
          (meditation) => MeditationModel(
            id: meditation.id.toString(),
            title: meditation.name,
            trackUrl: meditation.audioFileName,
            coverUrl: meditation.coverFileName,
            narrator: narratorById(meditation.meditationNarratorId.toString()),
            category: categoryById(meditation.meditationThemeId.toString()),
            tags: [],
          ),
        )
        .toList();
  }

  @override
  List<MeditationModel>? meditationsByCategory(String categoryId) =>
      _meditations
          ?.where(
            (meditation) => meditation.category?.id == categoryId,
          )
          .toList();

  @override
  CategoryModel? categoryById(String categoryId) => _categories?.firstWhere(
        (category) => category.id == categoryId,
      );

  @override
  NarratorModel? narratorById(String narratorId) => _narrators?.firstWhere(
        (narrator) => narrator.id == narratorId,
      );

  List<MeditationModel>? _meditations;

  List<CategoryModel>? _categories;

  List<NarratorModel>? _narrators;

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

  Future<List<MeditationDto>?> _fetchRecommendMeditations() async {
    try {
      final response = await dio.get<List<dynamic>>(
        '/meditation/recomendate_meditations/',
      );
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
