/// dependencies:
/// google_fonts:
/// lottie:

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class NewYearEve extends StatelessWidget {
  const NewYearEve({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF04121F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF04121F),
        title: const Text('', style: TextStyle(color: Colors.white, fontSize: 25)),
        centerTitle: true,
      ),
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            Center(heightFactor: 1.7, child: LottieBuilder.asset('assets/lottie/fireworks3.json')),
            const Center(
              heightFactor: 1,
              child: Text(
                'Happy New Year',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                ),
              ),
            ),
            const Center(
              heightFactor: 3,
              child: Text(
                '2023',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              bottom: 150,
              left: 70,
              child: Text(
                '@bugs_fixes x @flutteruidev',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: GoogleFonts.baumans().fontFamily,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
