import 'dart:async';

abstract class OnboardingRepository {
  // Set whether the onboarding has been shown to the user.
  Future<void> setOnboardingShown();

  // Clears the flag that indicates whether the onboarding has been shown.
  Future<void> clearOnboardingShown();

  //Get whether the onboarding has been shown to the user.
  Future<bool> get isOnboardingShown;
}
