import 'package:flutter/material.dart';
import '../components/drawer.dart';
import '../components/classroom_layout.dart'; // Import the ClassroomLayout component

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
    final double classroomHeight = (screenHeight - appBarHeight - 120) / 2;
    final double desksContainerwidth = (screenWidth - 150);
    final double desksContainerHeight = (classroomHeight - 120) / 5;
    final double estimatedPeopleContainerWidth =
        desksContainerwidth + 10 + desksContainerwidth / 6.5;

    final List<TableData> tablesData =
        generateMockClassroomData(); // Generate mock data

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

              // Classroom Layout using ClassroomLayout component
              Container(
                width: screenWidth - 30,
                height: classroomHeight,
                child: ClassroomLayout(tablesData: tablesData),
              ),

              const SizedBox(height: 20),

              // Estimations Section
              Container(
                width: screenWidth - 30,
                height: classroomHeight,
                decoration: BoxDecoration(
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
                          fontSize: 28,
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
                          width: desksContainerwidth,
                          height: desksContainerHeight,
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
                          width: desksContainerwidth / 6.5,
                          height: desksContainerHeight,
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
                          width: desksContainerwidth,
                          height: desksContainerHeight,
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
                          width: desksContainerwidth / 6.5,
                          height: desksContainerHeight,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 237, 44, 6), // Red color
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
                          width: desksContainerwidth,
                          height: desksContainerHeight,
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
                          width: desksContainerwidth / 6.5,
                          height: desksContainerHeight,
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
                          width: estimatedPeopleContainerWidth,
                          height: desksContainerHeight,
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
                          width: estimatedPeopleContainerWidth / 2.5,
                          height: desksContainerHeight,
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
