import 'package:flutter/material.dart';

class ChoiceBox extends StatelessWidget {
  final String mainText;

  const ChoiceBox({super.key, required this.mainText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // Shadow color with opacity
            spreadRadius: 2, // Spread radius
            blurRadius: 7, // Blur radius
            offset: Offset(0, 5), // Offset in x and y direction
          ),
        ],
      ),
      height: 52,
      width: 310,
      child: Center(
        child: Text(
          mainText,
          style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0.5),
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
