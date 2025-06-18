import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';

class OtpTimerSharedStyle {
  final LoadingStyle loadingStyle;

  OtpTimerSharedStyle({required this.loadingStyle});
}

class OtpTimerStyle {
  final Color borderColor;
  final double strokeWidth;

  OtpTimerStyle({
    required this.borderColor,
    required this.strokeWidth,
  });
}

class OtpTimerStyles {
  OtpTimerSharedStyle shared;
  OtpTimerStyle regular;

  OtpTimerStyles({
    required this.shared,
    required this.regular,
  });
}
