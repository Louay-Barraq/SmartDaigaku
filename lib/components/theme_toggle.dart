// ignore_for_file: prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_daigoku/themes/theme_provider.dart';

class ThemeToggle extends StatefulWidget {
  const ThemeToggle({super.key});

  @override
  _ThemeToggleState createState() => _ThemeToggleState();
}

class _ThemeToggleState extends State<ThemeToggle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(50),
        border:
            Border.all(color: Theme.of(context).colorScheme.primary, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => Provider.of<ThemeProvider>(context, listen: false)
                .toggleTheme(),
            child: Container(
              width: 130,
              height: 45,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Provider.of<ThemeProvider>(context, listen: false)
                        .isDarkMode
                    ? Colors.transparent
                    : Theme.of(context).colorScheme.inversePrimary,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wb_sunny,
                    color: Provider.of<ThemeProvider>(context, listen: false)
                            .isDarkMode
                        ? Theme.of(context).colorScheme.inversePrimary
                        : Theme.of(context).colorScheme.primary,
                    size: 25,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Light",
                    style: TextStyle(
                      color: Provider.of<ThemeProvider>(context, listen: false)
                              .isDarkMode
                          ? Theme.of(context).colorScheme.inversePrimary
                          : Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () => Provider.of<ThemeProvider>(context, listen: false)
                .toggleTheme(),
            child: Container(
              width: 130,
              height: 45,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Provider.of<ThemeProvider>(context, listen: false)
                        .isDarkMode
                    ? Theme.of(context).colorScheme.inversePrimary
                    : Colors.transparent,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.nightlight_round,
                    color: Provider.of<ThemeProvider>(context, listen: false)
                            .isDarkMode
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.inversePrimary,
                    size: 25,
                  ),
                  Text(
                    "Dark",
                    style: TextStyle(
                      color: Provider.of<ThemeProvider>(context, listen: false)
                              .isDarkMode
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
