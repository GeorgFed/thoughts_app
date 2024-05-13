import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class DioClient {
  Dio get core;

  void init();

  void updateHeaders(Map<String, dynamic> newHeaders);

  void removeHeader(String key);

  void addInterceptors(List<Interceptor> interceptors);

  void removeInterceptor<T extends Interceptor>();

  Future<Response> retry(RequestOptions requestOptions, {int retryCount = 3});
}

class DioClientImpl implements DioClient {
  final Dio dio;
  final String baseUrl;
  final Map<String, dynamic> defaultHeaders;

  DioClientImpl({
    required this.dio,
    this.baseUrl = 'http://localhost:8000/api',
    this.defaultHeaders = const {
      'Content-Type': 'application/json',
      'Accept-Language': 'ru',
    },
  });

  @override
  Dio get core => dio;

  @override
  void init() {
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      headers: defaultHeaders,
    );

    // Only add LogInterceptor in debug mode
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
        ),
      );
    }
  }

  @override
  void updateHeaders(Map<String, dynamic> newHeaders) {
    dio.options.headers.addAll(newHeaders);
  }

  @override
  void removeHeader(String key) {
    dio.options.headers.remove(key);
  }

  @override
  void addInterceptors(List<Interceptor> interceptors) {
    dio.interceptors.addAll(interceptors);
  }

  @override
  void removeInterceptor<T extends Interceptor>() {
    dio.interceptors.removeWhere((interceptor) => interceptor is T);
  }

  @override
  Future<Response> retry(
    RequestOptions requestOptions, {
    int retryCount = 3,
  }) async {
    Response? response;
    try {
      response = await dio.request(
        requestOptions.path,
        data: requestOptions.data,
        options: Options(
          method: requestOptions.method,
          headers: requestOptions.headers,
          contentType: requestOptions.contentType,
        ),
      );
    } on DioException catch (e) {
      if (retryCount > 0 && _shouldRetry(e)) {
        retryCount -= 1;
        await Future.delayed(const Duration(seconds: 1));
        return retry(requestOptions, retryCount: retryCount);
      }
      rethrow;
    }

    return response;
  }

  bool _shouldRetry(DioException e) =>
      e.response?.statusCode == 401 || (e.response?.statusCode ?? 500) >= 500;
}
