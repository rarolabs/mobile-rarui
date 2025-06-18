import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../atoms/label/label_specs.dart';

class QTabSharedStyle {
  final LoadingStyle loadingStyle;

  QTabSharedStyle({required this.loadingStyle});
}

class QTabStyle {
  final Color indicatorColor;
  final Color unselectedLabelColor;
  final Color labelColor;
  final Color dividerColor;
  final LabelStyleSet labelStyle;
  final TextStyle? unselectedLabelStyle;
  final ScrollPhysics? tabScrollPhysics;
  final double? indicatorWeight;
  final EdgeInsetsGeometry? indicatorPadding;

  QTabStyle({
    required this.indicatorColor,
    required this.unselectedLabelColor,
    required this.labelColor,
    required this.dividerColor,
    required this.labelStyle,
    this.unselectedLabelStyle,
    this.tabScrollPhysics = const NeverScrollableScrollPhysics(),
    this.indicatorWeight,
    this.indicatorPadding,
  });
}

class QTabStyles {
  QTabSharedStyle shared;
  QTabStyle regular;
  QTabStyle disabled;

  QTabStyles({
    required this.shared,
    required this.regular,
    required this.disabled,
  });
}
