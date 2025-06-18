import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'loading_styles.dart';

class LoadingWidget extends StatelessWidget {
  final LoadingStyle style;
  const LoadingWidget({
    super.key,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: style.size.width,
      height: style.size.height,
      child: Shimmer.fromColors(
        baseColor: style.baseColor,
        highlightColor: style.highlightColor,
        child: ColoredBox(
          color: style.highlightColor,
        ),
      ),
    );
  }
}
