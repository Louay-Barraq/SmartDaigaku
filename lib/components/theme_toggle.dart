// ignore_for_file: prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';

class ThemeToggle extends StatefulWidget {
  final Function(bool) onThemeChanged;

  const ThemeToggle({super.key, required this.onThemeChanged});

  @override
  _ThemeToggleState createState() => _ThemeToggleState();
}

class _ThemeToggleState extends State<ThemeToggle> {
  bool _isDarkTheme = false;

  void _toggleTheme(bool isDark) {
    setState(() {
      _isDarkTheme = isDark;
      widget.onThemeChanged(_isDarkTheme);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Color(0xFF087E3E), // Background color
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.white, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => _toggleTheme(false),
            child: Container(
              width: 130,
              height: 45,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: !_isDarkTheme
                    ? Color.fromARGB(255, 2, 22, 68)
                    : Color(0xFF087E3E),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wb_sunny,
                    color: Colors.white,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Light",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: 10), // Add spacing between buttons
          GestureDetector(
            onTap: () => _toggleTheme(true),
            child: Container(
              width: 130,
              height: 45,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: _isDarkTheme
                    ? Color.fromARGB(255, 2, 22, 68)
                    : Color(0xFF087E3E),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.nightlight_round,
                    color: Colors.white,
                    size: 25,
                  ),
                  Text(
                    "Dark",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
