//
// Lava Ball Animation in Flutter
//
// Created by: Ravi Patel
// Instagram: @bugs_fixes (https://www.instagram.com/bugs_fixes)
//

import 'package:flutter/material.dart';
import 'package:flutter_animations/LavaBallAnimation/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LavaAnimation(
        color: Colors.orange,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text(
                  'Lava Ball\nAnimation',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 70,
                    color: Colors.orange[900]!,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'in Flutter',
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.orange[900]!,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  'by @bugs_fixes',
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.orange[900]!,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
