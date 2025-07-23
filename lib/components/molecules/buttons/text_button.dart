import 'package:flutter/material.dart';
import 'package:rarUI/components/molecules/buttons/base_button.dart';

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
  }) : super(text: text);

  @override
  Widget build(BuildContext context) {
    final textColor =
        onPressed == null ? disabledForegroundColor : foregroundColor;

    final Widget textWidget = Text(
      text,
      maxLines: maxLines,
      textAlign: TextAlign.center,
    );

    final style = TextButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: textColor,
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
      width: expanded ? MediaQuery.sizeOf(context).width : null,
      child: button,
    );
  }
}
