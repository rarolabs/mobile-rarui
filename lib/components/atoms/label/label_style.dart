import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';

class LabelSharedStyle {
  final LoadingStyle loadingStyle;

  LabelSharedStyle({
    required this.loadingStyle,
  });
}

class LabelStyle {
  final TextStyle textStyle;
  final Color? highlightColor;

  LabelStyle({
    required TextStyle textStyle,
    this.highlightColor,
  }) : textStyle = textStyle.copyWith(
          decorationColor: textStyle.decorationColor ?? textStyle.color,
        );
}

class LabelStyles {
  final LabelSharedStyle shared;
  final LabelStyle regular;
  final LabelStyle disabled;
  final LabelStyle error;

  LabelStyles({
    required this.shared,
    required this.regular,
    required this.disabled,
    required this.error,
  });
}
