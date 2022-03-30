import 'package:flutter/material.dart';

class Drawhorizontalline extends CustomPainter {
  Paint _paint = Paint();
  bool reverse;

  Drawhorizontalline(this.reverse) {
    _paint = Paint()
      ..color = const Color(0xff3d4154)
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (reverse) {
      canvas.drawLine(const Offset(30.0, 0.0), const Offset(5.0, 0.0), _paint);
    } else {
      canvas.drawLine(const Offset(10.0, 0.0), const Offset(250.0, 0.0), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
