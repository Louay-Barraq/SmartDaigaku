import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Color(0xFF00513E),
    primary: Color(0xFFFFFFFF),
    inversePrimary: Color(0xFF000000),
    secondary: Color(0xFF66D1A9),
    onSecondary: Color(0xFF1A1A1A),
    tertiary: Color(0xFFFFFFFF),
    onTertiary: Color(0xFFC5C5C5),
  ),
  textTheme: ThemeData.dark().textTheme.apply(
        bodyColor: Colors.grey[300],
        displayColor: Colors.white,
      ),
  cardTheme: CardTheme(
    surfaceTintColor: Color(0xFF1A1A1A),
    color: Color(0xFFFFFFFF),
  ),
  useMaterial3: true,
);
