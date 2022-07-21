import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scaffold/core/api/rest_client.dart';
import 'package:flutter_scaffold/core/token/token.dart';
import 'package:flutter_scaffold/features/auth/auth.dart';

/// Cubit responsible for App-scoped user state change
///
/// Registered as a Singleton in DI
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.restClient,
    required this.tokenService,
  }) : super(const AuthStateLoading());

  final RestClient restClient;
  final TokenService tokenService;

  Future<void> checkInitialAuthState() async {
    final token = await tokenService.getToken();
    emit(
      token == null
          ? const AuthStateUnauthenticated()
          : const AuthStateAuthenticated(),
    );
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      emit(const AuthStateLoading());
      // TODO: Call Login API
      emit(const AuthStateAuthenticated());
    } catch (e) {
      emit(AuthStateError(error: e.toString()));
    }
  }

  Future<void> logout() async {
    emit(const AuthStateLoading());
    await tokenService.deleteToken();
    emit(const AuthStateUnauthenticated());
  }
}
