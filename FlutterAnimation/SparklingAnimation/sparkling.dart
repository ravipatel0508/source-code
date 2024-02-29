import 'package:flutter/material.dart';
import 'dart:math' as math;

class SparklingAnimation extends StatefulWidget {
  const SparklingAnimation({Key? key}) : super(key: key);

  @override
  State<SparklingAnimation> createState() => _SparklingState();
}

class _SparklingState extends State<SparklingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  late List<MyStar> myStars;
  List starColors = [
    Colors.blue,
    Colors.grey,
    Colors.blueGrey,
    Colors.deepPurple,
  ];

  @override
  void initState() {
    super.initState();

    myStars = <MyStar>[];
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 250,
        ));
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        for (final star in myStars) {
          star.isEnable = math.Random().nextBool();
        }

        animationController.forward();
      }
    });
    animation = Tween<double>(begin: 0, end: 8).animate(CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutSine));
    animation.addListener(() {
      setState(() {});
    });

    animationController.forward();
  }

  void postFrameCallback(_) {
    if (!mounted) {
      return;
    }
    final size = MediaQuery.of(context).size;
    if (myStars.isEmpty) {
      myStars = List.generate(80, (index) {
        double velocityX = 2 * (math.Random().nextDouble()); //max velocity 2
        double velocityY = 2 * (math.Random().nextDouble());

        velocityX = math.Random().nextBool() ? velocityX : -velocityX;
        velocityY = math.Random().nextBool() ? velocityY : -velocityY;

        return MyStar(
          isEnable: math.Random().nextBool(),
          innerCirclePoints: 4,
          beamLength: math.Random().nextDouble() * (8 - 2) + 2,
          innerOuterRadiusRatio: 0.0,
          angleOffsetToCenterStar: 0,
          center: Offset(size.width * (math.Random().nextDouble()),
              size.height * (math.Random().nextDouble())),
          velocity: Offset(velocityX, velocityY),
          // color: starColors[math.Random().nextInt(4)]
          //     [(math.Random().nextInt(8) + 1) * 100]!,
          color: Colors.grey[math.Random().nextInt(8) * 100 + 100]!,
          // color: Color(0xFF0E1514),
        );
      });
    } else {
      for (final star in myStars) {
        star.center = star.center + star.velocity;
        if (star.isEnable) {
          star.innerOuterRadiusRatio = animation.value;

          if (star.center.dx >= size.width) {
            if (star.velocity.dy > 0) {
              star.velocity = const Offset(-1, 1);
            } else {
              star.velocity = const Offset(-1, -1);
            }

            star.center = Offset(size.width, star.center.dy);
          } else if (star.center.dx <= 0) {
            if (star.velocity.dy > 0) {
              star.velocity = const Offset(1, 1);
            } else {
              star.velocity = const Offset(1, -1);
            }

            star.center = Offset(0, star.center.dy);
          } else if (star.center.dy >= size.height) {
            if (star.velocity.dx > 0) {
              star.velocity = const Offset(1, -1);
            } else {
              star.velocity = const Offset(-1, -1);
            }

            star.center = Offset(star.center.dx, size.height);
          } else if (star.center.dy <= 0) {
            if (star.velocity.dx > 0) {
              star.velocity = const Offset(1, 1);
            } else {
              star.velocity = const Offset(-1, 1);
            }

            star.center = Offset(star.center.dx, 0);
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(postFrameCallback);

    return Scaffold(
      // backgroundColor: const Color(0xFF0B1623),
      backgroundColor: const Color(0xFF0E1514),
      // backgroundColor: const Color(0xFF101415),
      // backgroundColor: const Color(0xFF110904),
      // backgroundColor: const Color(0xFF190B14),
      // backgroundColor: const Color(0xFF262020),
      // backgroundColor: const Color(0xFF),
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Sparkling Animation'),
        centerTitle: true,
        // backgroundColor: const Color(0xFF0B1623),
        backgroundColor: const Color(0xFF0E1514),
        foregroundColor: Colors.white,
      ),
      body: CustomPaint(
          size: MediaQuery.of(context).size,
          painter: StarPainter(
            myStars: myStars,
          )),
    );
  }
}
