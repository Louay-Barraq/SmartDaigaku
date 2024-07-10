import 'package:flutter/material.dart';

class OverallPage extends StatefulWidget {
  const OverallPage({super.key});

  @override
  State<OverallPage> createState() => _OverallPageState();
}

class _OverallPageState extends State<OverallPage> {
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
    );
  }
}
