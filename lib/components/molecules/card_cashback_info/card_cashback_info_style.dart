import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../atoms/label/label_specs.dart';
import '../button/button_specs.dart';

class CardCashbackInfoStyle {
  final double width;
  final double height;
  final double iconSize;
  final double textSpacing;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final Color borderColor;

  CardCashbackInfoStyle({
    required this.width,
    required this.height,
    required this.iconSize,
    required this.textSpacing,
    required this.padding,
    required this.borderRadius,
    required this.backgroundColor,
    required this.borderColor,
  });
}

class CardCashbackInfoSharedStyle {
  final LoadingStyle loadingStyle;
  final LabelStyleSet titleStyle;
  final LabelStyleSet subtitleStyle;
  final LabelStyleSet footerStyle;
  final ButtonStyleSet buttonStyleSet;

  CardCashbackInfoSharedStyle({
    required this.loadingStyle,
    required this.titleStyle,
    required this.subtitleStyle,
    required this.footerStyle,
    required this.buttonStyleSet,
  });
}

class CardCashbackInfoStyles {
  final CardCashbackInfoStyle regular;
  final CardCashbackInfoSharedStyle shared;
  final CardCashbackInfoStyle disabled;

  CardCashbackInfoStyles({
    required this.regular,
    required this.shared,
    required this.disabled,
  });
}
