import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../features/auth/data/auth_repository_impl.dart';
import '../../features/meditation/data/meditation_repository_impl.dart';
import '../../features/meditation/domain/meditation_repository.dart';
import '../../features/meditation_progress/data/meditation_progress_repository_impl.dart';
import '../../features/meditation_progress/domain/meditation_progress_repository.dart';
import '../../features/onboarding/data/onboarding_repository_impl.dart';
import '../../features/onboarding/domain/onboarding_repository.dart';
import '../../features/profile/data/profile_repository_impl.dart';
import '../../features/profile/domain/profile_repository.dart';
import '../../features/session/session_repository.dart';
import '../../features/session/session_repository_impl.dart';
import '../navigation/router.dart';
import '../network/dio_client.dart';

abstract class AppDi {
  static final _dioClient = Provider<DioClient>(
    (_) => DioClientImpl(
      dio: Dio(),
    )..init(),
  );

  static final _connectivity = Provider(
    (_) => Connectivity(),
  );

  static final _secureStorage = Provider(
    (_) => const FlutterSecureStorage(),
  );

  static final meditationRepository =
      Provider.autoDispose<MeditationRepository>(
    (ref) => MeditationRepositoryImpl(
      dioClient: ref.watch(_dioClient),
      connectivity: ref.watch(_connectivity),
    ),
  );

  static final authRepository = Provider(
    (ref) => AuthRepositoryImpl(
      ref.watch(_dioClient),
      ref.watch(_secureStorage),
    ),
  );

  static final onboardingRepository = Provider<OnboardingRepository>(
    (ref) => OnboardingRepositoryImpl(),
  );

  static final profileRepository = Provider<ProfileRepository>(
    (ref) => ProfileRepositoryImpl(
      ref.watch(_dioClient),
    ),
  );

  static final sessionRepository = Provider<SessionRepository>(
    (ref) => SessionRepositoryImpl(
      dioClient: ref.watch(_dioClient),
    ),
  );

  static final meditationProgressRepository =
      Provider<MeditationProgressRepository>(
    (ref) => MeditationProgressRepositoryImpl(
      ref.watch(_dioClient),
    ),
  );

  static final routerConfig = Provider<AppRouter>(
    (ref) => AppRouter(
      authRepository: ref.watch(authRepository),
      onboardingRepository: ref.watch(onboardingRepository),
      profileRepository: ref.watch(profileRepository),
    ),
  );
}
