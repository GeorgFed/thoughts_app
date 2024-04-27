import 'package:dio/dio.dart';

import '../../common/logger.dart';
import '../../common/token_interceptor.dart';
import 'auth_repository.dart';
import 'auth_token_request.dart';
import 'register_request.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio;

  AuthRepositoryImpl(this._dio);

  @override
  Future<bool> signUp(String email, String password) async {
    final registerResult = await _register(email, password);

    if (registerResult) {
      return _requestToken(email, password);
    }

    logger.e('Failed to signUp');
    return false;
  }

  Future<bool> _register(String email, String password) async {
    try {
      final registerRequest = RegisterRequest(email: email, password: password);
      final registerResponse = await _dio.post<Map<String, dynamic>>(
        '/auth/register/',
        data: {
          'email': email,
          'password': password,
        },
      );
      logger.i(registerResponse.data);
      return true;
    } on DioException catch (e) {
      logger.e('register query failed: $e');
      return false;
    }
  }

  Future<bool> _requestToken(String email, String password) async {
    try {
      final atIndex = email.indexOf('@');
      final username = email.substring(0, atIndex);
      final authTokenRequest = AuthTokenRequest(
        username: username,
        password: password,
      );
      final authTokenResponse = await _dio.post<Map<String, dynamic>>(
        '/auth/token/',
        data: authTokenRequest.toJson(),
      );

      logger.i(authTokenResponse.data);
      final token = authTokenResponse.data?['access'] as String;

      if (token == null) {
        logger.e('Failed to get token');
        return false;
      }

      _dio.interceptors.add(
        TokenInterceptor(
          token: token,
        ),
      );

      return true;
    } on DioException catch (e) {
      logger.e('auth token query failed: ${e.response?.data}');
      return false;
    }
  }
}
