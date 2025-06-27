import 'package:flutter/material.dart';

class RCardFilled extends StatelessWidget {
  const RCardFilled({
    super.key,
    this.size,
    this.color,
    this.shape,
    this.margin,
    this.elevation,
    this.shadowColor,
    this.clipBehavior,
    this.surfaceTintColor,
    this.semanticContainer = true,
    this.borderOnForeground = true,
    this.child,
  });

  final bool borderOnForeground;
  final Size? size;
  final Color? color;
  final double? elevation;
  final EdgeInsetsGeometry? margin;
  final Color? shadowColor;
  final ShapeBorder? shape;
  final Color? surfaceTintColor;
  final Clip? clipBehavior;
  final bool semanticContainer;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size?.width,
      height: size?.height,
      child: Card.filled(
        shape: shape,
        color: color,
        margin: margin,
        elevation: elevation,
        shadowColor: shadowColor,
        clipBehavior: clipBehavior,
        surfaceTintColor: surfaceTintColor,
        semanticContainer: semanticContainer,
        borderOnForeground: borderOnForeground,
        child: child,
      ),
    );
  }
}
