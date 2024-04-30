abstract class AppModeProvider {
  static const String _demoModeKey = 'demo-mode';

  static const isDemoMode = String.fromEnvironment(_demoModeKey) == 'true';
}
