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
      home: const AnimatedPositionExample(),
    );
  }
}

class AnimatedPositionExample extends StatefulWidget {
  const AnimatedPositionExample({Key? key}) : super(key: key);

  @override
  State<AnimatedPositionExample> createState() => _AnimatedPositionExampleState();
}

class _AnimatedPositionExampleState extends State<AnimatedPositionExample> {
  bool _visible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Positioned(
              right: 15,
              top: 150,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey[400]!, width: 5),
                  color: Colors.blueGrey[600],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey[100]!,
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Bugs and Fixes',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            AnimatedPositioned(
              right: _visible ? 100 : 15,
              top: _visible ? 250 : 150,
              duration: const Duration(seconds: 1),
              curve: Curves.elasticInOut,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _visible = !_visible;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    border: Border.all(color: Colors.blueGrey, width: 5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey[100]!,
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('Bugs and Fixes', style: TextStyle(color: Colors.blueGrey, fontSize: 20)),
                ),
              ),
            ),
            Positioned(
              bottom: 300,
              left: 50,
              child: RichText(
                text: TextSpan(
                  text: 'Hide-Show\n',
                  style: Theme.of(context).textTheme.headline2,
                  children: [
                    TextSpan(
                      text: 'Animation\nin ',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    TextSpan(
                      text: 'Flutter ',
                      style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
