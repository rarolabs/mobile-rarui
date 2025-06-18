import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../utils/interfaces/behaviour.dart';
import '../../../../utils/interfaces/style.dart';
import '../../../../utils/mixin/component.dart';
import 'circular_progress_specs.dart';
import 'circular_progress_style.dart';

class CircularProgressComponent extends StatelessWidget
    with Component<CircularProgressStyle, CircularProgressSharedStyle> {
  /// Comportamento do componente
  final Behaviour behaviour;

  /// Cor do circular progress
  final CircularProgressStyleSet styles;

  /// Texto de acessibilidade
  final String? labelSemantics;

  /// Ação de acessibilidade ao interagir com o componente
  final String? hintSemantics;

  const CircularProgressComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    this.labelSemantics,
    this.hintSemantics,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<CircularProgressStyle, CircularProgressSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenRegular(
    CircularProgressStyle style,
    CircularProgressSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _BasicCircularProgressIndicator(
      style: style,
      labelSemantics: labelSemantics,
      hintSemantics: hintSemantics,
    );
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.processing: Behaviour.regular,
        Behaviour.error: Behaviour.regular,
        Behaviour.disabled: Behaviour.regular,
        Behaviour.loading: Behaviour.regular,
      };
}

class _BasicCircularProgressIndicator extends StatefulWidget {
  final CircularProgressStyle style;
  final String? labelSemantics;
  final String? hintSemantics;

  const _BasicCircularProgressIndicator({
    required this.style,
    this.labelSemantics,
    this.hintSemantics,
  });

  @override
  State<_BasicCircularProgressIndicator> createState() => _BasicCircularProgressIndicatorState();
}

class _BasicCircularProgressIndicatorState extends State<_BasicCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1))..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const tweenBegin = 0.0;
    const tweenEnd = 1.0;

    return Semantics(
      label: widget.labelSemantics,
      hint: widget.hintSemantics,
      child: RotationTransition(
        turns: Tween(begin: tweenBegin, end: tweenEnd).animate(_controller),
        child: CustomPaint(
          size: Size.fromRadius(widget.style.radius),
          painter: _GradientCircularProgressPainter(
            radius: widget.style.radius,
            gradientColors: [
              widget.style.color.withValues(alpha: 0),
              widget.style.color,
            ],
            strokeWidth: widget.style.strokeWidth,
          ),
        ),
      ),
    );
  }
}

class _GradientCircularProgressPainter extends CustomPainter {
  _GradientCircularProgressPainter({
    required this.radius,
    required this.gradientColors,
    required this.strokeWidth,
  });

  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    size = Size.fromRadius(radius);
    final offset = strokeWidth / 2;
    final rect = Offset(offset, offset) & Size(size.width - strokeWidth, size.height - strokeWidth);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    paint.shader = SweepGradient(colors: gradientColors, startAngle: 0, endAngle: 2 * pi).createShader(rect);
    canvas.drawArc(rect, 0, 2 * pi, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
