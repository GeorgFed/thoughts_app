import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../common/logger.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/exceptions/network_exception.dart';
import '../../../core/network/interceptors/auth_interceptor.dart';
import '../../../core/network/interceptors/refresh_token_interceptor.dart';
import '../domain/auth_repository.dart';
import 'dto/auth_token_refresh_request.dart';
import 'dto/auth_token_request.dart';
import 'dto/register_request.dart';

class AuthRepositoryImpl implements AuthRepository {
  final DioClient _dioClient;
  final FlutterSecureStorage _secureStorage;

  AuthRepositoryImpl(
    this._dioClient,
    this._secureStorage,
  );

  static const _accessKey = 'access';
  static const _refreshKey = 'refresh';

  @override
  Future<bool> get hasAuthenticatedUser async {
    final accessToken = await _secureStorage.read(key: _accessKey);
    final refreshToken = await _secureStorage.read(key: _refreshKey);

    return accessToken != null && refreshToken != null;
  }

  @override
  Future<void> authorize() async {
    if (await hasAuthenticatedUser) {
      final accessToken = await _secureStorage.read(
        key: _accessKey,
      ) as String;
      final refreshToken = await _secureStorage.read(
        key: _refreshKey,
      ) as String;
      _addAuthInterceptors(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
    }
  }

  @override
  Future<void> signUp(String email, String password) async {
    try {
      await _register(email, password);
      await signIn(email, password);
    } on NetworkException catch (_) {
      logger.e('Failed to signUp');
      rethrow;
    }
  }

  @override
  Future<void> signIn(
    String email,
    String password,
  ) async {
    try {
      final (
        String accessToken,
        String refreshToken,
      ) = await _requestTokens(email, password);

      await _saveTokens(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );

      _addAuthInterceptors(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
    } on NetworkException catch (_) {
      logger.e('Failed to signIn');
      rethrow;
    }
  }

  Future<(String?, String?)> _refreshToken({
    required String refreshToken,
  }) async {
    try {
      final authTokenRequest = AuthTokenRefreshRequest(
        refresh: refreshToken,
      );
      final authTokenResponse =
          await _dioClient.core.post<Map<String, dynamic>>(
        '/auth/token/refresh/',
        data: authTokenRequest.toJson(),
      );
      logger.i(authTokenResponse.data);

      final newAccessToken = authTokenResponse.data?['access'] as String;

      return (newAccessToken, refreshToken);
    } on DioException catch (e) {
      logger.e('refresh query failed: $e');
      throw NetworkException(message: 'Не удалось войти в аккаунт');
    }
  }

  Future<void> _register(String email, String password) async {
    try {
      final request = RegisterRequest(email: email, password: password);
      final response = await _dioClient.core.post<Map<String, dynamic>>(
        '/auth/register/',
        data: request.toJson(),
      );
      logger.i(response.data);
    } on DioException catch (e) {
      logger.e('register query failed: $e');
      throw NetworkException(message: 'Не удалось зарегестрироваться');
    }
  }

  Future<(String, String)> _requestTokens(
    String email,
    String password,
  ) async {
    try {
      final atIndex = email.indexOf('@');
      final username = atIndex == -1 ? email : email.substring(0, atIndex);
      final authTokenRequest = AuthTokenRequest(
        username: username,
        password: password,
      );
      final authTokenResponse =
          await _dioClient.core.post<Map<String, dynamic>>(
        '/auth/token/',
        data: authTokenRequest.toJson(),
      );

      logger.i(authTokenResponse.data);
      final accessToken = authTokenResponse.data?['access'] as String;
      final refreshToken = authTokenResponse.data?['refresh'] as String;

      return (accessToken, refreshToken);
    } on DioException catch (e) {
      logger.e('auth token query failed: ${e.response?.data}');
      throw NetworkException(message: 'Не удалось войти в аккаунт');
    }
  }

  Future<void> _saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _secureStorage.write(key: _accessKey, value: accessToken);
    await _secureStorage.write(key: _refreshKey, value: refreshToken);

    logger.d('Tokens saved');
  }

  void _addAuthInterceptors({
    required String accessToken,
    required String refreshToken,
  }) {
    final authInterceptor = AuthInterceptor(
      accessToken: accessToken,
    );

    final refreshInterceptor = RefreshTokenInterceptor(
      refreshToken: refreshToken,
      onRefresh: () => _onRefresh(refreshToken),
      onRetry: _dioClient.retry,
    );

    _removeAuthInterceptors();

    _dioClient.addInterceptors([
      authInterceptor,
      refreshInterceptor,
    ]);
  }

  void _removeAuthInterceptors() {
    _dioClient
      ..removeInterceptor<AuthInterceptor>()
      ..removeInterceptor<RefreshTokenInterceptor>();
  }

  Future<bool> _onRefresh(String refreshToken) async {
    logger.d('Tokens need refresh');

    final (
      newAccessToken,
      newRefreshToken,
    ) = await _refreshToken(
      refreshToken: refreshToken,
    );

    if (newAccessToken != null && newRefreshToken != null) {
      await _saveTokens(
        accessToken: newAccessToken,
        refreshToken: newRefreshToken,
      );
      _addAuthInterceptors(
        accessToken: newAccessToken,
        refreshToken: newRefreshToken,
      );
      logger.d('Tokens refreshed');

      return true;
    } else {
      logger.d('Tokens refresh failed');
      signOut();
    }

    return false;
  }

  @override
  Future<void> signOut() async {
    await _secureStorage.delete(key: _accessKey);
    await _secureStorage.delete(key: _refreshKey);

    _removeAuthInterceptors();

    logger.d('Tokens deleted');
  }
}
