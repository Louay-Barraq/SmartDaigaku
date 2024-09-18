import 'package:flutter/cupertino.dart';
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
        title: Text('A V A I L A B I L I T Y'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              _availabilityRow(person: "Director", status: "Unavailable"),
              _availabilityRow(person: "CS Resp", status: "Available"),
              _availabilityRow(person: "Dept Director", status: "Available"),
              _availabilityRow(person: "IOT Resp", status: "Unidentified"),
              _availabilityRow(person: "Officer", status: "Unavailable"),
              _availabilityRow(person: "Chancellor", status: "Available"),
              _availabilityRow(person: "Rector", status: "Unidentified"),
            ],
          ),
        ),
      ),
      drawer: AppDrawer(currentPage: _currentPage),
    );
  }

  Container _availabilityRow({required String person, required String status}) {
    return Container(
      height: 70,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 2,
            spreadRadius: 2,
            color: Color(0x3F000000),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: 50,
              width: 150,
              margin: EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 2),
                    blurRadius: 2,
                    spreadRadius: 2,
                    color: Color(0x3F000000),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  person,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 150,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: status == 'Available'
                  ? Color(0xFF008A00)
                  : status == "Unavailable"
                      ? Color(0xFFFF0000)
                      : Color(0xFFFF6B00),
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 2,
                  spreadRadius: 2,
                  color: Color(0x3F000000),
                ),
              ],
            ),
            child: Center(
              child: Text(
                status,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
