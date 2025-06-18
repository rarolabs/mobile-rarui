import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';

class ToggleSharedStyle {
  final LoadingStyle loadingStyle;

  ToggleSharedStyle({
    required this.loadingStyle,
  });
}

class ToggleStyle {
  final Color trackColor;
  final Color? activeColor;
  final Color activeTrackColor;

  ToggleStyle({
    required this.trackColor,
    this.activeColor,
    required this.activeTrackColor,
  });
}

class ToggleStyles {
  final ToggleSharedStyle shared;
  final ToggleStyle regular;
  final ToggleStyle disabled;

  ToggleStyles({
    required this.shared,
    required this.regular,
    required this.disabled,
  });
}
