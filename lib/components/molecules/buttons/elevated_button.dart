import 'package:flutter/material.dart';
import 'package:rarUI/components/molecules/buttons/base_button.dart';
import 'package:rarUI/utils/constants.dart';

class RElevatedButton extends RBaseButton {
  const RElevatedButton({
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
    super.textStyle,
    super.borderRadius,
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

    final styleButton = ElevatedButton.styleFrom(
      disabledBackgroundColor: disabledBackgroundColor,
      disabledForegroundColor: disabledForegroundColor,
      backgroundColor: backgroundColor,
      foregroundColor: textColor,
      textStyle: textStyle,
      shape: borderRadius != null
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!))
          : null,
    );

    late final Widget button;
    if (icon != null) {
      button = ElevatedButton.icon(
        onPressed: onPressed,
        style: styleButton,
        icon: Icon(
          icon!,
          color: textColor,
          size: iconSize,
        ),
        label: child,
        iconAlignment: iconAlignment,
      );
    } else {
      button = ElevatedButton(
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
