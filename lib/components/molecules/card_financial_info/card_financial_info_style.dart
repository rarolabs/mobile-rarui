import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../atoms/icon/icon_specs.dart';
import '../../atoms/label/label_specs.dart';

class CardFinancialInfoStyle {
  final Color backgroundColor;
  final LoadingStyle loadingStyle;

  CardFinancialInfoStyle({
    required this.backgroundColor,
    required this.loadingStyle,
  });
}

class CardFinancialInfoSharedStyle {
  final LabelStyleSet titleStyle;
  final LabelStyleSet valueStyle;
  final LabelStyleSet limitDescriptionStyle;
  final LabelStyleSet limitValueStyle;
  final IconStyleSet valueIconStyle;

  CardFinancialInfoSharedStyle({
    required this.titleStyle,
    required this.valueStyle,
    required this.limitDescriptionStyle,
    required this.limitValueStyle,
    required this.valueIconStyle,
  });
}

class CardFinancialInfoStyles {
  final CardFinancialInfoSharedStyle shared;
  final CardFinancialInfoStyle regular;

  CardFinancialInfoStyles({
    required this.shared,
    required this.regular,
  });
}
