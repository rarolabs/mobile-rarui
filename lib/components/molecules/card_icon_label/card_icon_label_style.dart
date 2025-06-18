import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';
import '../../atoms/label/label_specs.dart';

class CardIconLabelSharedStyle {
  final LoadingStyle loadingStyle;

  CardIconLabelSharedStyle({
    required this.loadingStyle,
  });
}

class CardIconLabelStyle {
  final double height;
  final double width;
  final double iconSize;
  final double textSpacing;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;
  final Color backgroundColor;
  final Color borderColor;
  final LabelStyleSet titleStyle;
  final LabelStyleSet subtitleStyle;
  final LabelStyleSet initialsTitleStyle;

  CardIconLabelStyle({
    required this.height,
    required this.width,
    required this.iconSize,
    required this.textSpacing,
    required this.padding,
    required this.borderRadius,
    required this.backgroundColor,
    required this.borderColor,
    required this.titleStyle,
    required this.subtitleStyle,
    required this.initialsTitleStyle,
  });
}

class CardIconLabelStyles {
  CardIconLabelSharedStyle shared;
  CardIconLabelStyle regular;
  CardIconLabelStyle disabled;

  CardIconLabelStyles({
    required this.shared,
    required this.regular,
    required this.disabled,
  });
}
