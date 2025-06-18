import 'dart:ui';

import '../../../../shared_widget/loading_styles.dart';

class IconSharedStyle {
  final LoadingStyle loadingStyle;

  IconSharedStyle({
    required this.loadingStyle,
  });
}

class IconStyle {
  final double size;
  final Color iconColor;

  IconStyle({
    required this.size,
    required this.iconColor,
  });
}

class IconStyles {
  final IconSharedStyle shared;
  final IconStyle regular;
  final IconStyle disabled;

  IconStyles({
    required this.shared,
    required this.regular,
    required this.disabled,
  });
}
