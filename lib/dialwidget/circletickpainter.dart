import 'package:flutter/material.dart';
import 'dart:math';

class AllTickPainter extends CustomPainter {
  var tickPaint = new Paint();

  @override
  void paint(Canvas canvas, Size size) {
    tickPaint.strokeWidth = 1;
    tickPaint.color = Colors.grey;

    final radius = size.width / 2;
    canvas.translate(size.width / 2, size.height / 2);
    for (int i = 0; i < 100; i++) {
      canvas.drawLine(
        Offset(0.0, radius+8),
        Offset(0.0, radius - 12),
        tickPaint,
      );

      canvas.rotate((2 * pi / 100));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}