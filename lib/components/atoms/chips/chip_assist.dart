import 'package:flutter/material.dart';

class RChipAssist extends StatelessWidget {
  const RChipAssist({
    super.key,
    this.icon,
    required this.label,
    this.onPressed,
    this.iconColor,
    this.labelColor,
    this.backgorundColor,
    this.disabledColor,
    this.side,
    this.tooltip,
  });

  final Widget? icon;
  final String label;
  final VoidCallback? onPressed;
  final Color? iconColor;
  final Color? labelColor;
  final Color? backgorundColor;
  final Color? disabledColor;
  final BorderSide? side;
  final String? tooltip;

  bool get _hasIcon => icon != null;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: _hasIcon ? FittedBox(child: icon) : null,
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
