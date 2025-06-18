import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';

class ProgressIndicatorSharedStyle {
  final LoadingStyle loadingStyle;

  ProgressIndicatorSharedStyle({
    required this.loadingStyle,
  });
}

class ProgressIndicatorStyle {
  final Color progressColor;
  final Color? backgroundColor;
  final double height;

  ProgressIndicatorStyle({
    required this.progressColor,
    this.backgroundColor,
    required this.height,
  });
}

class ProgressIndicatorStyles {
  final ProgressIndicatorSharedStyle shared;
  final ProgressIndicatorStyle regular;
  final ProgressIndicatorStyle disabled;

  ProgressIndicatorStyles({
    required this.shared,
    required this.regular,
    required this.disabled,
  });
}
