import 'package:flutter/material.dart';
import 'package:rarUI/components/molecules/buttons/base_button.dart';
import 'package:rarUI/utils/constants.dart';

class RFilledButtonTonal extends RBaseButton {
  const RFilledButtonTonal({
    required String text,
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
  }) : super(text: text);

  final double? height;

  @override
  Widget build(BuildContext context) {
    final textDefaultColor = (onPressed == null ? disabledForegroundColor : foregroundColor ?? Colors.white);
    final double buttonHeight =
        (height != null && height! >= RConstants.minButtonHeight) ? height! : RConstants.minButtonHeight;

    final styleButton = FilledButton.styleFrom(
      disabledBackgroundColor: disabledBackgroundColor,
      disabledForegroundColor: disabledForegroundColor,
      backgroundColor: backgroundColor,
      shape: borderRadius != null ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius!)) : null,
    );

    final Widget textWidget = Text(
      text,
      maxLines: maxLines,
      style: TextStyle(color: textDefaultColor),
      textAlign: TextAlign.center,
    );

    late final Widget button;
    if (icon != null) {
      button = FilledButton.tonalIcon(
        onPressed: onPressed,
        style: styleButton,
        icon: Icon(
          icon!,
          color: textDefaultColor,
          size: iconSize,
        ),
        label: textWidget,
        iconAlignment: iconAlignment,
      );
    } else {
      button = FilledButton.tonal(
        onPressed: onPressed,
        style: styleButton,
        child: textWidget,
      );
    }

    return SizedBox(
      height: buttonHeight,
      width: expanded ? MediaQuery.sizeOf(context).width : null,
      child: button,
    );
  }
}
