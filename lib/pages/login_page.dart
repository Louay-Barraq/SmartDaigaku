// ignore_for_file: sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:smart_daigaku/auth/auth_service.dart';
import 'package:smart_daigaku/components/login_textfield.dart';
import 'package:smart_daigaku/components/google_button.dart';
import 'package:smart_daigaku/pages/signup_page.dart';
import 'home_page.dart';
import 'initial_page.dart';

class LoginPage extends StatefulWidget {
  final String userType;
  const LoginPage({super.key, required this.userType});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TextField Controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  void dismissLoadingDialog() {
    Navigator.of(context).pop();
  }

  void signInWithGoogle() async {
    showLoadingDialog();
    var userCredential =
        await AuthService().signInWithGoogle(selectedType: widget.userType);
    dismissLoadingDialog();

    if (userCredential != null) {
      await Future.delayed(Duration(milliseconds: 250));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
  }

  void signInWithEmailAndPwd() async {
    showLoadingDialog();
    var userCredential = await AuthService().loginWithEmail(
        email: _emailController.text,
        password: _passwordController.text,
        selectedType: widget.userType);
    dismissLoadingDialog();
    if (userCredential != null) {
      await Future.delayed(Duration(milliseconds: 250));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InitialPage(),
            ),
          );
        },
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Icon(Icons.arrow_back,
            color: Theme.of(context).colorScheme.inversePrimary),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
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
                    'Login to SmartDaigaku !',
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
                  onTap: () {
                    signInWithGoogle();
                  },
                  childText: "Continue with Google",
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Theme.of(context).colorScheme.tertiary,
                        thickness: 1.5,
                        height: 10,
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                    Text(
                      "Or Login with Email",
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Theme.of(context).colorScheme.tertiary,
                        thickness: 1.5,
                        height: 10,
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 8.0),
                  child: Text(
                    "Email",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 17,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                LoginTextField(
                    controller: _emailController,
                    hintText: "Enter Email",
                    obscureText: false),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 30.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Password",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
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
                            color: Theme.of(context).colorScheme.tertiary,
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
                    controller: _passwordController,
                    hintText: "Enter Password",
                    obscureText: true),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: GestureDetector(
                    onTap: () {
                      signInWithEmailAndPwd();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      height: 45,
                      width: 170,
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SignUpPage(userType: widget.userType),
                            ),
                          ); // Navigate to the LoginPage
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onTertiary,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    "assets/images/reflecting.png",
                    width: 300,
                    height: 300,
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
