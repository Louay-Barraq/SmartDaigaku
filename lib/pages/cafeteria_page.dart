// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_daigaku/components/cafeteria_layout.dart';
import 'package:smart_daigaku/components/drawer.dart';
import 'package:smart_daigaku/themes/theme_provider.dart';

class CafeteriaPage extends StatefulWidget {
  double emptyTables = 11;
  double occupiedTables = 12;
  int estimatedPeopleNumber = 33;
  CafeteriaPage({super.key});

  @override
  State<CafeteriaPage> createState() => _CafeteriaPageState();
}

class _CafeteriaPageState extends State<CafeteriaPage> {
  final String _currentPage = 'Cafeteria';
  final GlobalKey _firstContainerKey = GlobalKey();
  final GlobalKey _secondContainerKey = GlobalKey();
  double? totalWidth;

  @override
  void initState() {
    super.initState();
    // Delay measuring until after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateTotalWidth();
    });
  }

  void _calculateTotalWidth() {
    final RenderBox firstBox =
        _firstContainerKey.currentContext?.findRenderObject() as RenderBox;
    final RenderBox secondBox =
        _secondContainerKey.currentContext?.findRenderObject() as RenderBox;

    final double firstContainerWidth = firstBox.size.width;
    final double secondContainerWidth = secondBox.size.width;

    // Get the position of the second container relative to the first
    final Offset firstContainerPosition = firstBox.localToGlobal(Offset.zero);
    final Offset secondContainerPosition = secondBox.localToGlobal(Offset.zero);

    // Calculate the space between them
    final double spaceBetween = secondContainerPosition.dx -
        (firstContainerPosition.dx + firstContainerWidth);

    // Total width from the start of the first container to the end of the second
    setState(() {
      totalWidth = firstContainerWidth + secondContainerWidth + spaceBetween;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<TableData> tablesData = generateMockTablesData();
    final double screenWidth = MediaQuery.of(context).size.width;
    const isEmpty = true;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('C A F E T E R I A'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                // Unidentified, Empty, Occupied
                Container(
                  height: 40,
                  width: screenWidth,
                  color: Colors.white,
                  child: Row(children: [
                    Container(
                      height: 30,
                      width: screenWidth / 3,
                      color: Color(0xFF06ED1D),
                      child: Center(
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
                      child: Center(
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
                      child: Center(
                        child: Text(
                          'Occupied',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ]),
                ),
                SizedBox(height: 20),
                // Cafeteria Image
                Center(
                  child: Container(
                    width: screenWidth - 30,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CafeteriaLayout(tablesData: tablesData),
                  ),
                ),

                SizedBox(height: 20),
                // Informations Section
                Center(
                    child: Container(
                  height: 175,
                  width: screenWidth - 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 5),
                        child: Text(
                          'Informations',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                            color: Color(0xFF606464),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 35,
                            width: 230,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 8,
                                  blurStyle: BlurStyle.normal,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'Empty Tables',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 35,
                            width: 45,
                            decoration: BoxDecoration(
                              color: Color(0xFF05B517),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 8,
                                  blurStyle: BlurStyle.normal,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                '${widget.emptyTables.round()}',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 35,
                            width: 230,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 8,
                                  blurStyle: BlurStyle.normal,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'Occupied Tables',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Container(
                            height: 35,
                            width: 45,
                            decoration: BoxDecoration(
                              color: Color(0xFFED1414),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 8,
                                  blurStyle: BlurStyle.normal,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                '${widget.occupiedTables.round()}',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )),
                SizedBox(height: 20),
                // Estimations Section
                Center(
                    child: Container(
                  height: 200,
                  width: screenWidth - 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            key: _firstContainerKey,
                            height: 35,
                            width: 230,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 8,
                                  blurStyle: BlurStyle.normal,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'Number of People',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Container(
                            key: _secondContainerKey,
                            height: 35,
                            width: 45,
                            decoration: BoxDecoration(
                              color: Color(0xFF2D82B7),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 8,
                                  blurStyle: BlurStyle.normal,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                '${widget.estimatedPeopleNumber.round()}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Container(
                        height: 35,
                        width: totalWidth,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              spreadRadius: 0,
                              blurRadius: 8,
                              blurStyle: BlurStyle.normal,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Cafeteria\'s State',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        height: 35,
                        width: 120,
                        decoration: BoxDecoration(
                          color:
                              isEmpty ? Color(0xFF05B517) : Color(0xFFED1414),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              spreadRadius: 0,
                              blurRadius: 8,
                              blurStyle: BlurStyle.normal,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            isEmpty ? 'Empty' : 'Full',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
                SizedBox(height: 30),
              ],
            ),
          )
        ],
      )),
      drawer: AppDrawer(currentPage: _currentPage),
    );
  }
}
