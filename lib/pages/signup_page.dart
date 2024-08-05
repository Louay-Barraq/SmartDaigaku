// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_daigaku/auth/auth_service.dart';
import 'package:smart_daigaku/components/google_button.dart';
import 'package:smart_daigaku/components/signup_textfield.dart';
import 'package:smart_daigaku/pages/initial_page.dart';
import 'package:smart_daigaku/pages/login_page.dart';
import 'package:smart_daigaku/pages/home_page.dart';

class SignUpPage extends StatefulWidget {
  final String userType;
  const SignUpPage({super.key, required this.userType});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void registerWithGoogle() async {
    var userCredential =
        await AuthService().signInWithGoogle(selectedType: widget.userType);
    if (userCredential != null) {
      await Future.delayed(Duration(seconds: 1));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
  }

  void signUpWithEmailAndPwd() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      Fluttertoast.showToast(
        msg: 'Passwords do not match',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 15.0,
      );
      return;
    }

    if (_usernameController.text.length < 3) {
      Fluttertoast.showToast(
        msg: 'Username must be longer than or equal to 3 characters',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 15.0,
      );
      return;
    }

    try {
      var userCredential = await AuthService().signUpWithEmailAndPwd(
        email: _emailController.text,
        password: _passwordController.text,
        name: _usernameController.text,
        userType: widget.userType,
      );
      if (userCredential != null) {
        await Future.delayed(Duration(seconds: 1));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      }
    } catch (e) {
      print('Error during email sign-up: $e');
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
          child: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 20, 20, 25),
                  child: Text(
                    'Sign up to SmartDaigaku !',
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
                  onTap: registerWithGoogle,
                  childText: "Continue with Google",
                ),
                SizedBox(height: 25),
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
                      "Or Sign up with Email",
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
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 8.0),
                  child: Text(
                    "Username",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 17,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                SignUpTextField(
                  controller: _usernameController,
                  hintText: "Enter your username",
                  obscureText: false,
                ),
                SizedBox(height: 18),
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
                SignUpTextField(
                  controller: _emailController,
                  hintText: "Enter your email",
                  obscureText: false,
                ),
                SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 8.0),
                  child: Text(
                    "Password",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 17,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                SignUpTextField(
                  controller: _passwordController,
                  hintText: "Enter your password",
                  obscureText: true,
                ),
                SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 8.0),
                  child: Text(
                    "Password Confirmation",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 17,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                SignUpTextField(
                  controller: _confirmPasswordController,
                  hintText: "Confirm your password",
                  obscureText: true,
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: signUpWithEmailAndPwd,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            height: 45,
                            width: 180,
                            child: Center(
                              child: Text(
                                "Create Account",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            "Already have an account?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    LoginPage(userType: widget.userType),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 68),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onTertiary,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        "assets/images/late_for_class.png",
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
