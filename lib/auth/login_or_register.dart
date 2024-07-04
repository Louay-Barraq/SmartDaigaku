import 'package:flutter/material.dart';

import '../pages/login_page.dart';
import '../pages/signup_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool displayLoginPage = true;

  void togglePages() {
    setState(() {
      displayLoginPage = !displayLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (displayLoginPage) {
      return LoginPage(onTapFunction: togglePages);
    } else {
      return SignUpPage(onTapFunction: togglePages);
    }
  }
}
