// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, duplicate_ignore

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smart_daigoku/pages/initial_page.dart';
import 'package:smart_daigoku/pages/login_page.dart';
import 'package:smart_daigoku/pages/signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InitialPage();
  }
}
