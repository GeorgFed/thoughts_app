import 'package:bloc/bloc.dart';

import 'auth_repository.dart';
import 'auth_state.dart';

class AuthViewModel extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthViewModel(
    this.authRepository,
  ) : super(AuthStateNoUser());

  Future<void> onSignUp({
    required String email,
    required String password,
  }) async {
    emit(AuthStateLoading());
    final result = await authRepository.signUp(email, password);

    if (result) {
      emit(AuthStateLoggedIn());
    } else {
      emit(AuthStateError());
    }
  }
}
