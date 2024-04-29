import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../features/auth/data/auth_repository_impl.dart';
import '../features/meditation/data/meditation_repository_impl.dart';
import '../features/meditation/domain/meditation_repository.dart';
import 'router.dart';

abstract class AppDi {
  static final _dio = Provider(
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

  static final _secureStorage = Provider(
    (_) => const FlutterSecureStorage(),
  );

  static final meditationRepository =
      Provider.autoDispose<MeditationRepository>(
    (_) => MeditationRepositoryImpl(),
  );

  static final authRepository = Provider(
    (ref) => AuthRepositoryImpl(
      ref.watch(_dio),
      ref.watch(_secureStorage),
    ),
  );

  static final routerConfig = Provider<AppRouter>(
    (ref) => AppRouter(
      authRepository: ref.watch(authRepository),
    ),
  );
}
