import 'package:flutter/material.dart';
import 'package:rarUI/components/molecules/buttons/base_button.dart';

class RFloatingActionButtonExtended extends RBaseButton {
  const RFloatingActionButtonExtended({
    required String text,
    super.key,
    super.onPressed,
    super.backgroundColor,
    super.foregroundColor,
    super.disabledBackgroundColor,
    super.disabledForegroundColor,
    super.icon,
    super.maxLines,
    super.iconSize,
  }) : super(text: text);

  @override
  Widget build(BuildContext context) {
    final textDefaultColor = (onPressed == null
        ? disabledForegroundColor
        : foregroundColor ?? Colors.white);

    final Widget textWidget = Text(
      text,
      maxLines: maxLines,
      style: TextStyle(color: textDefaultColor),
      textAlign: TextAlign.center,
    );

    late final Widget button;
    if (icon != null) {
      button = FloatingActionButton.extended(
        onPressed: onPressed,
        icon: Icon(
          icon!,
          color: textDefaultColor,
          size: iconSize,
        ),
        label: textWidget,
        backgroundColor: backgroundColor,
        foregroundColor: textDefaultColor,
      );
    } else {
      button = FloatingActionButton.extended(
        onPressed: onPressed,
        label: textWidget,
        backgroundColor: backgroundColor,
        foregroundColor: textDefaultColor,
      );
    }

    return button;
  }
}
