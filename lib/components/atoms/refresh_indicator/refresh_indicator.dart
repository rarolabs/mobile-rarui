import 'package:flutter/material.dart';

class RRefreshIndicator extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;
  final Color? color;
  final Color? backgroundColor;
  final double edgeOffset;
  final double strokeWidth;
  final String? semanticsLabel;
  final String? semanticsValue;

  const RRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
    this.color,
    this.backgroundColor,
    this.strokeWidth = RefreshProgressIndicator.defaultStrokeWidth,
    this.edgeOffset = 0,
    this.semanticsLabel,
    this.semanticsValue,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RefreshIndicator(
      key: key,
      onRefresh: onRefresh,
      color: color ?? theme.colorScheme.primary,
      backgroundColor: backgroundColor ?? theme.scaffoldBackgroundColor,
      edgeOffset: edgeOffset,
      semanticsLabel: semanticsLabel,
      semanticsValue: semanticsValue,
      strokeWidth: strokeWidth,
      child: child,
    );
  }
}
