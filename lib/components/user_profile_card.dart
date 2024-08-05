// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_daigaku/auth/auth_service.dart';
import 'package:smart_daigaku/pages/initial_page.dart';

class UserProfileCard extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;
  UserProfileCard({super.key});

  static dynamic _getUserImagePath(User? user) {
    if (user != null && user.photoURL != null) {
      return NetworkImage(user.photoURL!);
    } else {
      return AssetImage("assets/images/profile_picture.png");
    }
  }

  @override
  Widget build(BuildContext context) {
    // print("Username: ${user?.displayName}");
    // print("Email: ${user?.email}");
    // print("photoURL: ${user?.photoURL}");

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(140),
        border:
            Border.all(color: Theme.of(context).colorScheme.primary, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: _getUserImagePath(user),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user?.displayName ?? "Name",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  user?.email ?? "Email",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Container(
            margin: EdgeInsets.only(left: 3),
            child: GestureDetector(
              child: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.inversePrimary,
                size: 30,
              ),
              onTap: () {
                AuthService().logout();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => InitialPage()),
                  (route) => false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
