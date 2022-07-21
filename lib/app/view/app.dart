import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_scaffold/core/di/di.dart';
import 'package:flutter_scaffold/core/navigation/app_router.gr.dart';
import 'package:flutter_scaffold/features/auth/auth.dart';
import 'package:flutter_scaffold/i18n/translations.g.dart';
import 'package:flutter_scaffold/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final _router = getIt<AppRouter>();
    return BlocListener<AuthCubit, AuthState>(
      bloc: getIt<AuthCubit>(),
      listener: (context, state) {
        // Push home route when user is authenticated
        if (state is AuthStateAuthenticated) {
          // FIXME:
        } else if (state is AuthStateUnauthenticated) {
          getIt<AppRouter>().replaceAll([const LoginRoute()]);
        }
      },
      child: MaterialApp.router(
        theme: themeData,
        routerDelegate: AutoRouterDelegate(
          _router,
          initialRoutes: [
            // FIXME:
          ],
        ),
        routeInformationParser: _router.defaultRouteParser(),
        locale: TranslationProvider.of(context).flutterLocale,
        supportedLocales: LocaleSettings.supportedLocales,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
      ),
    );
  }
}
