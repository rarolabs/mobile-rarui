import 'package:flutter/material.dart';
import 'package:rarui/components/molecules/buttons/base_button.dart';
import 'package:rarui/utils/constants.dart';

class RFilledButton extends RBaseButton {
  const RFilledButton({
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
    this.padding,
  }) : super(child: child);

  final double? height;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final double buttonHeight =
        (height != null && height! >= RConstants.minButtonHeight)
            ? height!
            : RConstants.minButtonHeight;

    final styleButton = FilledButton.styleFrom(
      disabledBackgroundColor: disabledBackgroundColor,
      disabledForegroundColor: disabledForegroundColor,
      backgroundColor: backgroundColor,
      padding: padding,
      shape: borderRadius != null
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!))
          : null,
    );

    return SizedBox(
      height: buttonHeight,
      width: expanded ? MediaQuery.sizeOf(context).width : null,
      child: FilledButton(
        onPressed: onPressed,
        style: styleButton,
        child: child,
      ),
    );
  }
}
