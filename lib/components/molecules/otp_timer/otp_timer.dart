import '../../atoms/label/label_specs.dart';
import 'otp_timer_specs.dart';
import 'otp_timer_style_set.dart';

class QOtpTimer extends OtpTimerSpecs {
  /// Style configuration for [QOtpTimer]
  final OtpTimerStyleSet style;

  QOtpTimer({
    super.key,
    required this.style,
    required super.behaviour,
    required super.otpCodeLabel,
    required super.otpCodeLabelStyle,
    super.duration,
    super.onComplete,
    super.hintSemantics,
    super.labelSemantics,
  }) : super(styles: style.build());

  QOtpTimer.standard({
    super.key,
    required super.behaviour,
    required super.otpCodeLabel,
    super.duration,
    super.onComplete,
    super.hintSemantics,
    super.labelSemantics,
  })  : style = OtpTimerStyleSet.standard,
        super(
          styles: OtpTimerStyleSet.standard.build(),
          otpCodeLabelStyle: LabelStyleSet.h1Lato42SecondaryColorBaseBold,
        );
}
