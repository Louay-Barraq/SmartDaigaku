import 'dart:ui' as ui;
import 'package:flutter/material.dart';

// Define the TableData class
class TableData {
  final double x;
  final double y;
  final bool isOccupied;

  TableData({required this.x, required this.y, required this.isOccupied});
}

// Generate mock data for tables
List<TableData> generateMockClassroomData() {
  return [
    // Column 1[1]
    TableData(x: 20, y: 58.5, isOccupied: false),
    TableData(x: 20, y: 66.5, isOccupied: false),
    TableData(x: 20, y: 74.7, isOccupied: true),
    TableData(x: 20, y: 82.9, isOccupied: false),
    TableData(x: 20, y: 91.3, isOccupied: true),
    TableData(x: 20, y: 99.5, isOccupied: false),
    TableData(x: 20, y: 107.7, isOccupied: true),
    // Column 1[2]
    TableData(x: 38, y: 58.5, isOccupied: true),
    TableData(x: 38, y: 66.5, isOccupied: true),
    TableData(x: 38, y: 74.7, isOccupied: false),
    TableData(x: 38, y: 82.9, isOccupied: true),
    TableData(x: 38, y: 91.3, isOccupied: true),
    TableData(x: 38, y: 99.5, isOccupied: false),
    TableData(x: 38, y: 107.7, isOccupied: true),
    // Column 2[1]
    TableData(x: 70, y: 42, isOccupied: false),
    TableData(x: 70, y: 50, isOccupied: false),
    TableData(x: 70, y: 58.5, isOccupied: true),
    TableData(x: 70, y: 66.5, isOccupied: true),
    TableData(x: 70, y: 74.7, isOccupied: false),
    TableData(x: 70, y: 82.9, isOccupied: true),
    TableData(x: 70, y: 91.3, isOccupied: false),
    TableData(x: 70, y: 99.5, isOccupied: true),
    TableData(x: 70, y: 107.7, isOccupied: false),
    // Column 2[2]
    TableData(x: 88, y: 42, isOccupied: false),
    TableData(x: 88, y: 50, isOccupied: true),
    TableData(x: 88, y: 58.5, isOccupied: true),
    TableData(x: 88, y: 66.5, isOccupied: true),
    TableData(x: 88, y: 74.7, isOccupied: true),
    TableData(x: 88, y: 82.9, isOccupied: false),
    TableData(x: 88, y: 91.3, isOccupied: false),
    TableData(x: 88, y: 99.5, isOccupied: false),
    TableData(x: 88, y: 107.7, isOccupied: false),
    // Column 3[1]
    TableData(x: 119, y: 42, isOccupied: true),
    TableData(x: 119, y: 50, isOccupied: true),
    TableData(x: 119, y: 58.5, isOccupied: false),
    TableData(x: 119, y: 66.5, isOccupied: false),
    TableData(x: 119, y: 74.7, isOccupied: false),
    TableData(x: 119, y: 82.9, isOccupied: false),
    TableData(x: 119, y: 91.3, isOccupied: true),
    TableData(x: 119, y: 99.5, isOccupied: true),
    TableData(x: 119, y: 107.7, isOccupied: false),
    // Column 3[2]
    TableData(x: 138, y: 42, isOccupied: true),
    TableData(x: 138, y: 50, isOccupied: false),
    TableData(x: 138, y: 58.5, isOccupied: true),
    TableData(x: 138, y: 66.5, isOccupied: false),
    TableData(x: 138, y: 74.7, isOccupied: false),
    TableData(x: 138, y: 82.9, isOccupied: true),
    TableData(x: 138, y: 91.3, isOccupied: true),
    TableData(x: 138, y: 99.5, isOccupied: false),
    TableData(x: 138, y: 107.7, isOccupied: true),
    // Column 4[1]
    TableData(x: 171.5, y: 42, isOccupied: true),
    TableData(x: 171.5, y: 50, isOccupied: true),
    TableData(x: 171.5, y: 58.5, isOccupied: true),
    TableData(x: 171.5, y: 66.5, isOccupied: true),
    TableData(x: 171.5, y: 74.7, isOccupied: false),
    TableData(x: 171.5, y: 82.9, isOccupied: false),
    TableData(x: 171.5, y: 91.3, isOccupied: false),
    TableData(x: 171.5, y: 99.5, isOccupied: false),
    TableData(x: 171.5, y: 107.7, isOccupied: false),
    // Column 4[2]
    TableData(x: 190, y: 42, isOccupied: true),
    TableData(x: 190, y: 50, isOccupied: true),
    TableData(x: 190, y: 58.5, isOccupied: false),
    TableData(x: 190, y: 66.5, isOccupied: false),
    TableData(x: 190, y: 74.7, isOccupied: false),
    TableData(x: 190, y: 82.9, isOccupied: true),
    TableData(x: 190, y: 91.3, isOccupied: true),
    TableData(x: 190, y: 99.5, isOccupied: false),
    TableData(x: 190, y: 107.7, isOccupied: true),
    // Column 5[1]
    TableData(x: 219.5, y: 42, isOccupied: true),
    TableData(x: 219.5, y: 50, isOccupied: true),
    TableData(x: 219.5, y: 58.5, isOccupied: false),
    TableData(x: 219.5, y: 66.5, isOccupied: false),
    TableData(x: 219.5, y: 74.7, isOccupied: false),
    TableData(x: 219.5, y: 82.9, isOccupied: false),
    TableData(x: 219.5, y: 91.3, isOccupied: true),
    TableData(x: 219.5, y: 99.5, isOccupied: true),
    // Column 5[2]
    TableData(x: 238, y: 42, isOccupied: false),
    TableData(x: 238, y: 50, isOccupied: true),
    TableData(x: 238, y: 58.5, isOccupied: true),
    TableData(x: 238, y: 66.5, isOccupied: true),
    TableData(x: 238, y: 74.7, isOccupied: false),
    TableData(x: 238, y: 82.9, isOccupied: true),
    TableData(x: 238, y: 91.3, isOccupied: false),
    TableData(x: 238, y: 99.5, isOccupied: true),
    // Column 6[1]
    TableData(x: 268.5, y: 42, isOccupied: false),
    TableData(x: 268.5, y: 50, isOccupied: true),
    TableData(x: 268.5, y: 58.5, isOccupied: true),
    TableData(x: 268.5, y: 66.5, isOccupied: false),
    TableData(x: 268.5, y: 74.7, isOccupied: true),
    TableData(x: 268.5, y: 82.9, isOccupied: false),
    TableData(x: 268.5, y: 91.3, isOccupied: false),
    TableData(x: 268.5, y: 99.5, isOccupied: true),
    // Column 6[2]
    TableData(x: 287, y: 42, isOccupied: false),
    TableData(x: 287, y: 50, isOccupied: true),
    TableData(x: 287, y: 58.5, isOccupied: false),
    TableData(x: 287, y: 66.5, isOccupied: true),
    TableData(x: 287, y: 74.7, isOccupied: true),
    TableData(x: 287, y: 82.9, isOccupied: true),
    TableData(x: 287, y: 91.3, isOccupied: true),
    TableData(x: 287, y: 99.5, isOccupied: false),
  ];
}

