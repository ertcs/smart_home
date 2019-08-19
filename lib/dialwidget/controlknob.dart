import 'package:flutter/material.dart';
import 'dart:math';
import 'package:smart_home/dialwidget/circletickpainter.dart';

class ControlKnob extends StatelessWidget {
  final double knobReading;

  ControlKnob(this.knobReading);

  @override
  Widget build(BuildContext context) {
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Transform(
      transform:Matrix4.rotationZ(2*pi*knobReading),
      alignment: Alignment.center,
      child: Padding(
        padding: isPortrait?const EdgeInsets.all(70.0):const EdgeInsets.all(30.0),
        child: Material(
          color: Colors.blueAccent,
          elevation: 10,
          shape: CircleBorder(),
          shadowColor: Colors.blueAccent,
          child: Transform.rotate(
//            (2*pi)*0.75
            angle: (2*pi)*0.75,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent,
                      blurRadius: 1.0,
                      spreadRadius: 1.0,
                      offset: const Offset(0.0, 1.0),
                    )
                  ]),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: isPortrait?const EdgeInsets.all(12):const EdgeInsets.all(47.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration:
                      BoxDecoration(shape: BoxShape.circle),
                      child: Padding(
                        padding: isPortrait?const EdgeInsets.all(20.0):const EdgeInsets.all(45.0),
                        child: CustomPaint(
                          painter: AllTickPainter(),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 10,
                    right: 10,
                    bottom: 20,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        border: Border.all(color: Colors.white)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blueAccent),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}