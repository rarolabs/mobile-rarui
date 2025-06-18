import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../atoms/circular_progress/circular_progress_specs.dart';
import '../../atoms/icon/icon_specs.dart';
import '../../atoms/label/label_specs.dart';

class QButtonSharedStyle {
  final LoadingStyle loadingStyle;

  QButtonSharedStyle({
    required this.loadingStyle,
  });
}

class QButtonStyle {
  final ButtonStyle buttonStyle;
  final CircularProgressStyleSet circularProgressStyle;
  final LabelStyleSet labelStyle;
  final IconStyleSet? iconStyleSet;
  final IconStyleSet? pressedIconStyleSet;
  final Border? border;
  final BorderRadiusGeometry? borderRadius;

  QButtonStyle({
    required this.buttonStyle,
    required this.circularProgressStyle,
    required this.labelStyle,
    this.iconStyleSet,
    this.pressedIconStyleSet,
    this.border,
    this.borderRadius,
  });
}

class QButtonStyles {
  final QButtonSharedStyle shared;
  final QButtonStyle regular;
  final QButtonStyle disabled;
  final QButtonStyle processing;

  const QButtonStyles({
    required this.shared,
    required this.regular,
    required this.disabled,
    required this.processing,
  });
}
