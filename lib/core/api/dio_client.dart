import 'package:dio/dio.dart';
import 'package:flutter_scaffold/core/token/token.dart';

Dio createDioClient({
  required TokenService tokenService,
}) {
  final dio = Dio(
    BaseOptions(
      contentType: "application/json",
    ),
  );
  dio.interceptors.add(
    LogInterceptor(
      requestBody: true,
      responseBody: true,
    ),
  );
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (
        RequestOptions options,
        RequestInterceptorHandler? handler,
      ) async {
        // Inject bearer token
        final token = await tokenService.getToken();
        if (token != null) {
          options.headers["Authorization"] = "Bearer $token";
        }
        handler?.next(options);
      },
    ),
  );
  return dio;
}
