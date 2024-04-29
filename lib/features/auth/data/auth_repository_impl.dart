import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../common/logger.dart';
import '../../../common/token_interceptor.dart';
import '../domain/auth_repository.dart';
import 'dto/auth_token_refresh_request.dart';
import 'dto/auth_token_request.dart';
import 'dto/register_request.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio;
  final FlutterSecureStorage _secureStorage;

  AuthRepositoryImpl(
    this._dio,
    this._secureStorage,
  );

  @override
  Future<bool> get hasAuthenticatedUser async {
    final accessToken = await _secureStorage.read(key: 'access');
    return accessToken != null;
  }

  @override
  Future<bool> signUp(String email, String password) async {
    final registerResult = await _register(email, password);

    if (registerResult) {
      final (
        String? accessToken,
        String? refreshToken,
      ) = await _requestTokens(email, password);

      if (accessToken != null && refreshToken != null) {
        await _saveTokens(
          accessToken: accessToken,
          refreshToken: refreshToken,
        );

        _addTokenHeader(accessToken: accessToken);

        return true;
      }
    }

    logger.e('Failed to signUp');
    return false;
  }

  @override
  Future<bool> refreshAuth() async {
    final refreshToken = await _secureStorage.read(key: 'refreshToken');
    if (refreshToken == null) {
      return false;
    }

    final accessToken = await _refreshToken(refreshToken: refreshToken);
    if (accessToken != null) {
      _addTokenHeader(accessToken: accessToken);
      return true;
    }
    return false;
  }

  Future<String?> _refreshToken({required String refreshToken}) async {
    try {
      final authTokenRequest = AuthTokenRefreshRequest(
        refresh: refreshToken,
      );
      final authTokenResponse = await _dio.post<Map<String, dynamic>>(
        '/auth/token/refresh/',
        data: authTokenRequest.toJson(),
      );
      logger.i(authTokenResponse.data);

      final accessToken = authTokenResponse.data?['access'] as String;
      return accessToken;
    } on DioException catch (e) {
      logger.e('refresh query failed: $e');
      return null;
    }
  }

  Future<bool> _register(String email, String password) async {
    try {
      final request = RegisterRequest(email: email, password: password);
      final response = await _dio.post<Map<String, dynamic>>(
        '/auth/register/',
        data: request.toJson(),
      );
      logger.i(response.data);
      return true;
    } on DioException catch (e) {
      logger.e('register query failed: $e');
      return false;
    }
  }

  Future<(String?, String?)> _requestTokens(
    String email,
    String password,
  ) async {
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
      final accessToken = authTokenResponse.data?['access'] as String;
      final refreshToken = authTokenResponse.data?['refresh'] as String;

      return (accessToken, refreshToken);
    } on DioException catch (e) {
      logger.e('auth token query failed: ${e.response?.data}');
      return (null, null);
    }
  }

  Future<void> _saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _secureStorage.write(key: 'access', value: accessToken);
    await _secureStorage.write(key: 'refresh', value: refreshToken);

    logger.i('Tokens saved');
  }

  void _addTokenHeader({
    required String accessToken,
  }) =>
      _dio.interceptors.add(
        TokenInterceptor(
          token: accessToken,
        ),
      );
}
