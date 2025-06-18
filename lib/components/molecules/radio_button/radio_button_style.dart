import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../atoms/label/label_specs.dart';

class QRadioButtonSharedStyle {
  final LoadingStyle loadingStyle;

  QRadioButtonSharedStyle({
    required this.loadingStyle,
  });
}

class QRadioButtonStyle {
  final Color activeColor;

  final Color radioDisabledColor;

  final Color fillColor;

  /// Estilo do texto (título) que será exibido ao lado do radio button
  final LabelStyleSet titleStyle;

  /// Estilo do texto (subtítulo) que será exibido ao lado do radio button
  final LabelStyleSet subTitleStyle;

  QRadioButtonStyle({
    required this.activeColor,
    required this.radioDisabledColor,
    required this.fillColor,
    required this.titleStyle,
    required this.subTitleStyle,
  });
}

class QRadioButtonStyles {
  QRadioButtonSharedStyle shared;
  QRadioButtonStyle regular;
  QRadioButtonStyle disabled;

  QRadioButtonStyles({
    required this.shared,
    required this.regular,
    required this.disabled,
  });
}
