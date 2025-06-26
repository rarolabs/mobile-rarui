import 'package:flutter/material.dart';

class RCircularProgressIndicator extends StatelessWidget {
  final double? strokeWidth;
  final Color? color;
  final Color? backgroundColor;
  final double? value;
  final String? semanticsLabel;
  final String? semanticsValue;
  final double? trackGap;
  final EdgeInsetsGeometry? padding;
  final StrokeCap? strokeCap;
  final double? strokeAlign;
  final Animation<Color?>? valueColor;
  final BoxConstraints? constraints;

  const RCircularProgressIndicator({
    super.key,
    this.strokeWidth,
    this.color,
    this.backgroundColor,
    this.value,
    this.semanticsLabel,
    this.semanticsValue,
    this.trackGap,
    this.padding,
    this.strokeCap,
    this.strokeAlign,
    this.valueColor,
    this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      semanticsLabel: semanticsLabel,
      semanticsValue: semanticsValue,
      strokeWidth: strokeWidth,
      backgroundColor: backgroundColor,
      color: color,
      strokeCap: strokeCap,
      strokeAlign: strokeAlign,
      value: value,
      constraints: constraints,
      trackGap: trackGap,
      padding: padding,
      valueColor: valueColor,
    );
  }
}
