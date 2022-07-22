import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _primaryColor = Colors.black;
const _onPrimaryColor = Colors.white;

final themeData = ThemeData(
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    backgroundColor: _primaryColor,
    elevation: 0,
    iconTheme: IconThemeData(
      color: _onPrimaryColor,
    ),
    titleTextStyle: TextStyle(
      fontSize: 16,
      color: _onPrimaryColor,
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
    onPrimary: _onPrimaryColor,
    secondary: _primaryColor,
    onSecondary: _onPrimaryColor,
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
