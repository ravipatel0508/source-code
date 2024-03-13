import 'package:flutter/material.dart';
import 'dart:math' as math;

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
      theme: ThemeData(fontFamily: GoogleFonts.rubikMoonrocks().fontFamily),
      home: const AnimatedSweepGradient(),
    );
  }
}

class AnimatedSweepGradient extends StatefulWidget {
  const AnimatedSweepGradient({Key? key}) : super(key: key);

  @override
  State<AnimatedSweepGradient> createState() => _AnimatedSweepGradientState();
}

class _AnimatedSweepGradientState extends State<AnimatedSweepGradient>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration:
          const Duration(seconds: 5), // Adjust animation duration as needed
    )
      ..repeat()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: SweepGradient(
            transform: _animatedGradientTransform(),
            colors: const [
              Colors.white,
              Colors.grey,
              Colors.black,
            ],
          ),
        ),
        child: const Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 100,
              child: Text(
                'DAY',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              child: Text(
                'NIGHT',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  GradientRotation _animatedGradientTransform() {
    // Animate the gradient rotation from 0 to 2 * pi (full circle)
    return GradientRotation(_controller.value * 2 * math.pi);
  }
}
