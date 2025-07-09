import 'package:flutter/material.dart';

@immutable
class ExtraColors extends ThemeExtension<ExtraColors> {
  final Color success;
  final Color warning;
  final Color error;

  const ExtraColors({
    required this.success,
    required this.warning,
    required this.error,
  });

  @override
  ExtraColors copyWith({
    Color? success,
    Color? warning,
    Color? error,
  }) {
    return ExtraColors(
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
    );
  }

  @override
  ExtraColors lerp(ThemeExtension<ExtraColors>? other, double t) {
    if (other is! ExtraColors) return this;
    return ExtraColors(
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
    );
  }
}
