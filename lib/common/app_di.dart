import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/auth/auth_repository.dart';
import '../features/auth/auth_repository_impl.dart';
import '../features/meditation/data/meditation_repository_impl.dart';
import '../features/meditation/domain/meditation_repository.dart';

abstract class AppDi {
  static final _dio = Provider.autoDispose<Dio>(
    (_) => Dio()
      ..options = BaseOptions(
        baseUrl: 'http://localhost:8000/api',
        headers: {'Content-Type': 'application/json'},
      )
      ..interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
        ),
      ),
  );

  static final meditationRepository =
      Provider.autoDispose<MeditationRepository>(
    (_) => MeditationRepositoryImpl(),
  );

  static final authRepository = Provider.autoDispose<AuthRepository>(
    (ref) => AuthRepositoryImpl(
      ref.watch(_dio),
    ),
  );
}
