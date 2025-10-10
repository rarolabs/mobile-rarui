import 'package:flutter/material.dart';
import 'package:rarui/components/molecules/buttons/base_button.dart';
import 'package:rarui/utils/constants.dart';

class ROutlinedButton extends RBaseButton {
  const ROutlinedButton({
    required Widget child,
    super.key,
    super.onPressed,
    super.backgroundColor,
    super.foregroundColor,
    super.disabledBackgroundColor,
    super.disabledForegroundColor,
    this.side,
    super.expanded = false,
    super.borderRadius,
    this.height,
  }) : super(child: child);

  final double? height;
  final BorderSide? side;

  bool get _isDisabled => onPressed == null;
  bool get _hasBorderRadius => borderRadius != null;

  @override
  Widget build(BuildContext context) {
    final disabledBorderColor =
        Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.12);
    final textColor = _isDisabled ? disabledForegroundColor : foregroundColor;
    final double buttonHeight =
        (height != null && height! >= RConstants.minButtonHeight)
            ? height!
            : RConstants.minButtonHeight;

    final styleButton = OutlinedButton.styleFrom(
      foregroundColor: textColor,
      disabledForegroundColor: disabledForegroundColor,
      side: !_isDisabled ? side : side?.copyWith(color: disabledBorderColor),
      shape: !_hasBorderRadius
          ? StadiumBorder()
          : RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(borderRadius!),
            ),
    );

    return SizedBox(
      height: buttonHeight,
      width: expanded ? MediaQuery.sizeOf(context).width : null,
      child: OutlinedButton(
        onPressed: onPressed,
        style: styleButton,
        child: child,
      ),
    );
  }
}
