import 'package:riverpod/riverpod.dart';

import '../../../core/di/app_di.dart';
import 'auth_view_model.dart';

abstract class AuthDi {
  static final viewModel = Provider.autoDispose<AuthViewModel>(
    (ref) => AuthViewModel(
      ref.watch(AppDi.authRepository),
      ref.watch(AppDi.profileRepository),
    ),
  );
}
