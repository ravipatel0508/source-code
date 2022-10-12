import 'dart:ui';

import 'package:flutter/material.dart';

class GlassmorphismExample extends StatelessWidget {
  const GlassmorphismExample({super.key});

  String img = 'AssetPath';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Glassmorphism Example'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[900],
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(img),
          ),
        ),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey[800]!, width: 2),
                ),
                child: const Center(
                  child: Text(
                    'Glassmorphism',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
