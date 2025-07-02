import 'package:flutter/material.dart';
import 'package:rarUI/components/molecules/buttons/base_button.dart';

class RElevatedButton extends RBaseButton {
  const RElevatedButton({
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
  }) : super(text: text);

  @override
  Widget build(BuildContext context) {
    final textColor = onPressed == null ? disabledForegroundColor : foregroundColor;

    final styleButton = ElevatedButton.styleFrom(
        disabledBackgroundColor: disabledBackgroundColor,
        disabledForegroundColor: disabledForegroundColor,
        backgroundColor: backgroundColor,
        foregroundColor: textColor);

    final Widget textWidget = Text(
      text,
      maxLines: maxLines,
      style: TextStyle(color: textColor),
      textAlign: TextAlign.center,
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
        label: textWidget,
        iconAlignment: iconAlignment,
      );
    } else {
      button = ElevatedButton(
        onPressed: onPressed,
        style: styleButton,
        child: textWidget,
      );
    }

    return SizedBox(
      width: expanded ? MediaQuery.sizeOf(context).width : null,
      child: button,
    );
  }
}
