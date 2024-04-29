sealed class AuthState {}

class AuthStateNoUser extends AuthState {}

class AuthStateError extends AuthState {}

class AuthStateLoading extends AuthState {}

class AuthStateLoggedIn extends AuthState {
  final String? name;

  AuthStateLoggedIn({this.name});
}
