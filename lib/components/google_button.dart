import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  final String childText;
  final Function() onTap;

  const GoogleButton({
    super.key,
    required this.onTap,
    required this.childText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        margin: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/google_icon.png",
                width: 33,
                height: 33,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  childText,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
