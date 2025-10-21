import 'package:flutter/material.dart';

class RChipInput extends StatelessWidget {
  const RChipInput({
    super.key,
    this.icon,
    required this.label,
    this.onPressed,
    this.selected = false,
    this.isEnabled = true,
    this.onSelected,
    this.deleteIcon,
    this.onDeleted,
    this.labelColor,
    this.iconColor,
    this.deleteIconColor,
    this.backgorundColor,
    this.disabledColor,
    this.shape,
    this.side,
    this.tooltip,
  });

  final Widget? icon;
  final Widget label;
  final VoidCallback? onPressed;
  final bool selected;
  final bool isEnabled;
  final Function(bool)? onSelected;
  final Widget? deleteIcon;
  final VoidCallback? onDeleted;
  final Color? labelColor;
  final Color? iconColor;
  final Color? deleteIconColor;
  final Color? backgorundColor;
  final Color? disabledColor;
  final OutlinedBorder? shape;
  final BorderSide? side;
  final String? tooltip;

  bool get _hasIcon => icon != null;
  bool get _hasDeleteIcon => deleteIcon != null;

  @override
  Widget build(BuildContext context) {
    return InputChip(
      avatar: _hasIcon ? FittedBox(child: icon) : null,
      label: label,
      onPressed: onPressed,
      selected: selected,
      isEnabled: isEnabled,
      onSelected: onSelected,
      deleteIcon: _hasDeleteIcon ? FittedBox(child: deleteIcon) : null,
      onDeleted: _hasDeleteIcon ? onDeleted : null,
      backgroundColor: backgorundColor,
      disabledColor: disabledColor,
      deleteIconColor: deleteIconColor,
      showCheckmark: false,
      iconTheme: IconThemeData(
        color: iconColor,
      ),
      shape: shape,
      side: side,
      tooltip: tooltip,
    );
  }
}
