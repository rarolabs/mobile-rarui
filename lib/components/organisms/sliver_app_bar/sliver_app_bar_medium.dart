import 'package:flutter/material.dart';

class RSliverAppBarMedium extends StatelessWidget {
  RSliverAppBarMedium({
    Key? key,
    this.backgroundColor,
    this.title,
    this.titleTextStyle,
    this.leading,
    this.flexibleSpace,
    this.actions,
    this.centerTitle,
    this.pinned = false,
    this.expandedHeight,
    this.scrolledUnderElevation,
  }) : super(key: key);

  final Color? backgroundColor;
  final Widget? title;
  final TextStyle? titleTextStyle;
  final Widget? leading;
  final Widget? flexibleSpace;
  final List<Widget>? actions;
  final bool? centerTitle;
  final bool pinned;
  final double? expandedHeight;
  final double? scrolledUnderElevation;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.medium(
      backgroundColor: backgroundColor,
      title: title,
      titleTextStyle: titleTextStyle,
      scrolledUnderElevation: scrolledUnderElevation,
      leading: leading,
      actions: actions,
      centerTitle: centerTitle,
      expandedHeight: expandedHeight,
      flexibleSpace: flexibleSpace,
      pinned: pinned,
    );
  }
}
