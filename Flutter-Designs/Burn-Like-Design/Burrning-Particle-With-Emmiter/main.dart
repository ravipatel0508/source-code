//
// Burning Design with Emitter(onTap) Design
//
// Created by: Ravi Patel
// Instagram: @bugs_fixes (https://www.instagram.com/bugs_fixes)
//
// Creadit: [github.com/JideGuru]

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animations/BurningDesign/utils.dart';

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
      home: const BuningDesignWithEmitter(),
    );
  }
}

class BuningDesignWithEmitter extends StatefulWidget {
  const BuningDesignWithEmitter({Key? key}) : super(key: key);

  @override
  State<BuningDesignWithEmitter> createState() =>
      _BuningDesignWithEmitterState();
}

class _BuningDesignWithEmitterState extends State<BuningDesignWithEmitter>
    with SingleTickerProviderStateMixin {
  late List<Emitter> emitters;
  late Ticker _ticker;

  @override
  void initState() {
    super.initState();
    emitters = List.empty(growable: true);
    _ticker = createTicker((elapsed) {
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
      backgroundColor: const Color(0xFF171D28),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: const Text('Tap to create particles'),
      ),
      body: GestureDetector(
        onTapDown: (details) {
          if (emitters.length < 38) {
            emitters.add(Emitter(position: details.localPosition));
          }
        },
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: CustomPaint(
            painter: _ParticlePainter(
              emitters: emitters,
            ),
          ),
        ),
      ),
    );
  }
}

class _ParticlePainter extends CustomPainter {
  final List<Emitter> emitters;

  _ParticlePainter({
    required this.emitters,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (var emitter in emitters) {
      emitter.update();
      for (var particle in emitter.particles) {
        particle.update();
        canvas.drawCircle(
          Offset(particle.x, particle.y),
          10,
          Paint()
            ..color = Color.fromARGB(
              particle.alpha,
              255,
              255,
              255,
            ),
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class Particle {
  double x, y;
  double vx = doubleInRange(-1, 1);
  double vy = doubleInRange(5, 1);
  int alpha = 255;

  Particle({
    required this.x,
    required this.y,
  });

  update() {
    x += vx;
    y += vy;
    alpha -= 5;
  }

  bool finished() {
    return alpha <= 0;
  }
}

class Emitter {
  final Offset position;
  List<Particle> particles;
  List<Particle> particlesToRemove = List.empty(growable: true);

  Emitter({required this.position})
      : particles = List.generate(
          1,
          (index) => Particle(
            x: position.dx,
            y: position.dy,
          ),
        );

  update() {
    particles.add(Particle(x: position.dx, y: position.dy));
    for (var particle in particles) {
      if (particle.finished()) particlesToRemove.add(particle);
    }

    for (var particle in particlesToRemove) {
      particles.remove(particle);
    }
  }
}
