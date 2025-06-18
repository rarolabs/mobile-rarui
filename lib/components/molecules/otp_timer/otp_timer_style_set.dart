import 'otp_timer_specs.dart';
import 'otp_timer_style.dart';

enum OtpTimerStyleSet {
  standard(OtpTimerSpecs.standardStyle);

  final OtpTimerStyles Function() build;

  const OtpTimerStyleSet(this.build);
}
