import 'package:flutter/material.dart';

abstract class RBaseButton extends StatelessWidget {
  const RBaseButton({
    required this.child,
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.expanded = false,
    this.borderRadius,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;
  final bool expanded;
  final double? borderRadius;

  @override
  Widget build(BuildContext context);
}
