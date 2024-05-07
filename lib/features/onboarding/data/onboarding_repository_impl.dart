import 'package:shared_preferences/shared_preferences.dart';

import '../domain/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final SharedPreferences _sharedPreferences;

  OnboardingRepositoryImpl(this._sharedPreferences);

  static const _onboardingKey = 'onboarding_shown';

  @override
  void setOnboardingShown() => _sharedPreferences.setBool(_onboardingKey, true);

  @override
  bool get isOnboardingShown =>
      _sharedPreferences.getBool(
        _onboardingKey,
      ) ??
      false;

  void clearOnboardingShown() => _sharedPreferences.remove(_onboardingKey);
}
