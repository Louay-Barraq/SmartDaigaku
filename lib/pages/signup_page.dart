// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:smart_daigoku/Components/my_textfield.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 210, 140),
      body: SafeArea(
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
              width: 319,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: Text(
                        "Sign up with Google",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 10),
                      ),
                    ),
                  ),
                ),
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
            Mytextfeild(
                controller: widget.nameController,
                hintText: "Enter Name",
                obscureText: false),
            SizedBox(
              height: 10,
            ),
            //username Textfield
            Mytextfeild(
                controller: widget.usernameController,
                hintText: "Enter Username",
                obscureText: false),
            SizedBox(
              height: 10,
            ),
            //email Textfield
            Mytextfeild(
                controller: widget.emailController,
                hintText: "Enter Email",
                obscureText: false),
            SizedBox(
              height: 10,
            ),
            //password Textfield
            Mytextfeild(
                controller: widget.passwordController,
                hintText: "Enter Paswword",
                obscureText: true),
            SizedBox(
              height: 10,
            ),
            //confirmpassword Textfield
            Mytextfeild(
                controller: widget.confirmpasswordController,
                hintText: "confirm Password",
                obscureText: false),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Checkbox(
                  value: false, // Provide the value of the checkbox
                  onChanged: (newValue) {
                    // Implement onChanged to handle checkbox state
                  },
                  checkColor: Colors.white, // Color of the check icon
                  fillColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.white), // Fill color of the checkbox
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                SizedBox(
                    width:
                        10), // Adjust as needed for spacing between checkbox and text
                Expanded(
                  child: Text(
                    'I agree with the Terms of Service and Privacy policy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
