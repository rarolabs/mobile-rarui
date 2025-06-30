import 'package:flutter/material.dart';

class RSliverAppBarLarge extends StatelessWidget {
  RSliverAppBarLarge({
    Key? key,
    this.backgroundColor,
    this.title,
    this.leading,
    this.actions,
    this.centerTitle,
    this.pinned = false,
    this.expandedHeight,
  }) : super(key: key);

  final Color? backgroundColor;
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool? centerTitle;
  final bool pinned;
  final double? expandedHeight;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      backgroundColor: backgroundColor,
      title: title,
      leading: leading,
      actions: actions,
      centerTitle: centerTitle,
      expandedHeight: expandedHeight,
      pinned: pinned,
    );
  }
}
