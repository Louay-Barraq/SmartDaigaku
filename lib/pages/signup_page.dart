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
      backgroundColor: Color.fromARGB(255, 30, 210, 140),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  width: 319,
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
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
                  )),
              SizedBox(
                child: GoogleButton(
                  onTap: () {},
                  childText: "Sign up with Google",
                ),
              ),

              SizedBox(
                height: 15,
              ),
              Container(
                width: 350,
                height: 18,
                child: Stack(
                  children: [
                    Positioned(
                      left: 93,
                      top: 0,
                      child: Text(
                        'Or continue with Email',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 9,
                      child: Container(
                        width: 82,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 268,
                      top: 9,
                      child: Container(
                        width: 82,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
      ),
    );
  }
}
