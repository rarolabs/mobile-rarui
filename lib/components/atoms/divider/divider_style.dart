import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';

class DividerSharedStyle {
  final LoadingStyle loadingStyle;

  DividerSharedStyle({
    required this.loadingStyle,
  });
}

class DividerStyle {
  final Color color;
  final double? thickness;
  final double? height;

  DividerStyle({
    required this.color,
    this.thickness,
    this.height,
  });
}

class DividerStyles {
  final DividerSharedStyle shared;
  final DividerStyle regular;
  final DividerStyle disabled;

  DividerStyles({
    required this.shared,
    required this.regular,
    required this.disabled,
  });
}
