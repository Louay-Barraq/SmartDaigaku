// ignore_for_file: sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:smart_daigoku/components/login_textfield.dart';
import 'package:smart_daigoku/components/google_button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 210, 140),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 0, 25),
                  child: Text(
                    'Login to SmartDaigoku !',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                GoogleButton(
                  onTap: () {},
                  childText: "Login with Google",
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        thickness: 1.5,
                        height: 10,
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                    Text(
                      "Or Login with Email",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        thickness: 1.3,
                        height: 10,
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 8.0),
                  child: Text(
                    "Username or Email",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                LoginTextField(
                    controller: widget.usernameController,
                    hintText: "Enter Name",
                    obscureText: false),
                SizedBox(height: 22),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 30.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Password",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      GestureDetector(
                        child: Text(
                          "Forgot?",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                LoginTextField(
                    controller: widget.passwordController,
                    hintText: "Enter Password",
                    obscureText: true),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black,
                    ),
                    height: 45,
                    width: 170,
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Don't have an account ? ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/signUp'); // Navigate to the LoginPage
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      "assets/images/reflecting.png",
                      width: 300,
                      height: 300,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
