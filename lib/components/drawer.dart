// ignore_for_file: avoid_unnecessary_containers, library_private_types_in_public_api, unused_field, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_daigoku/components/drawer_element.dart';
import 'package:smart_daigoku/components/theme_toggle.dart';
import 'package:smart_daigoku/components/user_profile_card.dart';
import 'package:smart_daigoku/pages/home_page.dart';
import '../pages/cafeteria_page.dart';
import '../pages/classroom_page.dart';
import '../pages/overall_page.dart';
import '../pages/settings_page.dart';

class AppDrawer extends StatefulWidget {
  final String currentPage;
  const AppDrawer({required this.currentPage, super.key});

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  late String _selectedElement;

  @override
  void initState() {
    super.initState();
    _selectedElement = widget.currentPage;
  }

  final user = FirebaseAuth.instance.currentUser;

  void _navigateTo(String element, Widget page) {
    setState(() {
      _selectedElement = element;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 30)),
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
          SizedBox(height: 20),
          DrawerElement(
            elementTitle: "Home",
            icon: Icons.home,
            isSelected: _selectedElement == 'Home',
            onTap: () => _navigateTo('Home',
                HomePage()), // Replace ClassroomPage with the actual page
          ),
          SizedBox(height: 10),
          DrawerElement(
            elementTitle: "Classroom",
            icon: Icons.people,
            isSelected: _selectedElement == 'Classroom',
            onTap: () => _navigateTo('Classroom',
                ClassroomPage()), // Replace ClassroomPage with the actual page
          ),
          SizedBox(height: 10),
          DrawerElement(
            elementTitle: "Cafeteria",
            icon: Icons.local_cafe,
            isSelected: _selectedElement == 'Cafeteria',
            onTap: () => _navigateTo('Cafeteria', CafeteriaPage()),
          ),
          SizedBox(height: 10),
          DrawerElement(
            elementTitle: "Overall",
            icon: Icons.notifications,
            isSelected: _selectedElement == 'Overall',
            onTap: () => _navigateTo('Overall',
                OverallPage()), // Replace OverallPage with the actual page
          ),
          SizedBox(height: 10),
          DrawerElement(
            elementTitle: "Settings",
            icon: Icons.settings,
            isSelected: _selectedElement == 'Settings',
            onTap: () => _navigateTo('Settings',
                SettingsPage()), // Replace SettingsPage with the actual page
          ),
          Spacer(),
          ThemeToggle(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: UserProfileCard(),
          ),
        ],
      ),
    );
  }
}
