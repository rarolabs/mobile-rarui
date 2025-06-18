import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';

class QBottomNavigationSharedStyle {
  final LoadingStyle loadingStyle;

  const QBottomNavigationSharedStyle({
    required this.loadingStyle,
  });
}

class QBottomNavigationStyle {
  final Color backgroundColor;
  final Color indicatorColor;
  final double height;
  final NavigationDestinationLabelBehavior labelBehaviour;

  const QBottomNavigationStyle({
    required this.backgroundColor,
    required this.indicatorColor,
    required this.height,
    this.labelBehaviour = NavigationDestinationLabelBehavior.alwaysHide,
  });
}

class QBottomNavigationStyles {
  final QBottomNavigationSharedStyle shared;
  final QBottomNavigationStyle regular;
  final QBottomNavigationStyle disabled;

  QBottomNavigationStyles({
    required this.shared,
    required this.regular,
    required this.disabled,
  });
}
