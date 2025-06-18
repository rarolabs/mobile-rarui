import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';

class CardCashbackCategorySharedStyle {
  final LoadingStyle loadingStyle;

  CardCashbackCategorySharedStyle({
    required this.loadingStyle,
  });
}

class CardCashbackCategoryStyle {
  final double height;
  final double width;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;
  final Color backgroundColor;

  CardCashbackCategoryStyle({
    required this.height,
    required this.width,
    required this.padding,
    required this.borderRadius,
    required this.backgroundColor,
  });
}

class CardCashbackCategoryStyles {
  CardCashbackCategorySharedStyle shared;
  CardCashbackCategoryStyle regular;
  CardCashbackCategoryStyle disabled;

  CardCashbackCategoryStyles({
    required this.shared,
    required this.regular,
    required this.disabled,
  });
}
