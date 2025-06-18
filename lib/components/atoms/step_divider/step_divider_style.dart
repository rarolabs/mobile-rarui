import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';

class StepDividerSharedStyle {
  final LoadingStyle loadingStyle;

  StepDividerSharedStyle({
    required this.loadingStyle,
  });
}

class StepDividerStyle {
  final List<Color> backgroundColors;

  StepDividerStyle({
    required this.backgroundColors,
  });
}

class StepDividerStyles {
  final StepDividerSharedStyle shared;
  final StepDividerStyle regular;
  final StepDividerStyle disable;
  final StepDividerStyle processing;

  StepDividerStyles({
    required this.shared,
    required this.regular,
    required this.disable,
    required this.processing,
  });
}
