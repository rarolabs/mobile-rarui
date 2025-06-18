import 'dart:math';
import 'package:flutter/material.dart';

class OtpBorderPainter extends CustomPainter {
  final Animation<double> animation;
  final double strokeWidth;
  final Color borderColor;

  OtpBorderPainter({
    required this.animation,
    required this.strokeWidth,
    required this.borderColor,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = borderColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final sweepAngle = 2 * pi * animation.value;

    paint.shader = SweepGradient(
      startAngle: -pi / 2,
      endAngle: 4 * pi / 2,
      colors: [
        // **** 1º quadrante ****
        borderColor.withValues(alpha: 1),
        borderColor.withValues(alpha: 0.60),
        borderColor.withValues(alpha: 0.50),

        // **** 2º quadrante ****
        borderColor.withValues(alpha: 0.50),
        borderColor.withValues(alpha: 0.35),
        borderColor.withValues(alpha: 0.25),

        // **** 3º quadrante ****
        borderColor.withValues(alpha: 0.25),
        borderColor.withValues(alpha: 0.10),
        borderColor.withValues(alpha: 0.05),

        // **** 4º quadrante ****
        borderColor.withValues(alpha: 1),
        borderColor.withValues(alpha: 0.9),
        borderColor.withValues(alpha: 0.75),
      ],
      stops: const [
        0.0,

        // **** 1º quadrante ****
        0.3,
        0.4,

        // **** 2º quadrante ****
        0.5,
        0.55,
        0.6,

        // **** 3º quadrante ****
        0.7,
        0.75,
        0.8,

        // **** 4º quadrante ****
        0.1,
        0.2,
        0.3,
      ],
    ).createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(OtpBorderPainter oldDelegate) => true;
}
