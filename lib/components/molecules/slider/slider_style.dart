import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';

class SliderSharedStyle {
  final LoadingStyle loadingStyle;

  SliderSharedStyle({required this.loadingStyle});
}

class SliderStyle {
  final Color activedColor;

  final Color indicatorColor;

  SliderStyle({required this.activedColor, required this.indicatorColor});
}

class SliderStyles {
  final SliderSharedStyle shared;
  final SliderStyle regular;
  final SliderStyle disabled;

  SliderStyles({
    required this.shared,
    required this.regular,
    required this.disabled,
  });
}
