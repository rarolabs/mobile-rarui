// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../atoms/icon/icon_specs.dart';
import '../../atoms/label/label_specs.dart';

class ToastSharedStyle {
  final LoadingStyle loadingStyle;
  final LabelStyleSet titleStyle;
  final IconStyleSet iconStyleSet;

  ToastSharedStyle({
    required this.loadingStyle,
    required this.titleStyle,
    required this.iconStyleSet,
  });
}

class ToastStyle {
  final EdgeInsets? padding;
  final Color backgroundColor;
  final String? trailingIconPath;

  const ToastStyle({
    this.padding = const EdgeInsets.symmetric(horizontal: QSizes.x16, vertical: QSizes.x12),
    required this.backgroundColor,
    this.trailingIconPath,
  });
}

class ToastStyles {
  final ToastSharedStyle shared;
  final ToastStyle regular;

  ToastStyles({required this.shared, required this.regular});
}
