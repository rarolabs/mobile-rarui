import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../atoms/icon/icon_specs.dart';
import '../../atoms/label/label_specs.dart';

class QAppBarSharedStyle {
  final LoadingStyle loadingStyle;
  final LabelStyleSet titleStyle;

  QAppBarSharedStyle({
    required this.loadingStyle,
    this.titleStyle = LabelStyleSet.paragraphRoboto16WhiteBold,
  });
}

class QAppBarStyle {
  final LabelStyleSet? usernameTextStyle;
  final LabelStyleSet? obscureTextStyle;
  final LabelStyleSet? textSaldoTextStyle;
  final IconStyleSet? iconTextStyle;
  final String? leadingBackSvgPath;
  final Color? backgroundColor;
  final IconStyleSet? iconAddTextStyle;

  QAppBarStyle({
    this.usernameTextStyle,
    this.obscureTextStyle,
    this.textSaldoTextStyle,
    this.iconTextStyle,
    this.leadingBackSvgPath,
    this.backgroundColor,
    this.iconAddTextStyle,
  });
}

class QAppBarStyles {
  QAppBarSharedStyle shared;
  QAppBarStyle regular;

  QAppBarStyles({
    required this.shared,
    required this.regular,
  });
}
