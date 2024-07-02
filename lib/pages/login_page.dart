// ignore_for_file: sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:smart_daigoku/components/LoginTextfield.dart';
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
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: SafeArea(
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
                        'Log In to SmartDaigoku !',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    )),
                GoogleButton(
                  onTap: () {},
                  childText: "Log in with Google",
                ),

                SizedBox(
                  height: 15,
                ),
                // or log in with Email
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
                    "Or Log In With Email",
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
                  height: 15,
                ),

                //name Textfield
                Text(
                  "Username or Email",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                Logintextfield(
                    controller: widget.usernameController,
                    hintText: "Enter Name",
                    obscureText: false),
                SizedBox(
                  height: 15,
                ),

                Row(
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
                  ],
                ),
                //password Textfield
                Logintextfield(
                    controller: widget.passwordController,
                    hintText: "Enter Paswword",
                    obscureText: true),
                SizedBox(
                  height: 10,
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
                      "Log In",
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Don't have an account ? ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Sign In",
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
