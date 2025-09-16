import 'package:flutter/material.dart';
import 'package:rarUI/components/molecules/buttons/base_button.dart';
import 'package:rarUI/utils/constants.dart';

class RTextButton extends RBaseButton {
  const RTextButton({
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
    this.height,
  }) : super(text: text);

  final double? height;

  @override
  Widget build(BuildContext context) {
    final textColor = onPressed == null ? disabledForegroundColor : foregroundColor;
    final double buttonHeight =
        (height != null && height! >= RConstants.minButtonHeight) ? height! : RConstants.minButtonHeight;

    final Widget textWidget = Text(
      text,
      maxLines: maxLines,
      textAlign: TextAlign.center,
    );

    final style = TextButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: textColor,
      shape: borderRadius != null ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius!)) : null,
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
        label: textWidget,
        iconAlignment: iconAlignment,
      );
    } else {
      button = TextButton(
        onPressed: onPressed,
        child: textWidget,
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
