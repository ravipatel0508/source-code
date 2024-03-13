import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Designs',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ColorChangingGrid(),
    );
  }
}

class ColorChangingGrid extends StatefulWidget {
  const ColorChangingGrid({Key? key}) : super(key: key);

  @override
  State<ColorChangingGrid> createState() => _ColorChangingGridState();
}

class _ColorChangingGridState extends State<ColorChangingGrid>
    with SingleTickerProviderStateMixin {
  Offset location = Offset.zero;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Adjust animation duration
    )..repeat(); // Repeat the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
      // backgroundColor: const Color(0xFF0B1623),
      // backgroundColor: Colors.black,
      backgroundColor: const Color(0xFF171d28),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: const Text('Color Changing Grid'),
      ),
      body: Center(
        child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              double gradientRotation = _controller.value * 2 * math.pi;
              return SizedBox(
                width: screenSize.width,
                height: squareAmountVertical * squareContainerSize,
                child: CustomPaint(
                  size: Size(screenSize.width,
                      squareAmountVertical * squareContainerSize),
                  painter: _GridPainter(
                    squareAmountHorizontal: squareAmountHorizontal,
                    squareAmountVertical: squareAmountVertical,
                    squareContainerSize: squareContainerSize,
                    padding: squarePadding,
                    squareSize: squareSize,
                    gradientRotation: gradientRotation,
                    // location: location,
                  ),
                ),
              );
            }),
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
  double gradientRotation;

  _GridPainter({
    required this.squareAmountHorizontal,
    required this.squareAmountVertical,
    required this.squareContainerSize,
    required this.padding,
    required this.squareSize,
    required this.gradientRotation,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var gradient = SweepGradient(
      colors: const [
        Color(0xFF7284d0),
        Color(0xFFa710ae),
        Color(0xFFf53180),
        Color(0xFF5456ab),
        Color(0xFFcc3bd6),
        Color(0xFF92e624),
        Color(0xFF7284d0)
      ],
      transform: GradientRotation(gradientRotation),
    );

    Rect canvasRect = Rect.fromCenter(
      center: size.center(Offset.zero),
      width: size.width / 2,
      height: size.height / 2,
    );

    Paint paint = Paint()..shader = gradient.createShader(canvasRect);

    for (int i = 0; i < squareAmountHorizontal; i++) {
      for (int j = 0; j < squareAmountVertical; j++) {
        final rectPos = Offset(
          i * squareContainerSize + padding * 2,
          j * squareContainerSize + padding * 2,
        );

        Rect rect = Rect.fromCenter(
          center: rectPos,
          height: squareSize,
          width: squareSize,
        );
        canvas.drawRRect(
            RRect.fromRectAndRadius(rect, const Radius.circular(4)), paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
