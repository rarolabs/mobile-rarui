import 'package:flutter/material.dart';

class RIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final double? size;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? disabledColor;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;

  const RIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.size,
    this.iconColor,
    this.backgroundColor,
    this.disabledColor,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        size: size,
        color: iconColor,
      ),
      onPressed: onPressed,
      disabledColor: disabledColor,
      padding: padding,
      style: IconButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: padding,
          splashFactory: InkRipple.splashFactory,
          shape:
              borderRadius != null ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius!)) : null),
    );
  }
}
