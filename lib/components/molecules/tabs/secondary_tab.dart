import 'package:flutter/material.dart';
import 'package:rarui/components/atoms/badge/badge.dart';

class RSecondaryTab extends StatelessWidget {
  const RSecondaryTab({
    super.key,
    required this.label,
    this.badgeColor,
    this.badgeText,
    this.badgeTextColor,
  });

  final String label;
  final Color? badgeColor;
  final Color? badgeTextColor;
  final String? badgeText;

  Widget buildContent() {
    if (badgeText != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label),
          const SizedBox(width: 16),
          RBadge(
            text: badgeText,
            backgroundColor: badgeColor,
            child: const SizedBox(height: 8),
          )
        ],
      );
    } else {
      return Text(label);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: buildContent(),
    );
  }
}
