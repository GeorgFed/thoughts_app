abstract class ProfileRepository {
  Future<bool> get hasUserData;

  Future<String> getUserName();

  Future<void> updateUserName(String name);

  Future<void> clearUserData();
}
