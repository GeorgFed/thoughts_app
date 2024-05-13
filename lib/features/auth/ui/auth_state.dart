sealed class AuthState {}

class AuthStateNoUser extends AuthState {}

class AuthStateError extends AuthState {
  final String message;

  AuthStateError({required this.message});
}

class AuthStateLoading extends AuthState {}

class AuthStateLoggedIn extends AuthState {
  final String? name;

  AuthStateLoggedIn({this.name});
}

class AuthStateRegistrationComplete extends AuthState {}
