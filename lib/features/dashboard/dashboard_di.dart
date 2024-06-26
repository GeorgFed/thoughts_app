import 'package:riverpod/riverpod.dart';

import '../../core/di/app_di.dart';
import 'dashboard_view_model.dart';

abstract class DashboardDi {
  static final viewModel = Provider.autoDispose<DashboardViewModel>(
    (ref) => DashboardViewModel(
      meditationRepository: ref.watch(AppDi.meditationRepository),
      authRepository: ref.watch(AppDi.authRepository),
      profileRepository: ref.watch(AppDi.profileRepository),
    ),
  );
}
