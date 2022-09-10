import 'package:flutter/material.dart';
import 'package:flutter_widgets/animated_physicalmodel.dart';
import 'package:flutter_widgets/random%20password%20gerator/main.dart';

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
      home: const ScaleTransitionExample(),
    );
  }
}

class ScaleTransitionExample extends StatefulWidget {
  const ScaleTransitionExample({Key? key}) : super(key: key);

  @override
  State<ScaleTransitionExample> createState() => _ScaleTransitionExample();
}

class _ScaleTransitionExample extends State<ScaleTransitionExample> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _animation = CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scale Transition Example'),
        centerTitle: true,
      ),
      body: ScaleTransition(
        scale: _animation,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
