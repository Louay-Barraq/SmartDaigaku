// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:smart_daigoku/components/signup_textfield.dart';
import 'package:smart_daigoku/components/google_button.dart';
import 'package:smart_daigoku/pages/login_page.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key, required void Function() onTapFunction});
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 210, 140),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 0, 25),
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
                  onTap: () {},
                  childText: "Sign up with Google",
                ),
                SizedBox(height: 25),

                // Or continue with Email
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
                      "Or Sign up with Email",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
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
                  controller: widget.nameController,
                  hintText: "Enter your name",
                  obscureText: false,
                ),
                SizedBox(height: 10),
                SignUpTextField(
                  controller: widget.usernameController,
                  hintText: "Enter your username",
                  obscureText: false,
                ),
                SizedBox(height: 10),
                SignUpTextField(
                  controller: widget.emailController,
                  hintText: "Enter your email",
                  obscureText: false,
                ),
                SizedBox(height: 10),
                SignUpTextField(
                  controller: widget.passwordController,
                  hintText: "Enter your password",
                  obscureText: true,
                ),
                SizedBox(height: 10),
                SignUpTextField(
                  controller: widget.confirmPasswordController,
                  hintText: "Confirm your password",
                  obscureText: false,
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align content at the top
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.black,
                          ),
                          height: 45,
                          width: 180,
                          child: Center(
                            child: Text(
                              "Create Account",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
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
                            ); // Navigate to the LoginPage
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 68),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ), // Add spacing between the column and the image

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
