import 'package:flutter/material.dart';

class RChipFilter extends StatelessWidget {
  const RChipFilter({
    super.key,
    required this.label,
    this.selected = false,
    this.onSelected,
    this.showCheckMark,
    this.labelColor,
    this.iconColor,
    this.backgorundColor,
    this.disabledColor,
    this.side,
    this.tooltip,
    this.shape,
  });

  final String label;
  final bool selected;
  final Function(bool)? onSelected;
  final bool? showCheckMark;
  final Color? labelColor;
  final Color? iconColor;
  final Color? backgorundColor;
  final Color? disabledColor;
  final BorderSide? side;
  final String? tooltip;
  final OutlinedBorder? shape;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        label,
        style: TextStyle(
          color: labelColor,
        ),
      ),
      selected: selected,
      onSelected: onSelected,
      showCheckmark: showCheckMark,
      backgroundColor: backgorundColor,
      disabledColor: disabledColor,
      iconTheme: IconThemeData(
        color: iconColor,
      ),
      side: side,
      tooltip: tooltip,
      shape: shape,
    );
  }
}
