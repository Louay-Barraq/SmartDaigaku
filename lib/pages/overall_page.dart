import 'package:flutter/material.dart';

import '../components/drawer.dart';

class OverallPage extends StatefulWidget {
  const OverallPage({super.key});

  @override
  State<OverallPage> createState() => _OverallPageState();
}

class _OverallPageState extends State<OverallPage> {
  String _currentPage = 'Overall';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('Overall Page'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('Overall Page'),
        ),
      ),
      drawer: AppDrawer(currentPage: _currentPage),
    );
  }
}
