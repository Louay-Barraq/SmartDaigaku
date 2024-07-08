import 'package:flutter/material.dart';
import 'package:smart_daigoku/components/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(121, 201, 158, 1),
        key: _scaffoldKey, // Assign the key to the Scaffold
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(18, 124, 68, 1),
          title: Text('Drawer Example'),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer(); // Open the drawer
            },
          ),
        ),
        drawer: MyDrawer(), // Your custom drawer component
        body: Center(
          child: Text('test'),
        ),
      ),
    );
  }
}
