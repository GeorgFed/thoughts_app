import 'domain/onboarding_repository.dart';

class OnboardingViewModel {
  final OnboardingRepository repository;

  OnboardingViewModel(
    this.repository,
  );

  void onOnboardingShown() => repository.setOnboardingShown();
}
