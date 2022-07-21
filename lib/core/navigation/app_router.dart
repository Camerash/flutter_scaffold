import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_scaffold/features/login/login.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page|Screen|Dialog,Route',
  routes: [
    AutoRoute(path: '/login', page: LoginPage, initial: true),
  ],
)
class $AppRouter {}