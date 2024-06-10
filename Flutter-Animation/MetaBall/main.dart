import 'dart:math';

import 'package:flutter/material.dart';

class MetaballShapesPage extends StatefulWidget {
  static const String routeName = '/metaball-shapes';
  const MetaballShapesPage({super.key});

  @override
  State<MetaballShapesPage> createState() => _MetaballShapesPageState();
}

class _MetaballShapesPageState extends State<MetaballShapesPage> {
  List<MetaballCircle> circles = [];
  List<MetaballCircle> circles2 = [];

  final GlobalObjectKey key = const GlobalObjectKey('painterkey');
  final GlobalObjectKey key2 = const GlobalObjectKey('painterkey2');

  Offset dragPosition1 = Offset.zero;
  Offset dragPosition2 = Offset.zero;

  @override
  void initState() {
    super.initState();

    circles = [
      MetaballCircle(
          position: const Offset(20.0, 0.0),
          radius: 80.0,
          color: Colors.green[300]!
          // color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          ),
      MetaballCircle(
          position: const Offset(0.0, -240.0),
          radius: 80.0,
          color: Colors.red[300]!
          // color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          ),
      MetaballCircle(
        position: const Offset(-60.0, 240.0),
        radius: 80.0,
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      ),
    ];
    circles2 = [
      MetaballCircle(
          position: const Offset(40.0, 0.0),
          radius: 80.0,
          color: Colors.green[300]!
          // color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          ),
      MetaballCircle(
          position: const Offset(0.0, 140.0),
          radius: 80.0,
          color: Colors.red[300]!
          // color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          ),
      MetaballCircle(
        position: const Offset(-80.0, 340.0),
        radius: 80.0,
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      ),
    ];
  }

  void onPanStart(DragStartDetails details) {
    final obj = key.currentContext?.findRenderObject() as RenderBox;

    final canvasSize = obj.size;
    setState(() {
      dragPosition1 = details.globalPosition;
    });

    List<MetaballCircle> newCircles = [];

    for (var circle in circles) {
      bool _tapped = circle.isTapped(canvasSize, dragPosition1);

      newCircles.add(
        MetaballCircle(
          position: circle.position,
          radius: circle.radius,
          color: circle.color,
          isSelected: _tapped,
        ),
      );
    }

    setState(() {
      circles = newCircles;
    });
  }

  void onPanUpdate(DragUpdateDetails details) {
    setState(() {
      dragPosition1 = details.globalPosition;
    });

    List<MetaballCircle> newCircles = [];

    for (var circle in circles) {
      newCircles.add(
        MetaballCircle(
          position: circle.position +
              (circle.isSelected ? details.delta : Offset.zero),
          radius: circle.radius,
          isSelected: circle.isSelected,
          color: circle.color,
        ),
      );
    }

    setState(() {
      circles = newCircles;
    });
  }

  void onPanEnd(DragEndDetails details) {
    List<MetaballCircle> newCircles = [];

    for (var circle in circles) {
      newCircles.add(
        MetaballCircle(
          position: circle.position,
          radius: circle.radius,
          isSelected: false,
          color: circle.color,
        ),
      );
    }

    setState(() {
      circles = newCircles;
    });
  }

  void onPanStart2(DragStartDetails details) {
    final obj = key2.currentContext?.findRenderObject() as RenderBox;

    final canvasSize = obj.size;
    setState(() {
      dragPosition1 = details.globalPosition;
    });

    List<MetaballCircle> newCircles = [];

    for (var circle in circles2) {
      bool _tapped = circle.isTapped(canvasSize, dragPosition1);

      newCircles.add(
        MetaballCircle(
          position: circle.position,
          radius: circle.radius,
          color: circle.color,
          isSelected: _tapped,
        ),
      );
    }

    setState(() {
      circles2 = newCircles;
    });
  }

  void onPanUpdate2(DragUpdateDetails details) {
    setState(() {
      dragPosition1 = details.globalPosition;
    });

    List<MetaballCircle> newCircles = [];

    for (var circle in circles2) {
      newCircles.add(
        MetaballCircle(
          position: circle.position +
              (circle.isSelected ? details.delta : Offset.zero),
          radius: circle.radius,
          isSelected: circle.isSelected,
          color: circle.color,
        ),
      );
    }

    setState(() {
      circles2 = newCircles;
    });
  }

  void onPanEnd2(DragEndDetails details) {
    List<MetaballCircle> newCircles = [];

    for (var circle in circles2) {
      newCircles.add(
        MetaballCircle(
          position: circle.position,
          radius: circle.radius,
          isSelected: false,
          color: circle.color,
        ),
      );
    }

    setState(() {
      circles2 = newCircles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Metaball Shapes',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // Expanded(
          //   child: GestureDetector(
          //     onPanStart: onPanStart,
          //     onPanUpdate: onPanUpdate,
          //     onPanEnd: onPanEnd,
          // child: ColorFiltered(
          //   colorFilter: const ColorFilter.matrix(
          //     <double>[
          //       1,
          //       0,
          //       0,
          //       0,
          //       0,
          //       0,
          //       1,
          //       0,
          //       0,
          //       0,
          //       0,
          //       0,
          //       1,
          //       0,
          //       0,
          //       0,
          //       0,
          //       0,
          //       60,
          //       -6000,
          //     ],
          //   ),
          //   child: CustomPaint(
          //     key: key,
          //     painter: MetaballShapesPainter(
          //       circles: circles,
          //     ),
          //     size: Size.infinite,
          //   ),
          // ),
          //   ),
          // ),
          Expanded(
            child: GestureDetector(
              onPanStart: onPanStart2,
              onPanUpdate: onPanUpdate2,
              onPanEnd: onPanEnd2,
              child: CustomPaint(
                key: key2,
                painter: MetaballShapesPainterV2(
                  circles: circles2,
                ),
                size: Size.infinite,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MetaballShapesPainter extends CustomPainter {
  final List<MetaballCircle> circles;

  MetaballShapesPainter({
    required this.circles,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (var circle in circles) {
      canvas.drawCircle(
        size.center(circle.position),
        circle.radius,
        Paint()
          ..color = circle.color
          ..maskFilter = const MaskFilter.blur(
            BlurStyle.normal,
            30.0,
          ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MetaballShapesPainterV2 extends CustomPainter {
  final List<MetaballCircle> circles;

  MetaballShapesPainterV2({
    required this.circles,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (var circle in circles) {
      canvas.drawCircle(
        size.center(circle.position),
        circle.radius,
        Paint()
          // ..color = Colors.green[300]!
          ..color = Colors.black
          ..maskFilter = const MaskFilter.blur(
            BlurStyle.normal,
            30.0,
          ),
      );
    }

    canvas.drawPaint(
      Paint()
        ..color = const Color(0xFF808080)
        ..blendMode = BlendMode.colorDodge,
    );

    canvas.drawPaint(
      Paint()
        ..color = const Color(0xFF000000)
        ..blendMode = BlendMode.colorBurn,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MetaballCircle {
  final Offset position;
  final double radius;
  final bool isSelected;
  final Color color;

  const MetaballCircle({
    required this.position,
    required this.radius,
    this.isSelected = false,
    this.color = Colors.red,
  });

  bool isTapped(Size canvasSize, Offset tappedPosition) {
    return Rect.fromCircle(center: canvasSize.center(position), radius: radius)
        .contains(tappedPosition);
  }
}
