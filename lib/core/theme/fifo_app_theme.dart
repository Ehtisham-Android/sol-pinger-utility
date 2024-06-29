import 'package:flutter/material.dart';

class SolPingerAppTheme {
  static final lightTheme = ThemeData(
      useMaterial3: true,
      colorSchemeSeed: const Color.fromRGBO(69, 189, 160, 171),
      brightness: Brightness.light,
      fontFamily: 'Cairo');

  static final darkTheme = ThemeData(
      useMaterial3: true,
      colorSchemeSeed: const Color.fromRGBO(69, 189, 160, 171),
      brightness: Brightness.dark,
      fontFamily: 'Cairo');
}
