abstract class AuthRepository {
  /// A getter that returns a boolean indicating whether the user is authenticated.
  Future<bool> get hasAuthenticatedUser;

  /// A function that signs up a user with the provided email and password.
  Future<bool> signUp(String email, String password);

  /// A function that refreshes the authentication and returns a boolean indicating success.
  Future<bool> refreshAuth();
}
