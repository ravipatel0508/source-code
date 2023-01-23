// dependencies: avatar_glow: latest

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class GlowAnimationExample extends StatefulWidget {
  const GlowAnimationExample({super.key});

  @override
  State<GlowAnimationExample> createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<GlowAnimationExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Glow Animation'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: [
          AvatarGlow(
            glowColor: Colors.pink[400]!,
            endRadius: 120,
            duration: const Duration(milliseconds: 2000),
            repeat: true,
            showTwoGlows: true,
            curve: Curves.easeOutQuad,
            child: Container(
              height: 80,
              width: 80,
              decoration:
                  BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(99)),
              child: const Icon(Icons.favorite, color: Colors.pink, size: 40),
            ),
          ),
          AvatarGlow(
            glowColor: Colors.grey,
            endRadius: 120,
            duration: const Duration(milliseconds: 2000),
            repeat: true,
            showTwoGlows: true,
            curve: Curves.easeOutQuad,
            child: Container(
              height: 80,
              width: 80,
              decoration:
                  BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(99)),
              child: const Icon(
                Icons.bookmark_add_outlined,
                color: Colors.blue,
                size: 40,
              ),
            ),
          ),
          AvatarGlow(
            glowColor: Colors.blueGrey,
            endRadius: 120,
            duration: const Duration(milliseconds: 2000),
            repeat: true,
            showTwoGlows: true,
            curve: Curves.easeOutQuad,
            child: Container(
              height: 80,
              width: 80,
              decoration:
                  BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(99)),
              child: const Icon(
                Icons.person_add,
                color: Colors.blueGrey,
                size: 40,
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            child: AvatarGlow(
              glowColor: Colors.white,
              endRadius: 120,
              duration: const Duration(milliseconds: 2000),
              repeat: true,
              showTwoGlows: true,
              curve: Curves.easeOutQuad,
              child: Container(
                height: 80,
                width: 80,
                decoration:
                    BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(99)),
                child: const Icon(
                  Icons.favorite,
                  color: Colors.blue,
                  size: 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
