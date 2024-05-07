abstract class OnboardingRepository {
  // Set whether the onboarding has been shown to the user.
  void setOnboardingShown();

  // Clears the flag that indicates whether the onboarding has been shown.
  void clearOnboardingShown();

  //Get whether the onboarding has been shown to the user.
  bool get isOnboardingShown;
}
