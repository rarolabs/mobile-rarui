import 'package:flutter/material.dart';
import 'package:rarui/components/molecules/buttons/base_button.dart';

class RFloatingActionButtonExtended extends RBaseButton {
  const RFloatingActionButtonExtended({
    required Widget child,
    super.key,
    super.onPressed,
    super.backgroundColor,
    super.foregroundColor,
    super.disabledBackgroundColor,
    super.disabledForegroundColor,
    super.borderRadius,
  }) : super(child: child);

  @override
  Widget build(BuildContext context) {
    final textDefaultColor = (onPressed == null
        ? disabledForegroundColor
        : foregroundColor ?? Colors.white);

    return FloatingActionButton.extended(
      onPressed: onPressed,
      label: child,
      backgroundColor: backgroundColor,
      foregroundColor: textDefaultColor,
    );
  }
}
