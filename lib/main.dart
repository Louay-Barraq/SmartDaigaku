// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, duplicate_ignore, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_daigoku/auth/auth_page.dart';
import 'package:smart_daigoku/pages/home_page.dart';
import 'package:smart_daigoku/pages/initial_page.dart';
import 'package:smart_daigoku/pages/login_page.dart';
import 'package:smart_daigoku/pages/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_daigoku/themes/dark_theme.dart';
import 'package:smart_daigoku/themes/light_theme.dart';
import 'package:smart_daigoku/themes/purple_dark_theme.dart';
import 'package:smart_daigoku/themes/purple_light_theme.dart';
import 'package:smart_daigoku/themes/theme_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
