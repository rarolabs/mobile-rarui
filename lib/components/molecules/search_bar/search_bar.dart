import 'package:flutter/material.dart';

class RSearchBar extends StatelessWidget {
  const RSearchBar({
    Key? key,
    required this.controller,
    this.focusNode,
    this.hintText,
    this.leading,
    this.trailing,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.onTapOutside,
    this.backgroundColor,
    this.enabled = true,
    this.autoFocus = false,
    this.keyboardType,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? hintText;
  final Widget? leading;
  final Iterable<Widget>? trailing;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TapRegionCallback? onTapOutside;
  final WidgetStateProperty<Color>? backgroundColor;
  final bool enabled;
  final bool autoFocus;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      key: key,
      controller: controller,
      focusNode: focusNode,
      hintText: hintText,
      leading: leading,
      trailing: trailing,
      onTap: onTap,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      onTapOutside: onTapOutside,
      backgroundColor: backgroundColor,
      enabled: enabled,
      autoFocus: autoFocus,
      keyboardType: keyboardType,
    );
  }
}
