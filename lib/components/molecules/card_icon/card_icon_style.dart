import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';
import '../../atoms/icon/icon_specs.dart';

class CardIconSharedStyle {
  final LoadingStyle loadingStyle;

  CardIconSharedStyle({
    required this.loadingStyle,
  });
}

class CardIconStyle {
  final double height;
  final double width;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;
  final Color backgroundColor;
  final IconStyleSet iconStyle;

  CardIconStyle({
    required this.height,
    required this.width,
    required this.padding,
    required this.borderRadius,
    required this.backgroundColor,
    this.iconStyle = IconStyleSet.size32Gray5,
  });
}

class CardIconStyles {
  CardIconSharedStyle shared;
  CardIconStyle regular;
  CardIconStyle disabled;

  CardIconStyles({
    required this.shared,
    required this.regular,
    required this.disabled,
  });
}
