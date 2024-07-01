// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smart_daigoku/pages/signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    );
  }
}
