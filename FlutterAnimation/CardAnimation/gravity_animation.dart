import 'package:flutter/material.dart';

class GravityAnimation extends StatefulWidget {
  const GravityAnimation({super.key});

  @override
  State<GravityAnimation> createState() => _GravityAnimationState();
}

class _GravityAnimationState extends State<GravityAnimation> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gravity Animation')),
      body: Center(
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            setState(() {
              isTapped = !isTapped;
            });
          },
          child: AnimatedContainer(
            margin: EdgeInsets.only(bottom: isTapped ? 0 : 400),
            duration: const Duration(seconds: 1),
            curve: isTapped ? Curves.bounceOut : Curves.ease,
            height: 150,
            width: 220,
            decoration: BoxDecoration(
              color: Colors.blueGrey[700],
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.3),
                  blurRadius: 10,
                  offset: const Offset(0, 7),
                ),
              ],
            ),
            child: Center(
              child: Icon(
                isTapped ? Icons.arrow_downward : Icons.arrow_upward,
                color: Colors.white,
                size: 35,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
