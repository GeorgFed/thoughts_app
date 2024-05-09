abstract class AuthRepository {
  /// A getter that returns a boolean indicating whether the user is authenticated.
  Future<bool> get hasAuthenticatedUser;

  Future<void> authorize();

  /// A function that signs up a user with the provided email and password.
  Future<bool> signUp(String email, String password);

  Future<bool> signIn(String email, String password);

  /// A function that signs out the current user.
  Future<void> signOut();
}
