import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import 'otp_timer_component.dart';
import 'otp_timer_style.dart';

class OtpTimerSpecs extends OtpTimerComponent {
  const OtpTimerSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    super.duration,
    required super.otpCodeLabel,
    required super.otpCodeLabelStyle,
    super.onComplete,
    super.hintSemantics,
    super.labelSemantics,
  });

  static OtpTimerStyles standardStyle() {
    return OtpTimerStyles(
      shared: OtpTimerSharedStyle(
        loadingStyle: LoadingStyle(
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
          size: const Size(QSizes.x108, QSizes.x108),
        ),
      ),
      regular: OtpTimerStyle(
        borderColor: QTheme.colors.otpColor,
        strokeWidth: QSizes.x16,
      ),
    );
  }
}
