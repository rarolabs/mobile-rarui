import 'package:flutter/material.dart';
import 'package:rarui/components/molecules/buttons/base_button.dart';
import 'package:rarui/utils/constants.dart';

class RTextButton extends RBaseButton {
  const RTextButton({
    required Widget child,
    super.key,
    super.onPressed,
    super.backgroundColor,
    super.foregroundColor,
    super.disabledBackgroundColor,
    super.disabledForegroundColor,
    super.icon,
    super.expanded = false,
    super.iconAlignment = IconAlignment.start,
    super.maxLines,
    super.iconSize,
    this.height,
  }) : super(child: child);

  final double? height;

  @override
  Widget build(BuildContext context) {
    final textColor =
        onPressed == null ? disabledForegroundColor : foregroundColor;
    final double buttonHeight =
        (height != null && height! >= RConstants.minButtonHeight)
            ? height!
            : RConstants.minButtonHeight;

    final style = TextButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: textColor,
      shape: borderRadius != null
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!))
          : null,
    );
    late final Widget button;

    if (icon != null) {
      button = TextButton.icon(
        onPressed: onPressed,
        style: style,
        icon: Icon(
          icon!,
          color: textColor,
          size: iconSize,
        ),
        label: child,
        iconAlignment: iconAlignment,
      );
    } else {
      button = TextButton(
        onPressed: onPressed,
        child: child,
        style: style,
      );
    }

    return SizedBox(
      height: buttonHeight,
      width: expanded ? MediaQuery.sizeOf(context).width : null,
      child: button,
    );
  }
}
