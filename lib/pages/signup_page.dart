// ignore_for_file: prefer_const_literals_to_create_immutables, unused_field

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_daigoku/auth/auth_service.dart';
import 'package:smart_daigoku/components/signup_textfield.dart';
import 'package:smart_daigoku/components/google_button.dart';
import 'package:smart_daigoku/pages/home_page.dart';
import 'package:smart_daigoku/pages/login_page.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback onTapFunction;

  SignUpPage({Key? key, required this.onTapFunction}) : super(key: key);

  // SignUpPage({super.key, required void Function() onTapFunction});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // TextField Controllers
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signInWithGoogle() async {
    try {
      var userCredential = await AuthService().signInWithGoogle();
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
      print('Error during Google sign-in: $e');
    }
  }

  void signUpWithEmailAndPwd() async {
    if (passwordController.text != confirmPasswordController.text) {
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

    try {
      var userCredential = await AuthService().signUpWithEmail(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
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
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 20, 20, 25),
                  child: Text(
                    'Sign up to SmartDaigoku !',
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
                  onTap: signInWithGoogle,
                  childText: "Sign up with Google",
                ),
                SizedBox(height: 25),

                // Or continue with Email
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
                SizedBox(height: 30),
                SignUpTextField(
                  controller: nameController,
                  hintText: "Enter your name",
                  obscureText: false,
                ),
                SizedBox(height: 10),
                SignUpTextField(
                  controller: usernameController,
                  hintText: "Enter your username",
                  obscureText: false,
                ),
                SizedBox(height: 10),
                SignUpTextField(
                  controller: emailController,
                  hintText: "Enter your email",
                  obscureText: false,
                ),
                SizedBox(height: 10),
                SignUpTextField(
                  controller: passwordController,
                  hintText: "Enter your password",
                  obscureText: true,
                ),
                SizedBox(height: 10),
                SignUpTextField(
                  controller: confirmPasswordController,
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
                                  color:
                                      Theme.of(context).colorScheme.onTertiary,
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
                                builder: (context) => LoginPage(
                                  onTapFunction: () {},
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 68),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onTertiary,
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
