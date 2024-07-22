import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Color(0xFF66D1A9),
    primary: Color(0xFFFFFFFF),
    inversePrimary: Color(0xFF000000),
    secondary: Color(0xFF3E9DAD),
    onSecondary: Color(0xFF1A1A1A),
    tertiary: Color(0xFF000000),
    onTertiary: Color(0xFF000000),
  ),
  textTheme: ThemeData.light().textTheme.apply(
        bodyColor: Colors.grey[800],
        displayColor: Colors.black,
      ),
  cardTheme: CardTheme(
    surfaceTintColor: Color(0xFFFFFFFF),
    color: Color(0x7F000000),
  ),
  useMaterial3: true,
);
