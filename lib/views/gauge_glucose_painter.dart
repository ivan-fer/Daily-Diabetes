import 'package:flutter/material.dart';
import 'dart:math';

import '../constants.dart';

class GaugeGlucosePainter extends CustomPainter {
  final int countGood; // Normal
  final int countUps; // Ups
  final int countBad;

  GaugeGlucosePainter(this.countGood, this.countUps, this.countBad);

  @override
  void paint(Canvas canvas, Size size) {
    int totalCounts = countGood + countUps + countBad;
    double ratioGood = countGood / totalCounts;
    double ratioUps = countUps / totalCounts;
    double ratioBad = countBad / totalCounts;

    final radius = 90.0; //min(size.width, size.height) / 2;
    final center = Offset(size.width / 2, size.height / 2 + 50);
    final angGood = -pi;
    final angUps = -pi * (1 - ratioGood);
    final angBad = -pi * (1 - ratioGood - ratioUps);

    if (totalCounts > 0) {
      _drawArc(canvas, Colors.teal, center, radius, angGood, ratioGood);
      _drawArc(canvas, Colors.orangeAccent, center, radius, angUps, ratioUps);
      _drawArc(canvas, Colors.red, center, radius, angBad, ratioBad);
    } else {
      _drawArc(canvas, primaryColor.withOpacity(.4), center, radius, pi, 1);
    }

    // TOTAL DE CASOS ==========================================================
    final textTotal = TextPainter(
        text: TextSpan(
          text: 'total:',
          style: TextStyle(fontSize: 20, color: Colors.blueGrey.withAlpha(200)),
        ),
        textDirection: TextDirection.ltr);
    textTotal.layout();
    textTotal.paint(
        canvas, Offset(center.dx - textTotal.width / 2, center.dy - 62));
    final textNum = TextPainter(
        text: TextSpan(
          text: '$totalCounts',
          style: TextStyle(fontSize: 42, color: Colors.blueGrey),
        ),
        textDirection: TextDirection.ltr);
    textNum.layout();
    textNum.paint(
        canvas, Offset(center.dx - textNum.width / 2, center.dy - 44));
    // =========================================================================
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  void _drawArc(Canvas canvas, Color color, Offset center, double radius,
      double anglePos, double ratio) {
    final pGood = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 29
      ..color = color;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), anglePos,
        pi * ratio, false, pGood);
  }
}