// The main widget for the classroom layout
class ClassroomLayout extends StatefulWidget {
  final List<TableData> tablesData;

  ClassroomLayout({required this.tablesData});

  @override
  _ClassroomLayoutState createState() => _ClassroomLayoutState();
}

class _ClassroomLayoutState extends State<ClassroomLayout> {
  ui.Image? backgroundImageInstance;

  @override
  void initState() {
    super.initState();
    _loadBackgroundImage();
  }

  void _loadBackgroundImage() {
    final imageProvider = AssetImage('assets/images/ClassroomLayout.png');
    final imageStream = imageProvider.resolve(ImageConfiguration.empty);
    imageStream.addListener(
      ImageStreamListener(
        (ImageInfo info, bool synchronousCall) {
          setState(() {
            backgroundImageInstance = info.image;
          });
        },
        onError: (exception, stackTrace) {
          // Handle error
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;
        final aspectRatio = screenWidth / screenHeight;
        final tableSize = 14.0; // Adjust table size here

        return CustomPaint(
          painter: ClassroomPainter(widget.tablesData, backgroundImageInstance,
              aspectRatio, tableSize),
          child: Container(),
        );
      },
    );
  }
}

// CustomPainter class for drawing the classroom layout
class ClassroomPainter extends CustomPainter {
  final List<TableData> tablesData;
  final ui.Image? backgroundImageInstance;
  final double aspectRatio;
  final double tableSize; // Define the size of the tables

  ClassroomPainter(this.tablesData, this.backgroundImageInstance,
      this.aspectRatio, this.tableSize);

  @override
  void paint(Canvas canvas, Size size) {
    if (backgroundImageInstance != null) {
      final paint = Paint();
      final bgRect = Rect.fromLTWH(0, 0, size.width, size.height);

      // Draw the background image
      canvas.drawImageRect(
        backgroundImageInstance!,
        Rect.fromLTWH(0, 0, backgroundImageInstance!.width.toDouble(),
            backgroundImageInstance!.height.toDouble()),
        bgRect,
        paint,
      );

      // Calculate scaling factors based on aspect ratio
      final double scaleX = size.width / 327;
      final double scaleY = size.height / 134;

      // Draw tables
      final tablePaint = Paint()..style = PaintingStyle.fill;

      for (final table in tablesData) {
        final scaledX = table.x * scaleX;
        final scaledY = table.y * scaleY;
        tablePaint.color = table.isOccupied ? Colors.red : Colors.green;

        // Define the rounded rectangle
        final rrect = RRect.fromLTRBR(
          scaledX,
          scaledY,
          scaledX + tableSize,
          scaledY + tableSize,
          Radius.circular(10), // Radius for the circular corners
        );

        // Draw the rounded rectangle
        canvas.drawRRect(rrect, tablePaint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
