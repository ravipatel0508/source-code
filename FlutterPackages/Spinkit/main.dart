// dependencies:
//   spinkit: latest

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinkitDemo extends StatefulWidget {
  const SpinkitDemo({Key? key}) : super(key: key);

  @override
  State<SpinkitDemo> createState() => _SpinkitDemoState();
}

class _SpinkitDemoState extends State<SpinkitDemo> with TickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Flutter Spinkit Demo',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: [
          SpinKitCubeGrid(
            color: Colors.blueGrey[900],
            controller: _controller,
          ),
          SpinKitCircle(
            color: Colors.blueGrey[900],
          ),
          SpinKitDancingSquare(
            color: Colors.blueGrey[900],
          ),
          SpinKitDualRing(
            color: Colors.blueGrey[900]!,
          ),
          SpinKitDoubleBounce(
            color: Colors.blueGrey[900],
          ),
          SpinKitFadingFour(
            color: Colors.blueGrey[900],
          ),
          SpinKitFoldingCube(
            color: Colors.blueGrey[900],
          ),
          SpinKitHourGlass(
            color: Colors.blueGrey[900]!,
          ),
          SpinKitRipple(
            color: Colors.blueGrey[900],
          ),
          SpinKitPianoWave(
            color: Colors.blueGrey[900],
          ),
          SpinKitPouringHourGlass(
            color: Colors.blueGrey[900]!,
          ),
          SpinKitThreeInOut(
            color: Colors.blueGrey[900],
          )
        ],
      ),
    );
  }
}
