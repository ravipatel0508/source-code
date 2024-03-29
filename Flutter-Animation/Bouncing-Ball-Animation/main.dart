//
// Bouncing Ball
//
// Created by: Ravi Patel
// Instagram: @bugs_fixes (https://www.instagram.com/bugs_fixes)
//

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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
      home: const BouncingBall(),
    );
  }
}

class BouncingBall extends StatefulWidget {
  const BouncingBall({Key? key}) : super(key: key);

  @override
  State<BouncingBall> createState() => _BouncingBallState();
}

class _BouncingBallState extends State<BouncingBall>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;
  double _vx = 5, _vy = 5, _x = 170, _y = 400;
  final _ballWidth = 30, _ballHeight = 30;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(microseconds: 300), () {
      _x = Random().nextDouble() *
          (MediaQuery.of(context).size.width + _ballWidth);
      _y = Random().nextDouble() *
          (MediaQuery.of(context).size.height + _ballHeight);
      setState(() {});
      _ticker = createTicker((elapsed) {
        _x += _vx;
        _y += _vy;

        final size = MediaQuery.of(context).size;
        if (_x <= 0 || _x >= size.width - _ballWidth) {
          _vx = -_vx;
        }
        if (_y <= 0 || _y >= size.height - _ballHeight) {
          _vy = -_vy;
        }
        setState(() {});
      });
      _ticker.start();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _ticker.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF171d28),
      appBar: AppBar(
        title: const Text('Bouncing Ball'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Transform.translate(
            offset: Offset(_x, _y),
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
