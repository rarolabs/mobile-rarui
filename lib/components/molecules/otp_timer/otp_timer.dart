import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rarui/components/atoms/label/label.dart';

class ROtpTimer extends StatefulWidget {
  final Duration duration;
  final double strokeWidth;
  final double? width;
  final double? height;
  final String otpCodeLabel;
  final String? hintSemantics;
  final String? labelSemantics;
  final Color borderColor;
  final String Function() onComplete;
  final TextStyle? textStyle;

  const ROtpTimer({
    super.key,
    required this.duration,
    required this.strokeWidth,
    this.height,
    this.width,
    required this.borderColor,
    required this.otpCodeLabel,
    required this.onComplete,
    this.hintSemantics,
    this.labelSemantics,
    this.textStyle,
  });

  @override
  State<ROtpTimer> createState() => _ROtpTimerState();
}

class _ROtpTimerState extends State<ROtpTimer> with TickerProviderStateMixin {
  late AnimationController _controller;
  late String _newOtpCodeLabel;

  @override
  void initState() {
    super.initState();
    _newOtpCodeLabel = widget.otpCodeLabel;
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _controller.forward();
    _controller.addListener(() {
      if (_controller.isCompleted) {
        _newOtpCodeLabel = widget.onComplete.call();
        setState(() {
          _controller.reset();
          _controller.forward();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: LayoutBuilder(
        builder: (_, constraints) {
          final size = Size.square(constraints.biggest.shortestSide);

          return SizedBox(
            width: size.width,
            height: size.height,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: size,
                  painter: OtpBorderPainter(
                    animation: _controller,
                    strokeWidth: widget.strokeWidth,
                    borderColor: widget.borderColor,
                  ),
                ),
                RLabel(text: _newOtpCodeLabel, style: widget.textStyle),
              ],
            ),
          );
        },
      ),
    );
  }
}

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

    final arcRect = Rect.fromCircle(center: center, radius: radius);
    canvas.drawArc(arcRect, -pi / 2, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(OtpBorderPainter oldDelegate) => true;
}
