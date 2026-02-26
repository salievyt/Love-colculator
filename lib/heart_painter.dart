import 'dart:ui';

import 'package:flutter/material.dart';

class HeartPainter extends CustomPainter {
  final double fillPercent;

  HeartPainter({required this.fillPercent});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paintBorder = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final paintFill = Paint()
      ..shader = const LinearGradient(
        colors: [Colors.pinkAccent, Colors.red],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final width = size.width;
    final height = size.height;

    path.moveTo(width / 2, height * 0.8);
    path.cubicTo(
      width * 1.1,
      height * 0.45,
      width * 0.8,
      height * 0.05,
      width / 2,
      height * 0.3,
    );
    path.cubicTo(
      width * 0.2,
      height * 0.05,
      -width * 0.1,
      height * 0.45,
      width / 2,
      height * 0.8,
    );

    // Заливка
    canvas.save();
    canvas.clipPath(path);
    canvas.drawRect(
      Rect.fromLTWH(
        0,
        height * (1 - fillPercent),
        width,
        height * fillPercent,
      ),
      paintFill,
    );
    canvas.restore();

    // Контур
    canvas.drawPath(path, paintBorder);
  }

  @override
  bool shouldRepaint(covariant HeartPainter oldDelegate) {
    return oldDelegate.fillPercent != fillPercent;
  }
}