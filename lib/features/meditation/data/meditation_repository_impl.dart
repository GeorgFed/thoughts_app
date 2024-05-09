import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

import '../../../common/logger.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/exceptions/connection_exception.dart';
import '../../../core/network/exceptions/network_exception.dart';
import '../domain/meditation_repository.dart';
import '../domain/model/category_model.dart';
import '../domain/model/meditation_model.dart';
import '../domain/model/narrator_model.dart';
import 'dto/category_dto.dart';
import 'dto/meditation_dto.dart';
import 'dto/narrator_dto.dart';

class MeditationRepositoryImpl implements MeditationRepository {
  final DioClient dioClient;
  final Connectivity connectivity;

  MeditationRepositoryImpl({
    required this.dioClient,
    required this.connectivity,
  });

  @override
  List<MeditationModel>? get meditations => _meditations;

  @override
  List<MeditationModel>? get recommendedMeditations => _recommendedMeditations;

  @override
  List<CategoryModel>? get categories => _categories;

  @override
  List<NarratorModel>? get narrators => _narrators;

  @override
  Future<void> fetchData() async {
    logger.d('fetching data');

    final connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      throw ConnectionException();
    }

    try {
      final narrators = await _fetchNarrators();
      final categories = await _fetchCategories();
      final meditations = await _fetchMeditations();
      // final recommendedMeditations = await _fetchRecommendMeditations();

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
            (meditation) => MeditationModel.fromDto(
              meditation,
              categoryById(meditation.meditationTheme.toString()),
              narratorById(meditation.meditationNarrator.toString()),
            ),
          )
          .toList();

      _recommendedMeditations = meditations
          ?.take(3)
          .map(
            (meditation) => MeditationModel.fromDto(
              meditation,
              categoryById(meditation.meditationTheme.toString()),
              narratorById(meditation.meditationNarrator.toString()),
            ),
          )
          .toList();
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        logger.e('Unauthorized exception');
        return;
      }

      throw NetworkException(
        message: 'Пожалуйста, попробуйте позже',
        title: 'Не удалось загрузить медитации',
      );
    }
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

  List<MeditationModel>? _recommendedMeditations;

  List<CategoryModel>? _categories;

  List<NarratorModel>? _narrators;

  Future<List<MeditationDto>?> _fetchMeditations() async {
    try {
      final response = await dioClient.core.get<List<dynamic>>('/meditation/');
      final meditations = response.data
          ?.map((e) => MeditationDto.fromJson(e as Map<String, dynamic>))
          .toList();
      return meditations ?? [];
    } on DioException catch (e) {
      logger.e('meditation query failed: $e');
      rethrow;
    }
  }

  // Future<List<MeditationDto>?> _fetchRecommendMeditations() async {
  //   try {
  //     final response = await dioClient.core.get<List<dynamic>>(
  //       '/meditation/recomendate_meditations/',
  //     );
  //     final meditations = response.data
  //         ?.map((e) => MeditationDto.fromJson(e as Map<String, dynamic>))
  //         .toList();
  //     return meditations ?? [];
  //   } on DioException catch (e) {
  //     logger.e('recomendate_meditations query failed: $e');
  //     rethrow;
  //   }
  // }

  Future<List<NarratorDto>?> _fetchNarrators() async {
    try {
      final response =
          await dioClient.core.get<List<dynamic>>('/meditation_narrator/');
      final narrators = response.data
          ?.map((e) => NarratorDto.fromJson(e as Map<String, dynamic>))
          .toList();
      return narrators ?? [];
    } on DioException catch (e) {
      logger.e('narrator query failed: $e');
      rethrow;
    }
  }

  Future<List<CategoryDto>?> _fetchCategories() async {
    try {
      final response =
          await dioClient.core.get<List<dynamic>>('/meditation_theme/');
      final categories = response.data
          ?.map((e) => CategoryDto.fromJson(e as Map<String, dynamic>))
          .toList();
      return categories ?? [];
    } on DioException catch (e) {
      logger.e('meditation_theme query failed: $e');
      rethrow;
    }
  }
}
