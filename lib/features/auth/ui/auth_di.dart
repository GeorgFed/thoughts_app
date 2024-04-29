import 'package:riverpod/riverpod.dart';

import '../../../common/app_di.dart';
import 'auth_view_model.dart';

abstract class AuthDi {
  static final viewModel = Provider.autoDispose<AuthViewModel>(
    (ref) => AuthViewModel(
      ref.watch(AppDi.authRepository),
    ),
  );
}
