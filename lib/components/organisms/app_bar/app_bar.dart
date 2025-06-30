import 'package:flutter/material.dart';

class RAppBar extends StatelessWidget {
  RAppBar({
    Key? key,
    this.backgroundColor,
    this.title,
    this.leading,
    this.actions,
    this.centerTitle,
  }) : super(key: key);

  final Color? backgroundColor;
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool? centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: title,
      leading: leading,
      actions: actions,
      centerTitle: centerTitle,
    );
  }
}
