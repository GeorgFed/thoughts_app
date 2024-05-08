import 'package:shared_preferences/shared_preferences.dart';

import '../domain/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  OnboardingRepositoryImpl();

  static const _onboardingKey = 'onboarding_shown';

  @override
  Future<void> setOnboardingShown() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(_onboardingKey, true);
  }

  @override
  Future<bool> get isOnboardingShown async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(
          _onboardingKey,
        ) ??
        false;
  }

  @override
  Future<void> clearOnboardingShown() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(_onboardingKey);
  }
}
