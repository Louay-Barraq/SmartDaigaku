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
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Row(
            children: [
              Image.asset(
                "assets/images/google.png",
                width: 10,
                height: 10,
              ),
              Text(
                childText,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
