import 'package:flutter/material.dart';
import 'dart:math' as math;

class StarPainter extends CustomPainter {
  List<MyStar> myStars;

  StarPainter({required this.myStars});

  List<Map> calcStarPoints(
      {required double centerX,
      required double centerY,
      required int innerCirclePoints,
      required double innerRadius,
      required double outerRadius,
      required double angleOffsetToCenterStar}) {
    final angle = ((math.pi) / innerCirclePoints);

    final totalPoints = innerCirclePoints * 2; // 10 in a 5-points star
    List<Map> points = [];
    for (int i = 0; i < totalPoints; i++) {
      bool isEvenIndex = i % 2 == 0;
      final r = isEvenIndex ? outerRadius : innerRadius;

      var currY = centerY + math.cos(i * angle + angleOffsetToCenterStar) * r;
      var currX = centerX + math.sin(i * angle + angleOffsetToCenterStar) * r;
      points.add({'x': currX, 'y': currY});
    }
    return points;
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (final myStar in myStars) {
      final innerRadius = myStar.beamLength / myStar.innerCirclePoints;
      final outerRadius = innerRadius * myStar.innerOuterRadiusRatio;

      List<Map> points = calcStarPoints(
          centerX: myStar.center.dx,
          centerY: myStar.center.dy,
          innerCirclePoints: myStar.innerCirclePoints,
          innerRadius: innerRadius,
          outerRadius: outerRadius,
          angleOffsetToCenterStar: myStar.angleOffsetToCenterStar);
      var star = Path()..moveTo(points[0]['x'], points[0]['y']);
      for (var point in points) {
        star.lineTo(point['x'], point['y']);
      }

      canvas.drawPath(
        star,
        Paint()..color = myStar.color,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
