import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const TransformExample(title: 'Transform Example'),
    );
  }
}

class TransformExample extends StatelessWidget {
  final String title;
  const TransformExample({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transform Example'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        color: Colors.blueGrey[100],
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.15,
        alignment: Alignment.topLeft,
        child: Transform.scale(
          alignment: Alignment.bottomRight,
          scaleX: 1.0,
          // scale: 0.8,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.blueGrey[200],
            child: const Text('@bugs_fixes', style: TextStyle(fontSize: 20)),
          ),
        ),
      ),
    );
  }
}
