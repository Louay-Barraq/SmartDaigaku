import 'package:flutter/material.dart';
import 'package:smart_daigaku/components/drawer.dart';

class CafeteriaPage extends StatefulWidget {
  const CafeteriaPage({super.key});

  @override
  State<CafeteriaPage> createState() => _CafeteriaPageState();
}

class _CafeteriaPageState extends State<CafeteriaPage> {
  final String _currentPage = 'Cafeteria';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('Cafeteria Page'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('Cafeteria Page'),
        ),
      ),
      drawer: AppDrawer(currentPage: _currentPage),
    );
  }
}
