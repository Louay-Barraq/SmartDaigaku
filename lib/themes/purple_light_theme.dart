import 'package:flutter/material.dart';

ThemeData lightPurpleTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Color.fromARGB(255, 186, 162, 230), // Light purple surface color
    primary: Color(0xFFFFFFFF),
    inversePrimary: Color(0xFF000000),
    secondary: Color.fromARGB(255, 135, 94, 205), // Purple secondary color
    onSecondary: Color(0xFF1A1A1A),
    tertiary: Color(0xFF000000),
    onTertiary: Color(0xFFFFFFFF),
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
