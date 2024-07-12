import 'package:flutter/material.dart';

ThemeData darkPurpleTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Color(0xFF4A0072), // Dark purple surface color
    primary: Color(0xFFFFFFFF),
    inversePrimary: Color(0xFF000000),
    secondary: Color.fromARGB(
        255, 202, 181, 255), // Soft pastel purple secondary color
    onSecondary: Color.fromARGB(255, 202, 202, 202),
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
