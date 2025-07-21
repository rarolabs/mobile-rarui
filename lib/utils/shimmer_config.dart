import 'package:flutter/material.dart';

class RShimmerConfig {
  RShimmerConfig._();

  static LinearGradient shimmerGradient(BuildContext context) {
    return LinearGradient(
      colors: [
        Theme.of(context).colorScheme.surfaceContainerLow,
        Theme.of(context).colorScheme.surfaceContainerHigh,
        Theme.of(context).colorScheme.surfaceContainerLow,
      ],
      stops: [0.1, 0.3, 0.4],
      begin: Alignment(-1.0, -0.3),
      end: Alignment(1.0, 0.3),
      tileMode: TileMode.clamp,
    );
  }
}
