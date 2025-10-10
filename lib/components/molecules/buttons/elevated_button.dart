import 'package:flutter/material.dart';
import 'package:rarui/components/molecules/buttons/base_button.dart';
import 'package:rarui/utils/constants.dart';

class RElevatedButton extends RBaseButton {
  const RElevatedButton({
    required Widget child,
    super.key,
    super.onPressed,
    super.backgroundColor,
    super.foregroundColor,
    super.disabledBackgroundColor,
    super.disabledForegroundColor,
    super.expanded = false,
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
      shape: borderRadius != null
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!))
          : null,
    );

    return SizedBox(
      height: buttonHeight,
      width: expanded ? MediaQuery.sizeOf(context).width : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: styleButton,
        child: child,
      ),
    );
  }
}
