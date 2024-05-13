import 'package:bloc/bloc.dart';

import '../../../core/network/exceptions/network_exception.dart';
import '../../profile/domain/profile_repository.dart';
import '../domain/auth_repository.dart';
import 'auth_state.dart';

class AuthViewModel extends Cubit<AuthState> {
  final AuthRepository authRepository;
  final ProfileRepository profileRepository;

  AuthViewModel(
    this.authRepository,
    this.profileRepository,
  ) : super(AuthStateNoUser());

  Future<void> onSignUp({
    required String email,
    required String password,
  }) async {
    emit(AuthStateLoading());
    try {
      await authRepository.signUp(email, password);
      emit(AuthStateLoggedIn());
    } on NetworkException catch (e) {
      emit(AuthStateError(message: e.message));
    }
  }

  Future<void> enterName(String name) async {
    emit(AuthStateLoading());
    try {
      await profileRepository.updateUserName(name);
      emit(AuthStateRegistrationComplete());
    } on NetworkException catch (e) {
      emit(AuthStateError(message: e.message));
    }
  }

  Future<void> onSignIn({
    required String email,
    required String password,
  }) async {
    emit(AuthStateLoading());
    try {
      await authRepository.signIn(email, password);
      emit(AuthStateLoggedIn());
    } on NetworkException catch (e) {
      emit(AuthStateError(message: e.message));
    }
  }
}
