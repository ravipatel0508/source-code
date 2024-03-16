//
// Burn Like Design
//
// Created by: Ravi Patel
// Instagram: @bugs_fixes (https://www.instagram.com/bugs_fixes)
//

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const BurnLikeDesign(),
    );
  }
}

class BurnLikeDesign extends StatefulWidget {
  const BurnLikeDesign({Key? key}) : super(key: key);

  @override
  State<BurnLikeDesign> createState() => _BurnLikeDesignState();
}

class _BurnLikeDesignState extends State<BurnLikeDesign>
    with SingleTickerProviderStateMixin {
  late List<Particle> particles;
  late List<Particle> particlesToRemove;
  late final Ticker _ticker;

  @override
  void initState() {
    super.initState();
    particles = List.generate(1, (index) => Particle());
    particlesToRemove = List.empty(growable: true);

    _ticker = createTicker((elapsed) {
      particles.add(Particle());
      for (var particle in particlesToRemove) {
        particles.remove(particle);
      }
      setState(() {});
    });
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: const Text('Burn Like Design',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      backgroundColor: const Color(0xFF171d28),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: CustomPaint(
          painter: ParticlePainter(
            particles: particles,
            particlesToRemove: particlesToRemove,
          ),
        ),
      ),
    );
  }
}

class ParticlePainter extends CustomPainter {
  List<Particle> particles;
  List<Particle> particlesToRemove;

  ParticlePainter({required this.particles, required this.particlesToRemove});

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      particle.setPosition(particle.x * size.width, particle.y * size.height);
      particle.update();
      var paint = Paint()
        ..color = Color.fromARGB(particle.opacity, 255, 255, 255)
        ..strokeWidth = 3.0;
      canvas.drawCircle(Offset(particle.x, particle.y), 13.0, paint);
      if (particle.finished()) particlesToRemove.add(particle);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class Particle {
  double x = 0.5;
  double y = 0.9;
  double vx = doubleInRange(-1, 1);
  double vy = doubleInRange(-5, -1);
  int opacity = 255;

  Particle();

  setPosition(double xPos, double yPos) {
    if (x < 1 && y < 1) {
      x = xPos;
      y = yPos;
    }
  }

  update() {
    x += vx;
    y += vy;
    if (opacity > 0) {
      opacity -= 3;
    }
  }

  bool finished() {
    return opacity <= 0;
  }
}
