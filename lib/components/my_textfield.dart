// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  const Mytextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(50)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple),
              borderRadius: BorderRadius.circular(12)),
          hintText: hintText,
          fillColor: Colors.grey[200],
          filled: true,
        ),
      ),
    );
  }
}
