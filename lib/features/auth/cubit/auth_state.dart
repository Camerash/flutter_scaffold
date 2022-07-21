import 'package:flutter_scaffold/core/boilerplate/bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.unauthenticated() = AuthStateUnauthenticated;
  @Implements<LoadingState>()
  const factory AuthState.loading() = AuthStateLoading;
  const factory AuthState.authenticated() = AuthStateAuthenticated;
  @Implements<ErrorState>()
  const factory AuthState.error({
    String? error,
  }) = AuthStateError;
}
