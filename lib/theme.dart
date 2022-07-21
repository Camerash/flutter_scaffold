import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _primaryColor = Color(0xFF000000);

final themeData = ThemeData(
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: TextStyle(
      fontSize: 16,
      color: Colors.black,
    ),
    centerTitle: true,
  ),
  scaffoldBackgroundColor: Colors.white,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    background: Colors.white,
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
    primary: _primaryColor,
    onPrimary: Colors.white,
    secondary: _primaryColor,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
  ),
  iconTheme: const IconThemeData(
    size: 24,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(3),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey;
        }
        return _primaryColor;
      }),
    ),
  ),
  snackBarTheme: const SnackBarThemeData(
    actionTextColor: Colors.white,
  ),
);
