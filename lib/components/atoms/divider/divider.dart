import 'package:flutter/material.dart';

class RDivider extends StatelessWidget {
  final double? thickness;
  final double? height;
  final double? width;
  final Color? color;
  final bool isVertical;

  const RDivider({
    super.key,
    this.thickness,
    this.height,
    this.width,
    this.color,
    this.isVertical = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dividerColor = color ?? theme.dividerColor;

    if (isVertical) {
      return VerticalDivider(
        width: width,
        thickness: thickness,
        color: dividerColor,
      );
    }

    return Divider(
      thickness: thickness,
      height: height,
      color: dividerColor,
    );
  }
}
