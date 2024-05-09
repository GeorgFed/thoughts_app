import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final String accessToken;

  const AuthInterceptor({
    required this.accessToken,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer $accessToken';
    super.onRequest(options, handler);
  }
}
