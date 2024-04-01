//
// Grid Interaction
//
// Created by: Ravi Patel
// Instagram: @bugs_fixes (https://www.instagram.com/bugs_fixes)
//
// Credit: github.com/JideGuru

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const GridMagnification(),
    );
  }
}

class GridMagnification extends StatefulWidget {
  const GridMagnification({Key? key}) : super(key: key);

  @override
  State<GridMagnification> createState() => _GridMagnificationState();
}

class _GridMagnificationState extends State<GridMagnification> {
  Offset location = Offset.zero;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    int squareAmountHorizontal = screenSize.width ~/ 32.7;
    double squareContainerSize = screenSize.width / squareAmountHorizontal;
    double squarePadding = 10;
    double squareSize = squareContainerSize - squarePadding;
    int squareAmountVertical =
        (screenSize.height / squareContainerSize).floor() - 3;

    return Scaffold(
      // backgroundColor: Colors.black,
      backgroundColor: const Color(0xFF171d28),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: const Text('Grid Interaction'),
      ),
      body: Center(
        child: GestureDetector(
          onPanDown: (details) {
            location = details.globalPosition;
            setState(() {});
          },
          onPanUpdate: (details) {
            location = details.globalPosition;
            setState(() {});
          },
          onPanEnd: (details) {
            location = Offset.zero;
            setState(() {});
          },
          child: SizedBox(
            width: screenSize.width,
            height: squareAmountVertical * squareContainerSize,
            child: CustomPaint(
              size: Size(
                  screenSize.width, squareAmountVertical * squareContainerSize),
              painter: _GridPainter(
                squareAmountHorizontal: squareAmountHorizontal,
                squareAmountVertical: squareAmountVertical,
                squareContainerSize: squareContainerSize,
                padding: squarePadding,
                squareSize: squareSize,
                location: location,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  final int squareAmountHorizontal;
  final int squareAmountVertical;
  final double squareContainerSize;
  final double padding;
  final double squareSize;
  final Offset location;

  _GridPainter({
    required this.squareAmountHorizontal,
    required this.squareAmountVertical,
    required this.squareContainerSize,
    required this.padding,
    required this.squareSize,
    required this.location,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var gradient = const SweepGradient(
      // colors: [Colors.cyan, Colors.pink, Colors.yellow, Colors.cyan],
      colors: [
        Color(0xFF7284d0),
        Color(0xFFa710ae),
        Color(0xFFf53180),
        Color(0xFF5456ab),
        Color(0xFFcc3bd6),
        Color(0xFF92e624),
        Color(0xFF7284d0)
      ],
    );
    Rect canvasRect = Rect.fromCenter(
      center: size.center(Offset.zero),
      width: size.width / 2,
      height: size.height / 2,
    );
    Paint paint = Paint()..color = Colors.white;
    paint.shader = gradient.createShader(canvasRect);
    const radius = 110;
    for (int i = 0; i < squareAmountHorizontal; i++) {
      for (int j = 0; j < squareAmountVertical; j++) {
        final rectPos = Offset(
          i * squareContainerSize + padding * 2,
          j * squareContainerSize + padding * 2,
        );

        final a = location.dx - rectPos.dx;
        final b = location.dy - rectPos.dy;
        final distance = sqrt(
          pow(location.dx - rectPos.dx, 2) + pow(location.dy - rectPos.dy, 2),
        );
        final median = (distance - radius) / radius;
        final root = sqrt((a * a) + (b * b));
        final scale = (root - radius) / radius;
        final modifiedScale = location == Offset.zero ? 1 : (1 - scale);
        final fadingScale = modifiedScale > 0 ? modifiedScale : 0;
        final translateX = a * median;
        final translateY = b * median;
        Rect rect = Rect.fromCenter(
          center: rectPos,
          height: fadingScale * squareSize,
          width: fadingScale * squareSize,
        );
        Rect transformedRect = rect.translate(translateX, translateY);
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            location == Offset.zero ? rect : transformedRect,
            const Radius.circular(4),
          ),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
