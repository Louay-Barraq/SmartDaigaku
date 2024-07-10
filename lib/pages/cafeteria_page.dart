import 'package:flutter/material.dart';

class CafeteriaPage extends StatefulWidget {
  const CafeteriaPage({super.key});

  @override
  State<CafeteriaPage> createState() => _CafeteriaPageState();
}

class _CafeteriaPageState extends State<CafeteriaPage> {
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
    );
  }
}
