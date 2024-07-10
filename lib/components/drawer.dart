// ignore_for_file: avoid_unnecessary_containers, library_private_types_in_public_api, unused_field, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:smart_daigoku/components/drawer_element.dart';
import 'package:smart_daigoku/components/theme_toggle.dart';
import 'package:smart_daigoku/components/user_profile_card.dart';
import 'package:smart_daigoku/pages/cafeteria_page.dart';
import 'package:smart_daigoku/pages/classroom_page.dart';
import 'package:smart_daigoku/pages/overall_page.dart';
import 'package:smart_daigoku/pages/settings_page.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String _selectedElement = '';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
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
                color: Theme.of(context).colorScheme.tertiary,
                size: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Smart',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 28,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Daigoku',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
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
            isSelected: _selectedElement == 'Classroom',
            onTap: () {
              setState(() {
                _selectedElement = 'Classroom';
              });
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ClassroomPage()));
            },
          ),
          SizedBox(height: 20),
          DrawerElement(
            elementTitle: "Cafeteria",
            icon: Icons.local_cafe,
            isSelected: _selectedElement == 'Cafeteria',
            onTap: () {
              setState(() {
                _selectedElement = 'Cafeteria';
              });
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CafeteriaPage()));
            },
          ),
          SizedBox(height: 20),
          DrawerElement(
            elementTitle: "Overall",
            icon: Icons.notifications,
            isSelected: _selectedElement == 'Overall',
            onTap: () {
              setState(() {
                _selectedElement = 'Overall';
              });
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OverallPage()));
            },
          ),
          SizedBox(height: 20),
          DrawerElement(
            elementTitle: "Settings",
            icon: Icons.settings,
            isSelected: _selectedElement == 'Settings',
            onTap: () {
              setState(() {
                _selectedElement = 'Overall';
              });
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
          Spacer(),
          ThemeToggle(
            onThemeChanged: (bool) {},
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 20,
            ),
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: UserProfileCard(
              name: 'Jhon Doe',
              email: 'jhondoe100@gmail.com',
              profileImageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaMrKpFCdbgQ3D1Nm9HMnJDdESq8GxBXIUmw&s',
            ),
          ),
        ],
      ),
    );
  }
}
