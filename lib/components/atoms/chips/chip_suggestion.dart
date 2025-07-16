import 'package:flutter/material.dart';

class RChipSuggestion extends StatelessWidget {
  const RChipSuggestion({
    super.key,
    required this.label,
    this.onPressed,
    this.labelColor,
    this.iconColor,
    this.backgorundColor,
    this.disabledColor,
    this.side,
    this.tooltip,
  });

  final String label;
  final VoidCallback? onPressed;
  final Color? labelColor;
  final Color? iconColor;
  final Color? backgorundColor;
  final Color? disabledColor;
  final BorderSide? side;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(
        label,
        style: TextStyle(
          color: labelColor,
        ),
      ),
      onPressed: onPressed,
      backgroundColor: backgorundColor,
      disabledColor: disabledColor,
      iconTheme: IconThemeData(
        color: iconColor,
      ),
      side: side,
      tooltip: tooltip,
    );
  }
}
