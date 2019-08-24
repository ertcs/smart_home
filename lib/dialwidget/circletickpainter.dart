import 'package:flutter/material.dart';
import 'dart:math';

class AllTickPainter extends CustomPainter {
  var tickPaint = new Paint();
  var circlePaint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    tickPaint.strokeWidth = 1;
    tickPaint.color = Colors.grey;
    tickPaint.strokeCap = StrokeCap.round;
    double length=10;
    double rightLength=-9.5;
    double strokewidth =1;
    double strokewidthright = 0;

    circlePaint = new Paint()
      ..color = Colors.blueAccent
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final radius = size.width / 2;
    canvas.translate(size.width / 2, size.height / 2);
    for (int i = 0; i < 100; i++) {
      if(i>7&&i<51){
        length = length-0.5;

        strokewidth = strokewidth-(1/44);
        tickPaint.strokeWidth = strokewidth;

      }else if(i>50&&i<94){
        rightLength = rightLength+0.5;
        length = rightLength;

        strokewidthright = strokewidthright+(1/44);
        tickPaint.strokeWidth = strokewidthright;
      }else{
        tickPaint.strokeWidth =1;
        length =12;
      }



      canvas.drawLine(
        Offset(0.0, radius + 8),
        Offset(0.0, radius-length),
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
