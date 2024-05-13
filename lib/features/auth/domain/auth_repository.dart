abstract class AuthRepository {
  /// A getter that returns a boolean indicating whether the user is authenticated.
  Future<bool> get hasAuthenticatedUser;

  Future<void> authorize();

  /// A function that signs up a user with the provided email and password.
  Future<void> signUp(String email, String password);

  Future<void> signIn(String email, String password);

  /// A function that signs out the current user.
  Future<void> signOut();
}
