import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class TableData {
  final double x;
  final double y;
  final bool isOccupied;

  TableData({required this.x, required this.y, required this.isOccupied});
}

List<TableData> generateMockTablesData() {
  return [
    // 1st Row
    TableData(x: 150, y: 25, isOccupied: true),
    TableData(x: 175, y: 25, isOccupied: false),
    TableData(x: 200, y: 25, isOccupied: false),
    TableData(x: 225, y: 25, isOccupied: true),
    TableData(x: 250, y: 25, isOccupied: false),
    TableData(x: 275, y: 25, isOccupied: true),
    // 2nd Row
    TableData(x: 150, y: 50, isOccupied: false),
    TableData(x: 175, y: 50, isOccupied: true),
    TableData(x: 200, y: 50, isOccupied: false),
    TableData(x: 225, y: 50, isOccupied: true),
    TableData(x: 250, y: 50, isOccupied: true),
    TableData(x: 275, y: 50, isOccupied: false),
    // 3rd Row
    TableData(x: 150, y: 80, isOccupied: true),
    TableData(x: 175, y: 80, isOccupied: false),
    TableData(x: 200, y: 80, isOccupied: true),
    TableData(x: 225, y: 80, isOccupied: true),
    TableData(x: 250, y: 80, isOccupied: false),
    TableData(x: 275, y: 80, isOccupied: false),
    // 4th Row
    TableData(x: 175, y: 105, isOccupied: true),
    TableData(x: 200, y: 105, isOccupied: false),
    TableData(x: 225, y: 105, isOccupied: true),
    TableData(x: 250, y: 105, isOccupied: true),
    TableData(x: 275, y: 105, isOccupied: false),
  ];
}

class CafeteriaLayout extends StatefulWidget {
  final List<TableData> tablesData;

  CafeteriaLayout({required this.tablesData});

  @override
  _CafeteriaLayoutState createState() => _CafeteriaLayoutState();
}

class _CafeteriaLayoutState extends State<CafeteriaLayout> {
  ui.Image? backgroundImageInstance;

  @override
  void initState() {
    super.initState();
    _loadBackgroundImage();
  }

  void _loadBackgroundImage() {
    final imageProvider = AssetImage('assets/images/Cafeteria Layout.png');
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

        return CustomPaint(
          painter: CafeteriaPainter(
              widget.tablesData, backgroundImageInstance, aspectRatio),
          child: Container(),
        );
      },
    );
  }
}

class CafeteriaPainter extends CustomPainter {
  final List<TableData> tablesData;
  final ui.Image? backgroundImageInstance;
  final double aspectRatio;

  CafeteriaPainter(
      this.tablesData, this.backgroundImageInstance, this.aspectRatio);

  @override
  void paint(Canvas canvas, Size size) {
    print(aspectRatio);
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
      final tablePaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3;

      for (final table in tablesData) {
        final scaledX = table.x * scaleX;
        final scaledY = table.y * scaleY;
        tablePaint.color = table.isOccupied ? Colors.red : Colors.green;
        canvas.drawRect(
          Rect.fromLTWH(scaledX, scaledY, 15, 15),
          tablePaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
