import 'package:riverpod/riverpod.dart';

import '../../core/di/app_di.dart';
import 'profile_view_model.dart';

abstract class ProfileDi {
  static final viewModel = Provider<ProfileViewModel>(
    (ref) => ProfileViewModel(
      ref.watch(AppDi.authRepository),
      ref.watch(AppDi.profileRepository),
      ref.watch(AppDi.meditationProgressRepository),
    ),
  );
}
