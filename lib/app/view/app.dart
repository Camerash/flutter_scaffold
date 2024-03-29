import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_scaffold/core/di/di.dart';
import 'package:flutter_scaffold/core/navigation/app_router.gr.dart';
import 'package:flutter_scaffold/features/auth/auth.dart';
import 'package:flutter_scaffold/i18n/translations.g.dart';
import 'package:flutter_scaffold/theme.dart';
import 'package:loader_overlay/loader_overlay.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();
    final authCubit = getIt<AuthCubit>();
    return BlocListener<AuthCubit, AuthState>(
      bloc: authCubit,
      listener: (context, state) {
        // Push home route when user is authenticated
        if (state is AuthStateAuthenticated) {
          getIt<AppRouter>().replaceAll([const HomeRoute()]);
        } else if (state is AuthStateUnauthenticated) {
          getIt<AppRouter>().replaceAll([const LoginRoute()]);
        }
      },
      child: GlobalLoaderOverlay(
        child: MaterialApp.router(
          theme: themeData,
          routerDelegate: AutoRouterDelegate(
            router,
            initialRoutes: [
              if (authCubit.state is AuthStateUnauthenticated)
                const LoginRoute(),
              if (authCubit.state is AuthStateAuthenticated) const HomeRoute(),
            ],
          ),
          routeInformationParser: router.defaultRouteParser(),
          locale: TranslationProvider.of(context).flutterLocale,
          supportedLocales: LocaleSettings.supportedLocales,
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
        ),
      ),
    );
  }
}
