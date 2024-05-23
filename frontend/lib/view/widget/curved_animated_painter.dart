import 'dart:math';

import 'package:flutter/material.dart';

class CurvedAnimatedPainter extends CustomPainter {
  const CurvedAnimatedPainter(
      {required this.animationValue, required this.color, this.free = .05});
  final double animationValue;
  final Color color;
  final double free;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color
      ..strokeWidth = 15;

    Path path = Path();

    path.moveTo(0, size.height);
    path.lineTo(0, size.height * .6);

    for (double i = 0; i < size.width; i++) {
      double x = i;
      double y = size.height * free +
          animationValue * 50 * sin((i / size.width) * 2 * pi);

      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
