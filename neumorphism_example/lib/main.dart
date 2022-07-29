import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Neumorphism Demo'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: const Center(
          child: PressedNeumorphismDesign(),
          // child: ConcaveNeumorphismDesign(),
          // child: ConvexNeumorphismDesign(),
          // child: FlatNeumorphismDesign(),
        ),
      ),
    );
  }
}

class PressedNeumorphismDesign extends StatelessWidget {
  const PressedNeumorphismDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFD9D9D9),
            blurRadius: 40,
            offset: Offset(20, 20),
            inset: true,
          ),
          BoxShadow(
            color: Color(0xFFFFFFFF),
            blurRadius: 40,
            offset: Offset(-20, -20),
            inset: true,
          ),
        ],
      ),
      child: const Center(
        child: Icon(
          Icons.bookmark_border,
          size: 50,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}

class ConcaveNeumorphismDesign extends StatelessWidget {
  const ConcaveNeumorphismDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment(-1, -1),
          end: Alignment(1, 1),
          colors: [
            Color(0xFFE6E6E6),
            Color(0xFFFFFFFF),
          ],
        ),
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFCCCCCC),
            blurRadius: 40,
            offset: Offset(20, 20),
          ),
          BoxShadow(
            color: Color(0xFFFFFFFF),
            blurRadius: 40,
            offset: Offset(-20, -20),
          ),
        ],
      ),
      child: const Center(
        child: Icon(
          Icons.bookmark,
          size: 50,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}

class ConvexNeumorphismDesign extends StatelessWidget {
  const ConvexNeumorphismDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment(-1, -1),
          end: Alignment(1, 1),
          colors: [
            Color(0xFFFFFFFF),
            Color(0xFFE6E6E6),
          ],
        ),
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFCCCCCC),
            blurRadius: 40,
            offset: Offset(20, 20),
          ),
          BoxShadow(
            color: Color(0xFFFFFFFF),
            blurRadius: 40,
            offset: Offset(-20, -20),
          ),
        ],
      ),
      child: const Center(
        child: Icon(
          Icons.favorite,
          size: 50,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}

class FlatNeumorphismDesign extends StatelessWidget {
  const FlatNeumorphismDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFCCCCCC),
            blurRadius: 40,
            offset: Offset(20, 20),
          ),
          BoxShadow(
            color: Color(0xFFFFFFFF),
            blurRadius: 40,
            offset: Offset(-20, -20),
          ),
        ],
      ),
      child: const Center(
        child: Icon(
          Icons.favorite_border,
          size: 50,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
