import 'package:flutter/material.dart';

import '../../../../utils/interfaces/behaviour.dart';
import '../../../atoms/icon/icon.dart';
import '../../../atoms/icon/icon_specs.dart';
import '../textformfield_component.dart';

class TextformfieldGetSufixIconWidget extends StatelessWidget {
  final Behaviour behaviour;
  final VoidCallback? onPressed;
  final bool onPressedEnabled;
  final bool hasSuffixIcon;
  final bool isPassword;
  final bool hasError;
  final TextFieldStates fieldState;
  final String errorIconPath;
  final String successIconPath;
  final String warningIconPath;
  final String passwordIconPath;
  final String suffixIconPath;
  final IconStyleSet errorIconStyle;
  final IconStyleSet successIconStyle;
  final IconStyleSet warningIconStyle;
  final IconStyleSet suffixIconStyle;

  const TextformfieldGetSufixIconWidget({
    super.key,
    required this.behaviour,
    required this.onPressed,
    required this.onPressedEnabled,
    required this.hasError,
    required this.isPassword,
    required this.fieldState,
    required this.errorIconPath,
    required this.successIconPath,
    required this.warningIconPath,
    required this.passwordIconPath,
    required this.suffixIconPath,
    required this.errorIconStyle,
    required this.successIconStyle,
    required this.warningIconStyle,
    required this.suffixIconStyle,
    required this.hasSuffixIcon,
  });

  (String, IconStyleSet) get _getSuffixIconStyle {
    String svgPath = '';
    IconStyleSet iconStyle = successIconStyle;
    if (!hasSuffixIcon) return (svgPath, iconStyle);
    if (hasError && behaviour != Behaviour.disabled) {
      svgPath = errorIconPath;
      iconStyle = errorIconStyle;
    } else if (fieldState == TextFieldStates.success && behaviour != Behaviour.disabled) {
      svgPath = successIconPath;
      iconStyle = successIconStyle;
    } else if (fieldState == TextFieldStates.warning && behaviour != Behaviour.disabled) {
      svgPath = warningIconPath;
      iconStyle = warningIconStyle;
    } else {
      svgPath = isPassword ? passwordIconPath : suffixIconPath;
      iconStyle = suffixIconStyle;
    }

    return (svgPath, iconStyle);
  }

  @override
  Widget build(BuildContext context) {
    if (!hasSuffixIcon || _getSuffixIconStyle.$1.isEmpty) return const SizedBox.shrink();
    return QIcon(
      behaviour: behaviour,
      svgPath: _getSuffixIconStyle.$1,
      onPressed: onPressedEnabled ? onPressed : null,
      style: _getSuffixIconStyle.$2,
    );
  }
}
