import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../atoms/icon/icon_specs.dart';
import '../../atoms/label/label_specs.dart';
import '../../molecules/button/button_specs.dart';

class FeedbackPageSharedStyle {
  final LoadingStyle loadingStyle;

  FeedbackPageSharedStyle({
    required this.loadingStyle,
  });
}

class FeedbackPageStyle {
  final LabelStyleSet? titleStyle;
  final LabelStyleSet? descriptionStyle;
  final ButtonStyleSet? primaryButtonStyle;
  final ButtonStyleSet? secondaryButtonStyle;
  final CrossAxisAlignment descriptionCrossAxisAlignment;
  final double descriptionSpacing;
  final String feedbackIconPath;
  final IconStyleSet feedbackIconStyle;

  final TextAlign descriptionTextAlign;

  FeedbackPageStyle({
    required this.titleStyle,
    this.descriptionStyle,
    this.primaryButtonStyle,
    this.secondaryButtonStyle,
    this.descriptionCrossAxisAlignment = CrossAxisAlignment.center,
    this.descriptionSpacing = QSizes.x16,
    required this.feedbackIconPath,
    required this.feedbackIconStyle,
    this.descriptionTextAlign = TextAlign.center,
  });
}

class FeedbackPageStyles {
  FeedbackPageSharedStyle shared;
  FeedbackPageStyle regular;

  FeedbackPageStyles({
    required this.shared,
    required this.regular,
  });
}
