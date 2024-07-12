// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:smart_daigoku/themes/dark_theme.dart';
import 'package:smart_daigoku/themes/light_theme.dart';
import 'package:smart_daigoku/themes/purple_dark_theme.dart';
import 'package:smart_daigoku/themes/purple_light_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightPurpleTheme;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkPurpleTheme;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightPurpleTheme) {
      _themeData = darkPurpleTheme;
    } else {
      _themeData = lightPurpleTheme;
    }
    notifyListeners();
  }
}
