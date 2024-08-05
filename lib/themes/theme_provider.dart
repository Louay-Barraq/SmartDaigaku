// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:smart_daigaku/themes/dark_theme.dart';
import 'package:smart_daigaku/themes/light_theme.dart';
import 'package:smart_daigaku/themes/purple_dark_theme.dart';
import 'package:smart_daigaku/themes/purple_light_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightTheme;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkTheme;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightTheme) {
      _themeData = darkTheme;
    } else {
      _themeData = lightTheme;
    }
    notifyListeners();
  }
}
