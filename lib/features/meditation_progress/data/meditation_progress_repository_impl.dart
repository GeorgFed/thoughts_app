import 'package:dio/dio.dart';

import '../../../common/logger.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/exceptions/network_exception.dart';
import '../domain/meditation_progress_repository.dart';
import '../domain/models/meditation_progress_model.dart';

class MeditationProgressRepositoryImpl implements MeditationProgressRepository {
  final DioClient _dioClient;

  MeditationProgressRepositoryImpl(this._dioClient);

  @override
  Future<MeditationProgressModel> getProgress() async {
    try {
      final response = await _dioClient.core.get<Map<String, dynamic>>(
        '/meditation_progress/',
      );

      final data = response.data;
      if (data == null) {
        logger.d('meditation_progress: no data');
        throw NetworkException(message: 'Ошибка при загрузке достижений');
      }

      final model = MeditationProgressModel.fromJson(data);
      return model;
    } on DioException catch (e) {
      logger.e(e);
      throw NetworkException(message: 'Не удалось загрузить достижения');
    }
  }
}
