import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';
import '../../atoms/circular_progress/circular_progress_specs.dart';
import '../../atoms/icon/icon_specs.dart';
import '../../atoms/label/label_specs.dart';

class LoadingPageSharedStyle {
  final LoadingStyle loadingStyle;

  LoadingPageSharedStyle({
    required this.loadingStyle,
  });
}

class LoadingPageStyle {
  final Color backgroundColor;
  final LabelStyleSet? titleLabelStyle;
  final LabelStyleSet? descriptionLabelStyle;
  final IconStyleSet? iconStyle;
  final CircularProgressStyleSet circularProgressStyle;

  LoadingPageStyle({
    required this.backgroundColor,
    required this.circularProgressStyle,
    this.titleLabelStyle,
    this.descriptionLabelStyle,
    this.iconStyle,
  });
}

class LoadingPageStyles {
  LoadingPageStyle regular;
  LoadingPageSharedStyle shared;

  LoadingPageStyles({
    required this.regular,
    required this.shared,
  });
}
