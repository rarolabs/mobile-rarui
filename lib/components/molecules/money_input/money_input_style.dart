import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../atoms/label/label_specs.dart';

class MoneyInputSharedStyle {
  final LoadingStyle loadingStyle;

  MoneyInputSharedStyle({
    required this.loadingStyle,
  });
}

class MoneyInputStyle {
  final TextStyle textStyle;
  final LabelStyleSet errorTextStyle;
  final double? dividerWidth;
  final Color dividerColor;
  final Color dividerActivedColor;
  final InputBorder? successBorder;
  final InputBorder? normalBorder;
  final InputBorder? errorBorder;
  final LabelStyleSet hintLabelStyle;
  final LabelStyleSet hintBalanceStyle;

  MoneyInputStyle({
    required this.textStyle,
    required this.errorTextStyle,
    this.dividerWidth,
    required this.dividerColor,
    required this.dividerActivedColor,
    this.successBorder,
    this.normalBorder,
    this.errorBorder,
    this.hintLabelStyle = LabelStyleSet.captionRoboto14Gray4Regular,
    this.hintBalanceStyle = LabelStyleSet.captionRoboto12ErrorBold,
  });
}

class MoneyInputStyles {
  MoneyInputSharedStyle shared;
  MoneyInputStyle regular;
  MoneyInputStyle disabled;
  MoneyInputStyle error;

  MoneyInputStyles({
    required this.shared,
    required this.regular,
    required this.disabled,
    required this.error,
  });
}
