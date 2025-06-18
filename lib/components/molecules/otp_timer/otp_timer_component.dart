import 'package:flutter/material.dart';

import '../../../rarui.dart';
import '../../../shared_widget/loading_widget.dart';
import '../../../utils/interfaces/style.dart';
import '../../../utils/mixin/component.dart';
import '../../atoms/label/label_specs.dart';
import 'otp_border_painter.dart';
import 'otp_timer_style.dart';

class OtpTimerComponent extends StatelessWidget with Component<OtpTimerStyle, OtpTimerSharedStyle> {
  /// Comportamento do componente, initial [Behaviour.regular]
  final Behaviour behaviour;

  /// Estilo do componente
  final OtpTimerStyles styles;

  /// Duração do timer
  final Duration duration;

  /// Label do código de OTP
  final String otpCodeLabel;

  /// Estilo do label do código de OTP
  final LabelStyleSet otpCodeLabelStyle;

  /// Função que será executada quando o timer terminar
  final VoidCallback? onComplete;

  /// Semântica do componente
  final String? hintSemantics;

  /// Semântica do componente
  final String? labelSemantics;

  const OtpTimerComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    this.duration = const Duration(seconds: 60),
    required this.otpCodeLabel,
    required this.otpCodeLabelStyle,
    this.onComplete,
    this.hintSemantics,
    this.labelSemantics,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<OtpTimerStyle, OtpTimerSharedStyle>(
      shared: styles.shared,
      regular: styles.regular,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    OtpTimerStyle style,
    OtpTimerSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return LoadingWidget(style: otherStyle.loadingStyle);
  }

  @override
  Widget whenRegular(
    OtpTimerStyle style,
    OtpTimerSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _BasicOtpTimer(
      duration: duration,
      strokeWidth: style.strokeWidth,
      borderColor: style.borderColor,
      style: style,
      otpCodeLabel: otpCodeLabel,
      otpCodeLabelStyle: otpCodeLabelStyle,
      behaviour: behaviour,
      onComplete: onComplete,
      hintSemantics: hintSemantics,
      labelSemantics: labelSemantics,
    );
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.processing: Behaviour.regular,
        Behaviour.error: Behaviour.regular,
        Behaviour.disabled: Behaviour.regular,
      };
}

class _BasicOtpTimer extends StatefulWidget {
  final Duration duration;

  final double strokeWidth;
  final Color borderColor;
  final OtpTimerStyle style;
  final String otpCodeLabel;
  final LabelStyleSet otpCodeLabelStyle;
  final Behaviour behaviour;
  final VoidCallback? onComplete;
  final String? hintSemantics;
  final String? labelSemantics;

  const _BasicOtpTimer({
    required this.duration,
    required this.strokeWidth,
    required this.borderColor,
    required this.style,
    required this.otpCodeLabel,
    required this.otpCodeLabelStyle,
    required this.behaviour,
    this.onComplete,
    this.hintSemantics,
    this.labelSemantics,
  });

  @override
  State<_BasicOtpTimer> createState() => _BasicOtpTimerState();
}

class _BasicOtpTimerState extends State<_BasicOtpTimer> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _controller.forward();
    _controller.addListener(() {
      if (_controller.isCompleted) {
        widget.onComplete?.call();
        _controller.reset();
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: OtpBorderPainter(
        animation: _controller,
        strokeWidth: widget.style.strokeWidth,
        borderColor: widget.style.borderColor,
      ),
      child: Semantics(
        hint: widget.hintSemantics,
        label: widget.labelSemantics,
        child: Container(
          width: QSizes.x200,
          height: QSizes.x200,
          decoration: BoxDecoration(
            color: QTheme.colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: QLabel(
              behaviour: widget.behaviour,
              text: widget.otpCodeLabel,
              style: widget.otpCodeLabelStyle,
            ),
          ),
        ),
      ),
    );
  }
}
