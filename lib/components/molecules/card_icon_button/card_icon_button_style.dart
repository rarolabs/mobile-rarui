import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../atoms/label/label_specs.dart';
import '../button/button_specs.dart';

class CardIconButtonStyle {
  final double width;
  final double height;
  final double iconSize;
  final double textSpacing;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final Color borderColor;
  final double? buttonWidth;
  final double? buttonHeight;

  CardIconButtonStyle({
    required this.width,
    required this.height,
    required this.iconSize,
    required this.textSpacing,
    required this.padding,
    required this.borderRadius,
    required this.backgroundColor,
    required this.borderColor,
    this.buttonWidth,
    this.buttonHeight,
  });
}

class CardIconButtonSharedStyle {
  final LoadingStyle loadingStyle;
  final LabelStyleSet titleStyle;
  final LabelStyleSet subtitleStyle;
  final LabelStyleSet footerStyle;
  final ButtonStyleSet? buttonStyleSet;

  CardIconButtonSharedStyle({
    required this.loadingStyle,
    required this.titleStyle,
    required this.subtitleStyle,
    required this.footerStyle,
    this.buttonStyleSet,
  });
}

class CardIconButtonStyles {
  final CardIconButtonStyle regular;
  final CardIconButtonSharedStyle shared;
  final CardIconButtonStyle disabled;

  CardIconButtonStyles({
    required this.regular,
    required this.shared,
    required this.disabled,
  });
}
