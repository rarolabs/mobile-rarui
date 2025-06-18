import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';
import '../../atoms/label/label_specs.dart';

class CheckboxSharedStyle {
  final LoadingStyle loadingStyle;
  final LabelStyleSet labelStyle;

  const CheckboxSharedStyle({required this.loadingStyle, required this.labelStyle});
}

class CheckboxStyle {
  final Color selectedColor;
  final Color unselectedColor;
  final Color iconColor;
  final Color borderColor;
  const CheckboxStyle({
    required this.selectedColor,
    required this.unselectedColor,
    required this.iconColor,
    required this.borderColor,
  });
}

class CheckboxStyles {
  final CheckboxSharedStyle shared;
  final CheckboxStyle regular;
  final CheckboxStyle disabled;

  const CheckboxStyles({
    required this.shared,
    required this.regular,
    required this.disabled,
  });
}
