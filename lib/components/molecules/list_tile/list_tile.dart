import 'package:flutter/material.dart';

class RListTile extends StatelessWidget {
  const RListTile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.isThreeLine,
    this.dense,
    this.visualDensity,
    this.shape,
    this.style,
    this.selectedColor,
    this.iconColor,
    this.textColor,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.leadingAndTrailingTextStyle,
    this.contentPadding,
    this.enabled = true,
    this.onTap,
    this.onLongPress,
    this.onFocusChange,
    this.mouseCursor,
    this.selected = false,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.focusNode,
    this.autofocus = false,
    this.tileColor,
    this.selectedTileColor,
    this.enableFeedback,
    this.horizontalTitleGap,
    this.minVerticalPadding,
    this.minLeadingWidth,
    this.minTileHeight,
    this.titleAlignment,
    this.internalAddSemanticForOnTap = true,
  });

  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final bool? isThreeLine;
  final bool? dense;
  final VisualDensity? visualDensity;
  final ShapeBorder? shape;
  final ListTileStyle? style;
  final Color? selectedColor;
  final Color? iconColor;
  final Color? textColor;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final TextStyle? leadingAndTrailingTextStyle;
  final EdgeInsets? contentPadding;
  final bool enabled;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final void Function(bool)? onFocusChange;
  final MouseCursor? mouseCursor;
  final bool selected;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? splashColor;
  final FocusNode? focusNode;
  final bool autofocus;
  final Color? tileColor;
  final Color? selectedTileColor;
  final bool? enableFeedback;
  final double? horizontalTitleGap;
  final double? minVerticalPadding;
  final double? minLeadingWidth;
  final double? minTileHeight;
  final ListTileTitleAlignment? titleAlignment;
  final bool internalAddSemanticForOnTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: key,
      style: style,
      title: title,
      onTap: onTap,
      dense: dense,
      shape: shape,
      leading: leading,
      enabled: enabled,
      trailing: trailing,
      subtitle: subtitle,
      selected: selected,
      autofocus: autofocus,
      tileColor: tileColor,
      iconColor: iconColor,
      textColor: textColor,
      focusNode: focusNode,
      focusColor: focusColor,
      hoverColor: hoverColor,
      onLongPress: onLongPress,
      splashColor: splashColor,
      isThreeLine: isThreeLine,
      mouseCursor: mouseCursor,
      visualDensity: visualDensity,
      selectedColor: selectedColor,
      minTileHeight: minTileHeight,
      onFocusChange: onFocusChange,
      contentPadding: contentPadding,
      titleTextStyle: titleTextStyle,
      titleAlignment: titleAlignment,
      enableFeedback: enableFeedback,
      minLeadingWidth: minLeadingWidth,
      selectedTileColor: selectedTileColor,
      subtitleTextStyle: subtitleTextStyle,
      minVerticalPadding: minVerticalPadding,
      horizontalTitleGap: horizontalTitleGap,
      leadingAndTrailingTextStyle: leadingAndTrailingTextStyle,
      internalAddSemanticForOnTap: internalAddSemanticForOnTap,
    );
  }
}
