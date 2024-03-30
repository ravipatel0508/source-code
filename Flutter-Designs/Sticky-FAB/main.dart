//
// Sticky FAB Design
//
// Created by: Ravi Patel
// Instagram: @bugs_fixes (https://www.instagram.com/bugs_fixes)
//
// Credit: https://github.com/JideGuru/animation_playground/blob/master/lib/shaders/metaball_fab.dart

/// [TODO] Add the following code to your pubspec.yaml file [same way like we add "assets:"]
/// shaders:
/// - shaders/metaball_shader.frag

import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

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
      home: const StickyFAB(),
    );
  }
}

class StickyFAB extends StatefulWidget {
  const StickyFAB({Key? key}) : super(key: key);

  @override
  State<StickyFAB> createState() => _StickyFABState();
}

class _StickyFABState extends State<StickyFAB> with TickerProviderStateMixin {
  late Offset mainButtonPos;
  late Offset firstButtonPos;
  late Offset secondButtonPos;
  late final AnimationController _firstController;
  late final Animation<Offset> _firstAnimation;
  late final AnimationController _secondController;
  late final Animation<Offset> _secondAnimation;
  bool expanded = false;

  @override
  void initState() {
    super.initState();
    var screenWidth =
        (ui.window.physicalSize.shortestSide / ui.window.devicePixelRatio);
    var screenHeight =
        (ui.window.physicalSize.longestSide / ui.window.devicePixelRatio);
    mainButtonPos = Offset(screenWidth / 2, screenHeight - 100);
    firstButtonPos = Offset(screenWidth / 2, screenHeight - 100);
    secondButtonPos = Offset(screenWidth / 2, screenHeight - 100);
    _firstController = AnimationController(
      // value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _firstAnimation = Tween<Offset>(
      begin: firstButtonPos,
      end: Offset(firstButtonPos.dx, firstButtonPos.dy - 250),
    ).animate(_firstController);

    _secondController = AnimationController(
      // value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _secondAnimation = Tween<Offset>(
      begin: secondButtonPos,
      end: Offset(secondButtonPos.dx, secondButtonPos.dy - 140),
    ).animate(_secondController);

    _firstController.addListener(() {
      setState(() {});
    });
    _secondController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sticky FAB Design'),
      ),
      backgroundColor: Colors.black,
      body: ShaderBuilder(
        assetKey: 'shaders/metaball_shader.frag',
        child: Stack(
          children: [
            Positioned(
              top: firstButtonPos.dy,
              left: firstButtonPos.dx,
              child: Container(
                height: 40,
                width: 40,
                color: Colors.transparent,
              ),
            ),
            Positioned(
              top: mainButtonPos.dy - 100,
              left: mainButtonPos.dx - 90,
              child: GestureDetector(
                onTap: () {
                  if (expanded) {
                    _firstController.reverse();
                    _secondController.reverse();
                  } else {
                    _firstController.forward();
                    _secondController.forward();
                  }
                  expanded = !expanded;
                },
                child: Container(
                  height: 150,
                  width: 150,
                  color: Colors.transparent,
                ),
              ),
            ),
          ],
        ),
        (context, shader, child) {
          return AnimatedSampler(
            child: child!,
            (ui.Image image, Size size, Canvas canvas) {
              shader
                ..setFloat(0, mainButtonPos.dx)
                ..setFloat(1, mainButtonPos.dy)
                ..setFloat(2, 90)
                ..setFloat(3, _firstAnimation.value.dx)
                ..setFloat(4, _firstAnimation.value.dy)
                ..setFloat(5, 40)
                ..setFloat(6, 3)
                ..setFloat(7, 1.9)
                ..setFloat(8, 10.0)
                ..setFloat(9, _secondAnimation.value.dx)
                ..setFloat(10, _secondAnimation.value.dy)
                ..setFloat(11, 40);
              canvas.drawRect(
                Offset.zero & size,
                Paint()
                  ..color = Colors.white
                  ..shader = shader,
              );
            },
          );
        },
      ),
    );
  }
}
