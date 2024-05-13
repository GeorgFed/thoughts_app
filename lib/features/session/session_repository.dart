import 'package:dio/dio.dart';

import '../../common/logger.dart';
import '../../core/network/dio_client.dart';
import 'session_repository_impl.dart';

class SessionRepositoryImpl implements SessionRepository {
  final DioClient dioClient;

  SessionRepositoryImpl({
    required this.dioClient,
  });

  @override
  Future<void> addMeditationSession({
    required String meditationId,
  }) async {
    try {
      final id = int.tryParse(meditationId);
      final response = await dioClient.core.post<Map<String, dynamic>>(
        '/meditation_session/',
        data: {'meditation': id},
      );
      logger.d(response);
    } on DioException catch (e) {
      logger.e(e);
    }
  }
}
