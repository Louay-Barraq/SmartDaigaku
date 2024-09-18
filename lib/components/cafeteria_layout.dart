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
    TableData(x: 0, y: 0, isOccupied: true),
    TableData(x: 20, y: 40, isOccupied: true),
    TableData(x: 40, y: 80, isOccupied: false),
    TableData(x: 50, y: 50, isOccupied: true),
    TableData(x: 100, y: 120, isOccupied: false),
    TableData(x: 60, y: 20, isOccupied: false),
    TableData(x: 80, y: 30, isOccupied: true),
    TableData(x: 120, y: 40, isOccupied: false),
    TableData(x: 150, y: 60, isOccupied: true),
    TableData(x: 180, y: 90, isOccupied: false),
    TableData(x: 200, y: 70, isOccupied: true),
    TableData(x: 220, y: 110, isOccupied: false),
    TableData(x: 250, y: 100, isOccupied: true),
    TableData(x: 280, y: 30, isOccupied: false),
    TableData(x: 300, y: 50, isOccupied: true),
    TableData(x: 305, y: 80, isOccupied: false),
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
