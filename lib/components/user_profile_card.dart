// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:smart_daigoku/pages/settings_page.dart';

class UserProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final String profileImageUrl; // Replace with actual image URL

  UserProfileCard({
    required this.name,
    required this.email,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
          color: Color(0xFF087E3E), // Background color
          borderRadius: BorderRadius.circular(140),
          border: Border.all(color: Colors.white, width: 1)),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(profileImageUrl),
            // Placeholder image or loading indicator if profileImageUrl is null
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 17),
              ),
              Text(
                email,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
            child: Icon(
              Icons
                  .settings_rounded, // Replace with gear icon or any other relevant icon
              color: Colors.white,
              size: 30,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Example usage:
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('User Profile Example')),
      body: Center(
        child: UserProfileCard(
          name: 'Jhon Doe',
          email: 'jhondoe100@gmail.com',
          profileImageUrl:
              'https://example.com/profile.jpg', // Replace with actual image URL
        ),
      ),
    ),
  ));
}
