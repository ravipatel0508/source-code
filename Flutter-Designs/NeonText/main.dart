import 'package:flutter/material.dart';

class NeonTextExample extends StatelessWidget {
  const NeonTextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Neon Text Example'),
        centerTitle: true,
      ),
      body: const Center(
        heightFactor: 1.5,
        child: Text(
          'Bugs Fixes',
          style: TextStyle(
            fontSize: 40,
            shadows: [
              Shadow(
                blurRadius: 10,
                color: Colors.blue,
                offset: Offset(0, 0),
              ),
              Shadow(
                blurRadius: 10,
                color: Colors.blue,
                offset: Offset(0, 0),
              ),
              Shadow(
                blurRadius: 10,
                color: Colors.blue,
                offset: Offset(0, 0),
              ),
              Shadow(
                blurRadius: 10,
                color: Colors.blue,
                offset: Offset(0, 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
