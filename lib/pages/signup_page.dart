// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:smart_daigoku/components/SignupTextfield.dart';
import 'package:smart_daigoku/components/google_button.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(215, 124, 251, 202),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
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
                SizedBox(
                  height: 25,
                ),

                // or continue with Email
                Row(children: [
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
                    "Or continue With Email",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
                ]),
                SizedBox(
                  height: 10,
                ),
                //name Textfield
                Signuptextfield(
                    controller: widget.nameController,
                    hintText: "Enter Name",
                    obscureText: false),
                SizedBox(
                  height: 10,
                ),
                //username Textfield
                Signuptextfield(
                    controller: widget.usernameController,
                    hintText: "Enter Username",
                    obscureText: false),
                SizedBox(
                  height: 10,
                ),
                //email Textfield
                Signuptextfield(
                    controller: widget.emailController,
                    hintText: "Enter Email",
                    obscureText: false),
                SizedBox(
                  height: 10,
                ),
                //password Textfield
                Signuptextfield(
                    controller: widget.passwordController,
                    hintText: "Enter Paswword",
                    obscureText: true),
                SizedBox(
                  height: 10,
                ),
                //confirmpassword Textfield
                Signuptextfield(
                    controller: widget.confirmPasswordController,
                    hintText: "confirm Password",
                    obscureText: false),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /*
                  Checkbox(
                    value: agreedToTerms,
                    onChanged: onChanged,
                  ),
                  */
                    Text(
                      'I agree to the Terms of Service and Privacy Policy',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black,
                  ),
                  height: 56,
                  width: 180,
                  child: Center(
                    child: Text(
                      "Creat Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account ? ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
