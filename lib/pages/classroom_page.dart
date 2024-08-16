import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../components/drawer.dart';

class ClassroomPage extends StatefulWidget {
  const ClassroomPage({super.key});

  @override
  State<ClassroomPage> createState() => _ClassroomPageState();
}

class _ClassroomPageState extends State<ClassroomPage> {
  final String _currentPage = 'Classroom';

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double appBarHeight = AppBar().preferredSize.height;
    final double containerHeight = (screenHeight - appBarHeight - 120) / 2;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text(
          'C L A S S R O O M',
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 40,
                width: screenWidth,
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: screenWidth / 3,
                      color: const Color(0xFF06ED1D),
                      child: const Center(
                        child: Text(
                          'Empty',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: screenWidth / 3,
                      color: Color(0xFFFF6B00),
                      child: const Center(
                        child: Text(
                          'Unidentified',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: screenWidth / 3,
                      color: Color(0xFFED1414),
                      child: const Center(
                        child: Text(
                          'Occupied',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Classroom Layout
              Container(
                width: screenWidth - 30,
                height: containerHeight,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(height: 20),

              // Estimations Section
              Container(
                width: screenWidth - 30,
                height: containerHeight,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 5),
                      child: Text(
                        'Estimations',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 35,
                          color: Color(0xFF606464),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Empty Desks
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  offset: Offset(0, 4),
                                  blurRadius: 8,
                                  blurStyle: BlurStyle.normal),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'Empty Desks',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 45,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFF06ED1D), // Green color
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  offset: Offset(0, 4),
                                  blurRadius: 8,
                                  blurStyle: BlurStyle.normal),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '58',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Occupied Desks
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                offset: Offset(0, 4),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'Occupied Desks',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 45,
                          height: 50,
                          decoration: BoxDecoration(
                            color:
                                Color.fromARGB(255, 237, 44, 6), // Green color
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                offset: Offset(0, 4),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '32',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Unidentified Desks
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                offset: Offset(0, 4),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'Unidentified Desks',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 45,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 102, 1),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                offset: Offset(0, 4),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '12',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Estimated People
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 355,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                offset: Offset(0, 4),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'Estimated People',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFF2D82B7),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                offset: Offset(0, 4),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '32-37',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: AppDrawer(currentPage: _currentPage),
    );
  }
}
