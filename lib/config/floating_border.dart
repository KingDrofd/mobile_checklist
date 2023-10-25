import 'package:flutter/material.dart';

class FloatingBorder extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Path number 1

    paint.color = Color.fromARGB(255, 236, 129, 255);
    path = Path();
    path.lineTo(size.width * 0.02, size.height * 0.26);
    path.cubicTo(size.width * 0.02, size.height * 0.26, size.width * 0.52,
        size.height * 0.01, size.width * 0.52, size.height * 0.01);
    path.cubicTo(size.width * 0.52, size.height * 0.01, size.width * 1.02,
        size.height * 0.26, size.width * 1.02, size.height * 0.26);
    path.cubicTo(size.width * 1.02, size.height * 0.26, size.width * 1.02,
        size.height * 0.76, size.width * 1.02, size.height * 0.76);
    path.cubicTo(size.width * 1.02, size.height * 0.76, size.width * 0.52,
        size.height, size.width * 0.52, size.height);
    path.cubicTo(size.width * 0.52, size.height, size.width * 0.02,
        size.height * 0.76, size.width * 0.02, size.height * 0.76);
    path.cubicTo(size.width * 0.02, size.height * 0.76, size.width * 0.02,
        size.height * 0.26, size.width * 0.02, size.height * 0.26);
    path.cubicTo(size.width * 0.02, size.height * 0.26, size.width * 0.02,
        size.height * 0.26, size.width * 0.02, size.height * 0.26);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
