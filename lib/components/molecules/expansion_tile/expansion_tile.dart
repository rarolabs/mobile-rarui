import 'package:flutter/material.dart';

class RExpansionTile extends StatelessWidget {
  const RExpansionTile({
    super.key,
    required this.title,
    this.backgroundColor,
    this.childrenPadding,
    this.collapsedBackgroundColor,
    this.clipBehavior,
    this.collapsedIconColor,
    this.collapsedShape,
    this.collapsedTextColor,
    this.collapsedTextStyle,
    this.textStyle,
    this.subtitleTextStyle,
    this.trailingTextStyle,
    this.leading,
    this.maintainState = false,
    this.minTileHeight,
    this.showTrailingIcon = true,
    this.subtitle,
    this.textColor,
    this.visualDensity,
    this.shape,
    this.tilePadding,
    this.trailing,
    required this.children,
    this.initiallyExpanded = false,
    this.enabled = true,
    this.dense,
    this.enableFeedback,
    this.expandedAlignment,
    this.expandedCrossAxisAlignment,
    this.expansionAnimationStyle,
    this.internalAddSemanticForOnTap = false,
    this.controller,
    this.expansionTileTheme,
    this.controlAffinity,
    this.onExpansionChanged,
    this.iconColor,
  });

  final Widget title;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? childrenPadding;
  final Color? collapsedBackgroundColor;
  final Clip? clipBehavior;
  final Color? collapsedIconColor;
  final ShapeBorder? collapsedShape;
  final Color? collapsedTextColor;
  final TextStyle? collapsedTextStyle;
  final TextStyle? textStyle;
  final TextStyle? subtitleTextStyle;
  final TextStyle? trailingTextStyle;
  final Widget? leading;
  final bool maintainState;
  final double? minTileHeight;
  final bool showTrailingIcon;
  final Widget? subtitle;
  final Color? textColor;
  final VisualDensity? visualDensity;
  final ShapeBorder? shape;
  final EdgeInsetsGeometry? tilePadding;
  final Widget? trailing;
  final List<Widget> children;
  final bool initiallyExpanded;
  final bool enabled;
  final bool? dense;
  final bool? enableFeedback;
  final Alignment? expandedAlignment;
  final CrossAxisAlignment? expandedCrossAxisAlignment;
  final AnimationStyle? expansionAnimationStyle;
  final bool internalAddSemanticForOnTap;
  final ExpansibleController? controller;
  final ExpansionTileThemeData? expansionTileTheme;
  final ListTileControlAffinity? controlAffinity;
  final void Function(bool)? onExpansionChanged;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      key: key,
      title: title,
      backgroundColor: backgroundColor,
      childrenPadding: childrenPadding,
      collapsedBackgroundColor: collapsedBackgroundColor,
      clipBehavior: clipBehavior,
      collapsedIconColor: collapsedIconColor,
      collapsedShape: collapsedShape,
      collapsedTextColor: collapsedTextColor,
      controlAffinity: controlAffinity,
      controller: controller,
      dense: dense,
      enableFeedback: enableFeedback,
      enabled: enabled,
      expandedAlignment: expandedAlignment,
      expandedCrossAxisAlignment: expandedCrossAxisAlignment,
      expansionAnimationStyle: expansionAnimationStyle,
      internalAddSemanticForOnTap: internalAddSemanticForOnTap,
      initiallyExpanded: initiallyExpanded,
      onExpansionChanged: onExpansionChanged,
      iconColor: iconColor,
      leading: leading,
      maintainState: maintainState,
      minTileHeight: minTileHeight,
      showTrailingIcon: showTrailingIcon,
      subtitle: subtitle,
      textColor: textColor,
      visualDensity: visualDensity,
      shape: shape,
      tilePadding: tilePadding,
      trailing: trailing,
      children: children,
    );
  }
}
