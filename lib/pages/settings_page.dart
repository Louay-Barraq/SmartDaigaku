// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:smart_daigoku/components/drawer.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _currentPage = 'Settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('Settings Page'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('Settings Page'),
        ),
      ),
      drawer: AppDrawer(currentPage: _currentPage),
    );
  }
}
