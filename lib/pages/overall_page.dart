// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import '../components/notification_widget.dart';
import '../components/drawer.dart';

class OverallPage extends StatefulWidget {
  const OverallPage({super.key});

  @override
  State<OverallPage> createState() => _OverallPageState();
}

class _OverallPageState extends State<OverallPage> {
  String _currentPage = 'Overall';
  List<NotificationItem> _notifications = [
    NotificationItem(
      text: 'The situation has returned to normal in Building C now.',
      type: 'information',
      time: '45 min ago',
    ),
    NotificationItem(
      text:
          'Unusual motion detected with elevated noise levels in Building C. Please verify the situation.',
      type: 'warning',
      time: '1h ago',
    ),
    NotificationItem(
      text:
          'The temperature in Building B has dropped below safe levels. Please dress warmly.',
      type: 'alert',
      time: '1h ago',
    ),
    NotificationItem(
      text:
          'Unusual motion detected in the computer lab around 03:00 PM. Security has been notified.',
      type: 'warning',
      time: '2h ago',
    ),
    NotificationItem(
      text:
          'The temperature in the chemistry lab has exceeded 30°C. Please ensure all experiments are secured.',
      type: 'alert',
      time: '3h ago',
    ),
  ];

  void _dismissNotification(int index, NotificationItem notification) {
    setState(() {
      _notifications.removeAt(index);
    });

    final snackBar = SnackBar(
      content: Text('Notification dismissed'),
      duration: Duration(seconds: 2),
      action: SnackBarAction(
        label: 'UNDO',
        textColor: Theme.of(context).cardTheme.surfaceTintColor,
        onPressed: () {
          setState(() {
            _notifications.insert(index, notification);
          });
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('Overall Page'),
      ),
      drawer: AppDrawer(currentPage: _currentPage),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: _notifications.length,
          itemBuilder: (context, index) {
            final notification = _notifications[index];
            return NotificationWidget(
              text: notification.text,
              type: notification.type,
              time: notification.time,
              onDelete: () {
                _dismissNotification(index, notification);
              },
            );
          },
        ),
      ),
    );
  }
}

class NotificationItem {
  final String text;
  final String type;
  final String time;

  NotificationItem({
    required this.text,
    required this.type,
    required this.time,
  });
}
