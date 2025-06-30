import 'package:flutter/material.dart';

class RBadge extends StatelessWidget {
  RBadge({
    Key? key,
    this.textColor,
    this.backgroundColor,
    this.text,
    required this.child,
  }) : super(key: key);

  final Color? backgroundColor;
  final Color? textColor;
  final String? text;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Badge(
      backgroundColor: backgroundColor,
      textColor: textColor,
      label: Text(text ?? ""),
      child: child,
    );
  }
}
