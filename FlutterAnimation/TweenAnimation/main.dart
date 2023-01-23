// dependencies:
//   animator: latest

import 'package:animator/animator.dart';
import 'package:flutter/material.dart';

class TweenAnimationExample extends StatefulWidget {
  const TweenAnimationExample({super.key});

  @override
  State<TweenAnimationExample> createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<TweenAnimationExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tween Animation')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            childAspectRatio: 1.5,
          ),
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: Animator<double>(
                duration: const Duration(milliseconds: 1500),
                cycles: 0,
                curve: Curves.easeInOut,
                tween: Tween<double>(begin: 0.0, end: 15.0),
                builder: (context, animatorState, child) => Container(
                  margin: EdgeInsets.all(animatorState.value),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFFF5757),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFF5757).withOpacity(0.5),
                        offset: const Offset(0, 5),
                        blurRadius: 30,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(Icons.favorite, color: Colors.white, size: 40),
                  ),
                ),
              ),
            ),
            Animator<double>(
              duration: const Duration(milliseconds: 1500),
              cycles: 0,
              curve: Curves.easeInOut,
              tween: Tween<double>(begin: 0.0, end: 15.0),
              builder: (context, animatorState, child) => Container(
                margin: EdgeInsets.all(animatorState.value),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      offset: const Offset(0, 5),
                      blurRadius: 30,
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.bookmark,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 150,
              width: 150,
              child: Animator<double>(
                duration: const Duration(milliseconds: 1500),
                cycles: 0,
                curve: Curves.easeInOut,
                tween: Tween<double>(begin: 0.0, end: 15.0),
                builder: (context, animatorState, child) => Container(
                  margin: EdgeInsets.all(animatorState.value),
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.cyan,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.cyanAccent,
                        offset: Offset(0, 5),
                        blurRadius: 30,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.person_add,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 150,
              width: 150,
              child: Animator<double>(
                duration: const Duration(milliseconds: 900),
                cycles: 0,
                curve: Curves.bounceIn,
                tween: Tween<double>(begin: 0.0, end: 15.0),
                builder: (context, animatorState, child) => Container(
                  margin: EdgeInsets.all(animatorState.value),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFFF5757),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFF5757).withOpacity(0.5),
                        offset: const Offset(0, 5),
                        blurRadius: 30,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
