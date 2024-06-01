// spoiler_widget: latest

import 'package:flutter/material.dart';
import 'package:spoiler_widget/spoiler_widget.dart';

class SpoilerWidgetExample extends StatefulWidget {
  const SpoilerWidgetExample({super.key});

  @override
  State<SpoilerWidgetExample> createState() => _SpoilerWidgetExampleState();
}

class _SpoilerWidgetExampleState extends State<SpoilerWidgetExample> {
  bool enable = true;

  final text = 'This is a spoiler! Tap to reveal.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spoiler Widget Example'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          heightFactor: 1.5,
          child: RepaintBoundary(
            child: SpoilerTextWidget(
              enable: enable,
              maxParticleSize: 1.5,
              particleDensity: .4,
              speedOfParticles: 0.3,
              fadeRadius: 3,
              fadeAnimation: true,
              enableGesture: true,
              selection: const TextSelection(baseOffset: 0, extentOffset: 15),
              text: text,
              particleColor: Colors.green[800]!,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.green[300]!,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
