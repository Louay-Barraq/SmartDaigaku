// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_daigaku/components/choice_box.dart';
import 'package:smart_daigaku/pages/login_page.dart';
import 'package:smart_daigaku/pages/signup_page.dart';

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
      warningMessage = "Please select one of the 3 choices.";
      Fluttertoast.showToast(
        msg: warningMessage,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0,
      );
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

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
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
                      "Welcome To\nSmartDaigaku",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Improving Your Experience Is Our\nResponsibility",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onTertiary,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    /*Text(
                        warningMessage,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),*/
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
                                builder: (context) =>
                                    SignUpPage(userType: userType),
                              ),
                            );
                          } else {
                            displayWarning();
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          height: 52,
                          width: 260,
                          child: Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .cardTheme
                                    .surfaceTintColor,
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
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (userType.isNotEmpty) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          LoginPage(userType: userType),
                                    ),
                                  );
                                } else {
                                  displayWarning();
                                }
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onTertiary,
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
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    "assets/images/new_beginnings.png",
                    width: screenWidth,
                    height: 375,
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
