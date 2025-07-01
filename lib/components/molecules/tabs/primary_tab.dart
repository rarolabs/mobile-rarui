import 'package:flutter/material.dart';
import 'package:rarUI/components/atoms/badge/badge.dart';

class RPrimaryTab extends StatelessWidget {
  const RPrimaryTab({
    super.key,
    required this.label,
    this.icon,
    this.badgeColor,
    this.badgeText,
    this.badgeTextColor,
  });

  final String label;
  final Widget? icon;
  final Color? badgeColor;
  final Color? badgeTextColor;
  final String? badgeText;

  Widget buildIcon() {
    if (badgeText != null && icon != null) {
      return RBadge(
        text: badgeText,
        backgroundColor: badgeColor,
        child: icon ?? SizedBox(),
      );
    } else {
      return icon ?? SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: buildIcon(),
      text: label,
    );
  }
}
