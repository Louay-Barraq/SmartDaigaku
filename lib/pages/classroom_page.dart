import 'package:flutter/material.dart';

import '../components/drawer.dart';

class ClassroomPage extends StatefulWidget {
  const ClassroomPage({super.key});

  @override
  State<ClassroomPage> createState() => _ClassroomPageState();
}

class _ClassroomPageState extends State<ClassroomPage> {
  String _currentPage = 'Classroom';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('Classroom Page'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('Classroom Page'),
        ),
      ),
      drawer: AppDrawer(currentPage: _currentPage),
    );
  }
}
