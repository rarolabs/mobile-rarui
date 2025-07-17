import 'package:flutter/material.dart';

@immutable
class ExtraColors extends ThemeExtension<ExtraColors> {
  final ColorScheme success;
  final ColorScheme warning;
  final ColorScheme error;
  final ColorScheme info;

  const ExtraColors({
    required this.success,
    required this.warning,
    required this.error,
    required this.info,
  });

  @override
  ExtraColors copyWith({
    ColorScheme? success,
    ColorScheme? warning,
    ColorScheme? error,
    ColorScheme? info,
  }) {
    return ExtraColors(
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      info: info ?? this.info,
    );
  }

  @override
  ExtraColors lerp(ThemeExtension<ExtraColors>? other, double t) {
    if (other is! ExtraColors) return this;
    return ExtraColors(
      success: ColorScheme.lerp(success, other.success, t),
      warning: ColorScheme.lerp(warning, other.warning, t),
      error: ColorScheme.lerp(error, other.error, t),
      info: ColorScheme.lerp(info, other.info, t),
    );
  }
}
