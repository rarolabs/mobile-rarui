import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';

class CircularProgressSharedStyle {
  final LoadingStyle loadingStyle;

  CircularProgressSharedStyle({
    required this.loadingStyle,
  });
}

class CircularProgressStyle {
  final Color color;
  final Color backgroundColor;
  final double strokeWidth;
  final double radius;

  CircularProgressStyle({
    required this.color,
    required this.backgroundColor,
    required this.strokeWidth,
    required this.radius,
  });
}

class QCircularProgressStyles {
  final CircularProgressStyle regular;
  final CircularProgressSharedStyle shared;

  QCircularProgressStyles({
    required this.regular,
    required this.shared,
  });
}
