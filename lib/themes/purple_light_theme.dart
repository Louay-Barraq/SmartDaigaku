import 'package:flutter/material.dart';

ThemeData lightPurpleTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Color(0xFFCDB2FF),
    primary: Color(0xFFFFFFFF),
    inversePrimary: Color(0xFF000000),
    secondary: Color(0xFF897BBa),
    onSecondary: Color(0xFF1A1A1A),
    tertiary: Color(0xFF000000),
    onTertiary: Colors.black,
  ),
  textTheme: ThemeData.light().textTheme.apply(
        bodyColor: Colors.grey[800],
        displayColor: Colors.black,
      ),
  cardTheme: CardTheme(
    surfaceTintColor: Colors.white,
    color: Color(0x7F000000),
  ),
  useMaterial3: true,
);
