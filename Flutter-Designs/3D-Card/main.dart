//
// 3D Card
//
// Created by: Ravi Patel
// Instagram: @bugs_fixes (https://www.instagram.com/bugs_fixes)
//

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
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const ThreeDimensionalCard(),
    );
  }
}

class ThreeDimensionalCard extends StatefulWidget {
  const ThreeDimensionalCard({Key? key}) : super(key: key);

  @override
  State<ThreeDimensionalCard> createState() => _ThreeDimensionalCardState();
}

class _ThreeDimensionalCardState extends State<ThreeDimensionalCard>
    with SingleTickerProviderStateMixin {
  Offset location = Offset.zero;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Adjust animation duration
    )
      ..repeat()
      ..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    const height = 256.0;
    final width = screenSize.width > 400 ? 400.0 : screenSize.width * 0.9;

    const cardHeight = height - 7;
    final cardWidth = width - 7;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: const Text('3D Card',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 256,
                width: width,
                decoration: BoxDecoration(
                  gradient: SweepGradient(
                    colors: const [
                      Colors.cyanAccent,
                      Colors.pinkAccent,
                      Colors.yellowAccent,
                      Colors.cyanAccent
                    ],
                    transform: _animatedGradientTransform(),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.002) // perspective
                  ..rotateX(0.001 * location.dy)
                  ..rotateY(-0.001 * location.dx),
                alignment: FractionalOffset.center,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    location += details.delta;
                    setState(() {});
                  },
                  onPanEnd: (details) {
                    location = Offset.zero;
                    setState(() {});
                  },
                  child: Container(
                    height: cardHeight,
                    width: cardWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade800,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 20,
                                width: 80 * 2,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade800,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                height: 20,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade800,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
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
