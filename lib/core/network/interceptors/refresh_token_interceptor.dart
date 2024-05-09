import 'package:dio/dio.dart';

class RefreshTokenInterceptor extends Interceptor {
  final String refreshToken;
  final Future<bool> Function() onRefresh;
  final Future<Response> Function(RequestOptions) onRetry;

  const RefreshTokenInterceptor({
    required this.refreshToken,
    required this.onRefresh,
    required this.onRetry,
  });

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      final refreshSuccess = await onRefresh();

      if (refreshSuccess) {
        final requestOptions = err.requestOptions;
        handler.resolve(await onRetry(requestOptions));
        return;
      }
    }

    super.onError(err, handler);
  }
}
