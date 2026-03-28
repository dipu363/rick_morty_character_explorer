import 'package:dio/dio.dart';

class DioClient {
  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://rickandmortyapi.com/api/',
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
      ),
    );

    /// Logging (very useful during development)
    dio.interceptors.add(LogInterceptor(request: true, responseBody: true));

    return dio;
  }
}
