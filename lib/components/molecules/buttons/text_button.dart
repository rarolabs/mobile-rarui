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
    super.expanded = false,
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

    return SizedBox(
      height: buttonHeight,
      width: expanded ? MediaQuery.sizeOf(context).width : null,
      child: TextButton(
        onPressed: onPressed,
        child: child,
        style: style,
      ),
    );
  }
}
