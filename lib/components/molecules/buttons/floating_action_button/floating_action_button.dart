import 'package:flutter/material.dart';
import 'package:rarUI/components/molecules/buttons/base_button.dart';

class RFloatingActionButton extends RBaseButton {
  const RFloatingActionButton({
    super.key,
    super.onPressed,
    super.backgroundColor,
    super.foregroundColor,
    super.disabledBackgroundColor,
    super.disabledForegroundColor,
    super.maxLines,
    super.iconSize,
    super.borderRadius,
    this.child,
  }) : super(text: '');

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final textDefaultColor = (onPressed == null ? disabledForegroundColor : foregroundColor);

    return FloatingActionButton(
      onPressed: onPressed,
      child: child,
      backgroundColor: backgroundColor,
      foregroundColor: textDefaultColor,
      shape: borderRadius != null ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius!)) : null,
    );
  }
}
