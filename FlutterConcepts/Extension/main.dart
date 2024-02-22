//
// Extension in Flutter
//
// Created by: Ravi Patel
// Instagram: @bugs_fixes (https://www.instagram.com/bugs_fixes)
//

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Concepts and Widgets',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ExtensionExample(),
    );
  }
}

class ExtensionExample extends StatelessWidget {
  const ExtensionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extension Example'),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple[300],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            Text(
              'hello world'.capitalize,
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Image.asset('assets/Profile.png', height: 130.0).shake(),
            const Text('@bugs_fixes', style: TextStyle(fontSize: 18.0)).shake(),
          ],
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String get capitalize => '${this[0].toUpperCase()}${substring(1)}';
}

extension ShakeExtension on Widget {
  Widget shake({int duration = 1000, double offset = 6.0}) =>
      TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: offset),
        duration: Duration(milliseconds: duration),
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(sin(value * pi) * offset, 0.0),
            child: child,
          );
        },
        child: this,
      );
}
