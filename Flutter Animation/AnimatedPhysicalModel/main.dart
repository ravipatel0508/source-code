import 'package:flutter/material.dart';

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
      home: const AnimatedPhysicalModelExample(),
    );
  }
}

class AnimatedPhysicalModelExample extends StatefulWidget {
  const AnimatedPhysicalModelExample({super.key});

  @override
  State<AnimatedPhysicalModelExample> createState() => _AnimatedPhysicalModelExampleState();
}

class _AnimatedPhysicalModelExampleState extends State<AnimatedPhysicalModelExample> {
  bool _play = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        heightFactor: 2.9,
        child: AnimatedPhysicalModel(
          duration: const Duration(milliseconds: 300),
          elevation: _play ? 10 : 0,
          color: Colors.blueGrey,
          shape: BoxShape.rectangle,
          shadowColor: Colors.blueGrey,
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          child: const SizedBox(
            width: 240,
            height: 240,
            child: Center(
              child: Text('AnimatedPhysicalModel', style: TextStyle(fontSize: 18.0, color: Colors.white)),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => _play = !_play);
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
