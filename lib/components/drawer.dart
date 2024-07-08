// ignore_for_file: avoid_unnecessary_containers, library_private_types_in_public_api, unused_field, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:smart_daigoku/components/drawer_element.dart';
import 'package:smart_daigoku/components/theme_toggle.dart';
import 'package:smart_daigoku/components/user_profile_card.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String _selectedElement = '';
  bool _isDarkTheme = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromRGBO(18, 72, 48, 1),
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                top: 30,
              )),
              Icon(
                Icons.school,
                color: Colors.white,
                size: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Smart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Daigoku',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 40),
          DrawerElement(
            elementTitle: "Classroom",
            icon: Icons.people,
            iconColor: Colors.white,
            isSelected: _selectedElement == 'Classroom',
            onTap: () {
              setState(() {
                _selectedElement = 'Classroom';
              });
            },
          ),
          SizedBox(height: 20),
          DrawerElement(
            elementTitle: "Cafeteria",
            icon: Icons.local_cafe,
            iconColor: Colors.white,
            isSelected: _selectedElement == 'Cafeteria',
            onTap: () {
              setState(() {
                _selectedElement = 'Cafeteria';
              });
            },
          ),
          SizedBox(height: 20),
          DrawerElement(
            elementTitle: "Overall",
            icon: Icons.notifications,
            iconColor: Colors.white,
            isSelected: _selectedElement == 'Overall',
            onTap: () {
              setState(() {
                _selectedElement = 'Overall';
              });
            },
          ),
          Spacer(), // Push UserProfileCard to the bottom edge
          ThemeToggle(
            onThemeChanged: (isDark) {
              setState(() {
                _isDarkTheme = isDark;
              });
            },
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 20,
            ),
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: UserProfileCard(
              name: 'Jhon Doe',
              email: 'jhondoe100@gmail.com',
              profileImageUrl: 'https://example.com/profile.jpg',
            ),
          ),
        ],
      ),
    );
  }
}
