import 'package:flutter/material.dart';

class RLinearProgressIndicator extends StatelessWidget {
  const RLinearProgressIndicator({
    super.key,
    this.semanticsLabel,
    this.semanticsValue,
    this.valueColor,
    this.minHeight,
    this.stopIndicatorRadius,
    this.trackGap,
    this.backgroundColor,
    this.stopIndicatorColor,
    this.value,
    this.color,
    this.borderRadius,
  });

  final String? semanticsLabel;
  final String? semanticsValue;
  final Animation<Color?>? valueColor;
  final double? minHeight;
  final double? stopIndicatorRadius;
  final double? trackGap;
  final Color? backgroundColor;
  final Color? stopIndicatorColor;
  final double? value;
  final Color? color;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      key: key,
      value: value,
      color: color,
      trackGap: trackGap,
      minHeight: minHeight,
      valueColor: valueColor,
      semanticsLabel: semanticsLabel,
      semanticsValue: semanticsValue,
      backgroundColor: backgroundColor,
      stopIndicatorColor: stopIndicatorColor,
      stopIndicatorRadius: stopIndicatorRadius,
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
    );
  }
}
