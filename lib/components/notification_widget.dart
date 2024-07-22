// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  final String text;
  final String type;
  final String time;
  final Function() onDelete;

  NotificationWidget({
    required this.text,
    required this.type,
    required this.time,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    Color iconColor;
    Color textColor;

    switch (type) {
      case 'information':
        iconData = Icons.info;
        iconColor = Colors.blue;
        textColor = Colors.blue;
        break;
      case 'warning':
        iconData = Icons.warning;
        iconColor = Colors.red;
        textColor = Colors.red;
        break;
      case 'alert':
        iconData = Icons.error;
        iconColor = Colors.orange;
        textColor = Colors.orange;
        break;
      default:
        iconData = Icons.info;
        iconColor = Colors.blue;
        textColor = Colors.blue;
        break;
    }

    return Dismissible(
      key: Key(text),
      direction: DismissDirection.horizontal,
      onDismissed: (direction) {
        onDelete();
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(iconData, color: iconColor, size: 24.0),
                SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    type.toUpperCase(),
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(time, style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              text,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
