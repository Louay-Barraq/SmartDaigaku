import 'package:flutter/material.dart';
import 'package:smart_daigoku/components/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _currentPage = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text('H O M E', style: TextStyle(fontWeight: FontWeight.normal)),
        centerTitle: true,
      ),
      drawer: AppDrawer(currentPage: _currentPage),
    );
  }
}
