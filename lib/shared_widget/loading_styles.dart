import 'package:flutter/material.dart';

class LoadingStyle {
  final Size size;
  final Color baseColor;
  final Color highlightColor;

  const LoadingStyle({
    required this.size,
    required this.baseColor,
    required this.highlightColor,
  });

  LoadingStyle copyWith({
    Size? size,
    Color? baseColor,
    Color? highlightColor,
  }) {
    return LoadingStyle(
      size: size ?? this.size,
      baseColor: baseColor ?? this.baseColor,
      highlightColor: highlightColor ?? this.highlightColor,
    );
  }

  @override
  String toString() => 'LoadingStyle(size: $size, baseColor: $baseColor, highlightColor: $highlightColor)';

  @override
  bool operator ==(covariant LoadingStyle other) {
    if (identical(this, other)) return true;
    return other.size == size && other.baseColor == baseColor && other.highlightColor == highlightColor;
  }

  @override
  int get hashCode => size.hashCode ^ baseColor.hashCode ^ highlightColor.hashCode;
}
