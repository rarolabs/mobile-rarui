import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../atoms/icon/icon_specs.dart';
import '../../atoms/label/label_specs.dart';

class QTextformfieldSharedStyle {
  final LoadingStyle loadingStyle;

  QTextformfieldSharedStyle({required this.loadingStyle});
}

class QTextformfieldStyle {
  final IconStyleSet prefixIconStyle;

  final InputBorder? enabledBorder;

  final InputBorder? focusedBorder;

  final InputBorder? errorBorder;

  final InputBorder? disabledBorder;

  final InputBorder? successBorder;

  final InputBorder? warningBorder;

  final TextStyle? helperWarningStyle;

  final TextStyle? helperSuccessStyle;

  final TextStyle? helperRegularStyle;

  final Color? cursorColor;

  final IconStyleSet helperIconStyle;

  final bool enabled;

  final TextStyle? textStyle;

  final TextStyle? hintStyle;

  final TextStyle? errorStyle;

  final InputBorder? focusedErrorBorder;

  final TextStyle? helperErrorStyle;

  final EdgeInsets? labelPadding;

  final Color? borderColorLabel;

  final IconStyleSet suffixIconStyle;

  final IconStyleSet errorIconStyle;

  final IconStyleSet successIconStyle;

  final IconStyleSet warningIconStyle;

  final LabelStyleSet labelSuccessStyle;

  final LabelStyleSet labelWarningStyle;

  final LabelStyleSet labelErrorStyle;

  final LabelStyleSet labelStyle;

  QTextformfieldStyle({
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.disabledBorder,
    this.successBorder,
    this.warningBorder,
    this.cursorColor,
    this.labelPadding,
    this.enabled = true,
    this.textStyle,
    this.hintStyle,
    this.errorStyle,
    this.helperRegularStyle,
    this.helperSuccessStyle,
    this.helperWarningStyle,
    this.focusedErrorBorder,
    this.helperErrorStyle,
    this.borderColorLabel,
    this.labelStyle = LabelStyleSet.captionRoboto12PrimaryBold,
    this.prefixIconStyle = IconStyleSet.size24Gray3,
    this.helperIconStyle = IconStyleSet.size16SecondaryBase,
    this.suffixIconStyle = IconStyleSet.size24Gray3,
    this.errorIconStyle = IconStyleSet.size24Red,
    this.successIconStyle = IconStyleSet.size24Success,
    this.warningIconStyle = IconStyleSet.size24Warning,
    this.labelSuccessStyle = LabelStyleSet.captionRoboto12SuccessBold,
    this.labelWarningStyle = LabelStyleSet.captionRoboto12WarningBold,
    this.labelErrorStyle = LabelStyleSet.captionRoboto12ErrorBold,
  });

  QTextformfieldStyle copyWith({
    IconStyleSet? prefixIconStyle,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
    InputBorder? errorBorder,
    InputBorder? disabledBorder,
    InputBorder? successBorder,
    InputBorder? warningBorder,
    TextStyle? helperWarningStyle,
    TextStyle? helperSuccessStyle,
    TextStyle? helperRegularStyle,
    Color? cursorColor,
    IconStyleSet? helperIconStyle,
    bool? enabled,
    TextStyle? textStyle,
    TextStyle? hintStyle,
    TextStyle? errorStyle,
    InputBorder? focusedErrorBorder,
    TextStyle? helperErrorStyle,
    EdgeInsets? labelPadding,
    Color? borderColorLabel,
    IconStyleSet? suffixIconStyle,
    IconStyleSet? errorIconStyle,
    IconStyleSet? successIconStyle,
    IconStyleSet? warningIconStyle,
    LabelStyleSet? labelSuccessStyle,
    LabelStyleSet? labelWarningStyle,
    LabelStyleSet? labelErrorStyle,
    LabelStyleSet? labelStyle,
  }) {
    return QTextformfieldStyle(
      prefixIconStyle: prefixIconStyle ?? this.prefixIconStyle,
      enabledBorder: enabledBorder ?? this.enabledBorder,
      focusedBorder: focusedBorder ?? this.focusedBorder,
      errorBorder: errorBorder ?? this.errorBorder,
      disabledBorder: disabledBorder ?? this.disabledBorder,
      successBorder: successBorder ?? this.successBorder,
      warningBorder: warningBorder ?? this.warningBorder,
      helperWarningStyle: helperWarningStyle ?? this.helperWarningStyle,
      helperSuccessStyle: helperSuccessStyle ?? this.helperSuccessStyle,
      helperRegularStyle: helperRegularStyle ?? this.helperRegularStyle,
      cursorColor: cursorColor ?? this.cursorColor,
      helperIconStyle: helperIconStyle ?? this.helperIconStyle,
      enabled: enabled ?? this.enabled,
      textStyle: textStyle ?? this.textStyle,
      hintStyle: hintStyle ?? this.hintStyle,
      errorStyle: errorStyle ?? this.errorStyle,
      focusedErrorBorder: focusedErrorBorder ?? this.focusedErrorBorder,
      helperErrorStyle: helperErrorStyle ?? this.helperErrorStyle,
      labelPadding: labelPadding ?? this.labelPadding,
      borderColorLabel: borderColorLabel ?? this.borderColorLabel,
      suffixIconStyle: suffixIconStyle ?? this.suffixIconStyle,
      errorIconStyle: errorIconStyle ?? this.errorIconStyle,
      successIconStyle: successIconStyle ?? this.successIconStyle,
      warningIconStyle: warningIconStyle ?? this.warningIconStyle,
      labelSuccessStyle: labelSuccessStyle ?? this.labelSuccessStyle,
      labelWarningStyle: labelWarningStyle ?? this.labelWarningStyle,
      labelErrorStyle: labelErrorStyle ?? this.labelErrorStyle,
      labelStyle: labelStyle ?? this.labelStyle,
    );
  }
}

class QTextformfieldStyles {
  QTextformfieldSharedStyle shared;
  QTextformfieldStyle regular;
  QTextformfieldStyle disabled;

  QTextformfieldStyles({
    required this.shared,
    required this.regular,
    required this.disabled,
  });
}
