import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/logger.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/exceptions/network_exception.dart';
import '../domain/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final DioClient _dioClient;

  ProfileRepositoryImpl(
    this._dioClient,
  );

  static const _userNameKey = 'user_name';

  String? _userName;

  String? get userName => _userName;

  @override
  Future<bool> get hasUserData async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString(_userNameKey);
    logger.d('hasUserDat: $name');
    return prefs.getString(_userNameKey) != null;
  }

  @override
  Future<String> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    final name = _userName ?? prefs.getString(_userNameKey);
    if (name != null) {
      _userName = name;
      return name;
    }

    try {
      final nameResponse = await _dioClient.core.get<Map<String, dynamic>>(
        '/user_info/',
      );
      final name = nameResponse.data?['name'] as String;
      logger.i(name);
      _userName = name;
      _cacheUserData(name);
      return name;
    } on DioException catch (e) {
      logger.e('profile query failed: ${e.response?.data}');
      throw NetworkException(
        message: 'Не удалось загрузить данные пользователя',
        title: 'Ошибка загрузки данных',
      );
    }
  }

  @override
  Future<void> updateUserName(String name) async {
    try {
      await _dioClient.core.patch<Map<String, dynamic>>(
        '/user_info/',
        data: {'name': name},
      );
      _userName = name;
      _cacheUserData(name);
    } on DioException catch (e) {
      logger.e('/user_info/ query failed: $e');
      throw NetworkException(message: 'Не удалось завершить регистрацию');
    }
  }

  Future<void> _cacheUserData(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userNameKey, name);
  }

  Future<void> _removeUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userNameKey);
  }

  @override
  Future<void> clearUserData() async {
    _userName = null;
    await _removeUserData();
  }
}
