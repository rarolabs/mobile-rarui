import 'package:flutter/material.dart';

class RSliverAppBar extends StatelessWidget {
  RSliverAppBar({
    Key? key,
    this.backgroundColor,
    this.title,
    this.leading,
    this.actions,
    this.flexibleSpace,
    this.centerTitle,
    this.pinned = false,
    this.expandedHeight,
    this.scrolledUnderElevation,
    this.titleTextStyle,
  }) : super(key: key);

  final Color? backgroundColor;
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? flexibleSpace;
  final bool? centerTitle;
  final bool pinned;
  final double? expandedHeight;
  final double? scrolledUnderElevation;
  final TextStyle? titleTextStyle;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: backgroundColor,
      title: title,
      leading: leading,
      actions: actions,
      centerTitle: centerTitle,
      pinned: pinned,
      expandedHeight: expandedHeight,
      flexibleSpace: flexibleSpace,
      scrolledUnderElevation: scrolledUnderElevation,
      titleTextStyle: titleTextStyle,
    );
  }
}
