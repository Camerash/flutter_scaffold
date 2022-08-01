import 'package:flutter/material.dart';
import 'package:flutter_scaffold/i18n/translations.g.dart';

const sortedLocale = [
  AppLocale.en,
  AppLocale.zhHk,
  AppLocale.zhCn,
];

class LanguageSwitch extends StatefulWidget {
  const LanguageSwitch({super.key});

  @override
  State<LanguageSwitch> createState() => _LanguageSwitchState();
}

class _LanguageSwitchState extends State<LanguageSwitch> {
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      borderRadius: BorderRadius.circular(40),
      constraints: const BoxConstraints(minHeight: 40, minWidth: 40),
      onPressed: (int index) {
        setState(() {
          LocaleSettings.setLocale(sortedLocale[index]);
        });
      },
      isSelected: sortedLocale
          .map((locale) => LocaleSettings.currentLocale == locale)
          .toList(),
      children:
          sortedLocale.map((locale) => Text(_getLocaleName(locale))).toList(),
    );
  }

  String _getLocaleName(AppLocale locale) {
    switch (locale) {
      case AppLocale.en:
        return 'Eng';
      case AppLocale.zhHk:
        return '繁';
      case AppLocale.zhCn:
        return '简';
    }
  }
}
