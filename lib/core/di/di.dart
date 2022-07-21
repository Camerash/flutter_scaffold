import 'package:dio/dio.dart';
import 'package:flutter_scaffold/core/api/dio_client.dart';
import 'package:flutter_scaffold/core/api/rest_client.dart';
import 'package:flutter_scaffold/core/navigation/app_router.gr.dart';
import 'package:flutter_scaffold/core/token/token.dart';
import 'package:flutter_scaffold/features/auth/auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

// Dependency Injection
Future<void> initDi() async {
  // Nav
  getIt.registerSingleton<AppRouter>(
    AppRouter(),
  );

  // Token Service
  getIt.registerSingleton<FlutterSecureStorage>(
    const FlutterSecureStorage(),
  );
  getIt.registerSingleton<TokenService>(
    TokenService(
      storage: getIt<FlutterSecureStorage>(),
    ),
  );

  // Http and API client
  getIt.registerSingleton<Dio>(
    createDioClient(
      tokenService: getIt(),
    ),
  );
  // TODO: Update Base URL
  getIt.registerSingleton<RestClient>(
    RestClient(
      getIt(),
      baseUrl: "https://api.example.com",
    ),
  );

  final authCubit = AuthCubit(restClient: getIt(), tokenService: getIt());
  await authCubit.checkInitialAuthState();
  getIt.registerSingleton<AuthCubit>(authCubit);

  // TODO: Add or remove dependencies
}
