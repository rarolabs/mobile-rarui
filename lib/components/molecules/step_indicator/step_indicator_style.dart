import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';

class StepIndicatorSharedStyle {
  final LoadingStyle loadingStyle;

  StepIndicatorSharedStyle({
    required this.loadingStyle,
  });
}

class StepIndicatorStyle {
  final Color indicatorColor;
  final Color backgroundColor;

  StepIndicatorStyle({
    required this.indicatorColor,
    required this.backgroundColor,
  });
}

class StepIndicatorStyles {
  StepIndicatorSharedStyle shared;
  StepIndicatorStyle regular;
  StepIndicatorStyle disabled;

  StepIndicatorStyles({
    required this.shared,
    required this.regular,
    required this.disabled,
  });
}
