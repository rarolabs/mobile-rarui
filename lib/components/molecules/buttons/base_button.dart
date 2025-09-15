import 'package:flutter/material.dart';

abstract class RBaseButton extends StatelessWidget {
  const RBaseButton({
    required this.text,
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.expanded = false,
    this.iconAlignment = IconAlignment.start,
    this.maxLines,
    this.icon,
    this.iconSize,
    this.textStyle,
    this.borderRadius,
  });

  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;
  final bool expanded;
  final IconAlignment iconAlignment;
  final int? maxLines;
  final IconData? icon;
  final double? iconSize;
  final TextStyle? textStyle;
  final double? borderRadius;

  @override
  Widget build(BuildContext context);
}
