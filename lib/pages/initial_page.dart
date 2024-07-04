// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:smart_daigoku/components/choice_box.dart';
import 'package:smart_daigoku/pages/signup_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  String userType = "";
  String warningMessage = "";

  void displayWarning() {
    setState(() {
      warningMessage = "! : Please select one of the 3 choices";
    });
  }

  void removeWarning() {
    setState(() {
      warningMessage = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double imageHeight = 180;
    double imageWidth = 180;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 210, 140),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome To\nSmartDaigoku",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Improving Your Experience Is Our\nResponsibility",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      warningMessage,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
                Center(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            userType = "Student";
                            removeWarning();
                          });
                        },
                        child: ChoiceBox(
                          mainText: "Student",
                          selected: userType == "Student",
                        ),
                      ),
                      SizedBox(height: 25),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            userType = "Professor";
                            removeWarning();
                          });
                        },
                        child: ChoiceBox(
                          mainText: "Professor",
                          selected: userType == "Professor",
                        ),
                      ),
                      SizedBox(height: 25),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            userType = "Academic Staff Member";
                            removeWarning();
                          });
                        },
                        child: ChoiceBox(
                          mainText: "Academic Staff Member",
                          selected: userType == "Academic Staff Member",
                        ),
                      ),
                      SizedBox(height: 35),
                      GestureDetector(
                        onTap: () {
                          if (userType.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpPage(
                                  onTapFunction: () {},
                                ),
                              ),
                            );
                          } else {
                            displayWarning();
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.black,
                          ),
                          height: 52,
                          width: 260,
                          child: Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Row(
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
                            GestureDetector(
                              onTap: () {
                                if (userType.isNotEmpty) {
                                  Navigator.pushNamed(context, '/login');
                                } else {
                                  displayWarning();
                                }
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    "assets/images/new_beginnings.png",
                    width: 180,
                    height: 180,
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
