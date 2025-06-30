import 'package:flutter/material.dart';

class RDrawer extends StatelessWidget {
  const RDrawer({
    super.key,
    this.backgroundColor,
    this.elevation,
    this.width,
    this.shadowColor,
    this.shape,
    this.clipBehavior,
    this.semanticLabel,
    this.surfaceTintColor,
    this.child,
  });

  final Color? backgroundColor;
  final double? elevation;
  final double? width;
  final Color? shadowColor;
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final String? semanticLabel;
  final Color? surfaceTintColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: key,
      shape: shape,
      width: width,
      elevation: elevation,
      shadowColor: shadowColor,
      clipBehavior: clipBehavior,
      semanticLabel: semanticLabel,
      backgroundColor: backgroundColor,
      surfaceTintColor: surfaceTintColor,
      child: child,
    );
  }
}
