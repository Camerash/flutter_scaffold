import 'package:flutter/material.dart';
import 'package:flutter_scaffold/core/di/di.dart';
import 'package:flutter_scaffold/features/auth/auth.dart';
import 'package:flutter_scaffold/i18n/translations.g.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => getIt<AuthCubit>().logout(),
          child: Text(
            t.account.logout,
          ),
        ),
      ),
    );
  }
}
