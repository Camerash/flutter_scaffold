import 'package:flutter/material.dart';

extension TextStyleEx on ThemeData {
  TextStyle getPrimaryBodyText() {
    return textTheme.bodyText1!.copyWith(
      color: colorScheme.primary,
    );
  }

  TextStyle getPrimaryBodyBoldText() {
    return getPrimaryBodyText().copyWith(
      fontWeight: FontWeight.bold,
    );
  }
}
