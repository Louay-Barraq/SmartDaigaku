import 'package:flutter/material.dart';

import '../components/drawer.dart';

class AvailabilityPage extends StatefulWidget {
  const AvailabilityPage({super.key});

  @override
  State<AvailabilityPage> createState() => _AvailabilityPageState();
}

class _AvailabilityPageState extends State<AvailabilityPage> {
  final String _currentPage = 'Availability';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('Availability Page'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('Availability Page'),
        ),
      ),
      drawer: AppDrawer(currentPage: _currentPage),
    );
  }
}
