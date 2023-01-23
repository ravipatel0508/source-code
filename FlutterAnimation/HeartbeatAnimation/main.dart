// dependencies:
//   animator: latest

import 'package:animator/animator.dart';
import 'package:flutter/material.dart';

class HeartbeatAnimationExample extends StatefulWidget {
  const HeartbeatAnimationExample({super.key});

  @override
  State<HeartbeatAnimationExample> createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<HeartbeatAnimationExample> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text('Heartbeat Animation')),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: width / 2.7,
                width: width / 2.7,
                child: Animator<double>(
                  duration: const Duration(milliseconds: 1000),
                  cycles: 0,
                  curve: Curves.elasticIn,
                  tween: Tween<double>(begin: 20.0, end: 25.0),
                  builder: (context, animatorState, child) => Icon(
                    Icons.favorite,
                    size: animatorState.value * 5,
                    color: const Color(0xFFFF5757),
                  ),
                ),
              ),
              SizedBox(
                height: width / 2.7,
                width: width / 2.7,
                child: Animator<double>(
                  duration: const Duration(milliseconds: 1000),
                  cycles: 0,
                  curve: Curves.elasticInOut,
                  tween: Tween<double>(begin: 20.0, end: 25.0),
                  builder: (context, animatorState, child) => Icon(
                    Icons.favorite,
                    size: animatorState.value * 5,
                    color: const Color(0xFFFF5757),
                  ),
                ),
              ),
            ],
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: width / 2.7,
                width: width / 2.7,
                child: Animator<double>(
                  duration: const Duration(milliseconds: 1000),
                  cycles: 0,
                  curve: Curves.bounceOut,
                  tween: Tween<double>(begin: 20.0, end: 25.0),
                  builder: (context, animatorState, child) => Icon(
                    Icons.favorite,
                    size: animatorState.value * 5,
                    color: const Color(0xFFFF5757),
                  ),
                ),
              ),
              SizedBox(
                height: width / 2.7,
                width: width / 2.7,
                child: Animator<double>(
                  duration: const Duration(milliseconds: 1000),
                  cycles: 0,
                  curve: Curves.elasticOut,
                  tween: Tween<double>(begin: 20.0, end: 25.0),
                  builder: (context, animatorState, child) => Icon(
                    Icons.favorite,
                    size: animatorState.value * 5,
                    color: const Color(0xFFFF5757),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
