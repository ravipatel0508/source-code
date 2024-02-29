import 'package:flutter/material.dart';

class MyStar {
  bool isEnable;
  int innerCirclePoints; //how many edges you need?
  double beamLength;
  double
      innerOuterRadiusRatio; // outter circle is x2 the inner // set star sharpness/chubbiness
  double angleOffsetToCenterStar;
  Offset center;
  Offset velocity;
  Color color;

  MyStar(
      {required this.isEnable,
      required this.innerCirclePoints,
      required this.beamLength,
      required this.innerOuterRadiusRatio,
      required this.angleOffsetToCenterStar,
      required this.center,
      required this.velocity,
      required this.color});
}
