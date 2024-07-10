// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfileCard extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
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
          color: Colors.white, // Background color
          borderRadius: BorderRadius.circular(140),
          border: Border.all(
              color: Theme.of(context).colorScheme.secondary, width: 1)),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(user!.photoURL!),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user!.displayName!,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w600,
                    fontSize: 17),
              ),
              Text(
                user!.email!,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
            child: Icon(
              Icons.logout, // Replace with gear icon or any other relevant icon
              color: Theme.of(context).colorScheme.secondary,
              size: 30,
            ),
            onTap: () {},
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
