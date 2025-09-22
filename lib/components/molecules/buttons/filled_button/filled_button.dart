import 'package:flutter/material.dart';
import 'package:rarUI/components/molecules/buttons/base_button.dart';
import 'package:rarUI/utils/constants.dart';

class RFilledButton extends RBaseButton {
  const RFilledButton({
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
    super.borderRadius,
    this.height,
  }) : super(child: child);

  final double? height;

  @override
  Widget build(BuildContext context) {
    final textDefaultColor = (onPressed == null
        ? disabledForegroundColor
        : foregroundColor ?? Colors.white);
    final double buttonHeight =
        (height != null && height! >= RConstants.minButtonHeight)
            ? height!
            : RConstants.minButtonHeight;

    final styleButton = FilledButton.styleFrom(
      disabledBackgroundColor: disabledBackgroundColor,
      disabledForegroundColor: disabledForegroundColor,
      backgroundColor: backgroundColor,
      shape: borderRadius != null
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!))
          : null,
    );

    late final Widget button;
    if (icon != null) {
      button = FilledButton.icon(
        onPressed: onPressed,
        style: styleButton,
        icon: Icon(
          icon!,
          color: textDefaultColor,
          size: iconSize,
        ),
        label: child,
        iconAlignment: iconAlignment,
      );
    } else {
      button = FilledButton(
        onPressed: onPressed,
        style: styleButton,
        child: child,
      );
    }

    return SizedBox(
      height: buttonHeight,
      width: expanded ? MediaQuery.sizeOf(context).width : null,
      child: button,
    );
  }
}
