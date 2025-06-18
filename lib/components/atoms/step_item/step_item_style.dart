import 'package:flutter/material.dart';

import '../../../rarui.dart';
import '../../../shared_widget/loading_styles.dart';

class StepItemSharedStyle {
  final LoadingStyle loadingStyle;

  StepItemSharedStyle({
    required this.loadingStyle,
  });
}

class StepItemStyle {
  final Color textColor;
  final Color backgroundColor;
  final bool isCompleted;
  final double height;

  StepItemStyle({
    required this.textColor,
    required this.backgroundColor,
    this.isCompleted = false,
    this.height = QSizes.x32,
  });
}

class StepItemStyles {
  final StepItemSharedStyle shared;
  final StepItemStyle regular;
  final StepItemStyle disabled;

  StepItemStyles({
    required this.regular,
    required this.shared,
    required this.disabled,
  });
}
