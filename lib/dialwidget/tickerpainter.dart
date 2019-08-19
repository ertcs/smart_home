import 'package:flutter/material.dart';
import 'dart:math';


class TickPainter extends CustomPainter {
  final LONG_TICK = 15.0;
  final SHORT_TICK = 5.0;
  final tickCount;
  final tickPerSection;
  final tickInset;
  final tickPaint;
  final currentTem;

  TickPainter({
    this.tickCount = 31,
    this.tickPerSection = 5,
    this.tickInset = 0.0,
    this.currentTem,
  }) : tickPaint = new Paint() {
    tickPaint.strokeWidth = 1.5;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;

    canvas.translate(size.width / 2, size.height / 2);

    canvas.save();

    for (int i = 0; i < tickCount; i++) {
      currentTem>=i?tickPaint.color = Colors.blueAccent:tickPaint.color = Colors.deepOrange;
      final ticklenght = i % tickPerSection == 0 ? LONG_TICK : SHORT_TICK;
      canvas.drawLine(
        Offset(0.0, radius),
        Offset(0.0, radius + ticklenght),
        tickPaint,
      );

      canvas.rotate((2 * pi / tickCount) / 2);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}