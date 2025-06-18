import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';

class BottomSheetSharedStyle {
  final LoadingStyle loadingStyle;

  BottomSheetSharedStyle({required this.loadingStyle});
}

class BottomSheetStyle {
  final EdgeInsets paddingBottomSheet;
  final EdgeInsets titlePadding;
  final EdgeInsets primaryButtonPadding;
  final EdgeInsets secondaryButtonPadding;
  final Color backgroundHandle;
  final Color foregroundHandle;
  final Color backgroundColor;

  BottomSheetStyle({
    required this.paddingBottomSheet,
    required this.titlePadding,
    required this.primaryButtonPadding,
    required this.secondaryButtonPadding,
    required this.backgroundHandle,
    required this.foregroundHandle,
    required this.backgroundColor,
  });
}

class BottomSheetStyles {
  final BottomSheetSharedStyle shared;
  final BottomSheetStyle regular;

  BottomSheetStyles({required this.shared, required this.regular});
}
