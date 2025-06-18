import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';
import '../../atoms/label/label_specs.dart';

class DropdownMenuSharedStyle {
  final LoadingStyle loadingStyle;

  DropdownMenuSharedStyle({
    required this.loadingStyle,
  });
}

class DropdownMenuStyle {
  final double width;
  final Offset? offset;
  final MenuStyle menuStyle;
  final TextStyle? textStyle;
  final InputDecorationTheme inputDecorationTheme;
  final Color selectedBorderColor;
  final LabelStyleSet labelStyle;
  final ButtonStyle menuItemButtonStyle;

  DropdownMenuStyle({
    required this.width,
    required this.menuStyle,
    required this.inputDecorationTheme,
    required this.selectedBorderColor,
    required this.labelStyle,
    required this.menuItemButtonStyle,
    this.offset,
    this.textStyle,
  });
}

class DropdownMenuStyles {
  final DropdownMenuSharedStyle shared;
  final DropdownMenuStyle regular;
  final DropdownMenuStyle disabled;

  DropdownMenuStyles({
    required this.shared,
    required this.regular,
    required this.disabled,
  });
}
