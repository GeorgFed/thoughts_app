import 'package:riverpod/riverpod.dart';

import '../../core/di/app_di.dart';
import 'onboarding_view_model.dart';

abstract class OnboardingDi {
  static final viewModel = Provider<OnboardingViewModel>(
    (ref) => OnboardingViewModel(
      ref.watch(
        AppDi.onboardingRepository,
      ),
    ),
  );
}
