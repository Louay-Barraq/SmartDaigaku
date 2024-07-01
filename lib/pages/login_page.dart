import 'package:flutter/material.dart';
import 'package:smart_daigoku/components/google_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(121, 201, 158, 1.0),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login To\nSmartDaigoku!",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                    ),
                  ),
                  GoogleButton(
                    onTap: () {},
                    childText: "Google",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
