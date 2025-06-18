import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../atoms/icon/icon_specs.dart';
import '../../atoms/label/label_specs.dart';

class QDropdownformfieldSharedStyle {
  final LoadingStyle loadingStyle;

  QDropdownformfieldSharedStyle({required this.loadingStyle});
}

class QDropdownformfieldStyle {
  final InputBorder? enabledBorder;

  final InputBorder? focusedBorder;

  final InputBorder? focusedErrorBorder;

  final InputBorder? errorBorder;

  final InputBorder? disabledBorder;

  final InputBorder? successBorder;

  final InputBorder? warningBorder;

  final TextStyle? helperWarningStyle;

  final TextStyle? helperSuccessStyle;

  final TextStyle? helperRegularStyle;

  final IconStyleSet helperIconStyle;

  final bool enabled;

  final TextStyle? textStyle;

  final TextStyle? hintStyle;

  final TextStyle? errorStyle;

  final TextStyle? helperErrorStyle;

  final EdgeInsets? labelPadding;

  final Color? borderColorLabel;

  final LabelStyleSet labelSuccessStyle;

  final LabelStyleSet labelWarningStyle;

  final LabelStyleSet labelErrorStyle;

  final LabelStyleSet labelStyle;

  QDropdownformfieldStyle({
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.disabledBorder,
    this.successBorder,
    this.warningBorder,
    this.enabled = true,
    this.errorStyle,
    this.helperRegularStyle,
    this.helperSuccessStyle,
    this.helperWarningStyle,
    this.focusedErrorBorder,
    this.helperErrorStyle,
    this.borderColorLabel,
    this.labelPadding,
    this.textStyle,
    this.hintStyle,
    this.labelStyle = LabelStyleSet.captionRoboto12PrimaryBold,
    this.helperIconStyle = IconStyleSet.size16SecondaryBase,
    this.labelSuccessStyle = LabelStyleSet.captionRoboto12SuccessBold,
    this.labelWarningStyle = LabelStyleSet.captionRoboto12WarningBold,
    this.labelErrorStyle = LabelStyleSet.captionRoboto12ErrorBold,
  });
}

class QDropdownformfieldStyles {
  final QDropdownformfieldSharedStyle shared;
  final QDropdownformfieldStyle regular;
  final QDropdownformfieldStyle disabled;

  QDropdownformfieldStyles({
    required this.shared,
    required this.regular,
    required this.disabled,
  });
}
