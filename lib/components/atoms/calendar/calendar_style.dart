import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';

class CalendarSharedStyle {
  final LoadingStyle loadingStyle;

  CalendarSharedStyle({required this.loadingStyle});
}

class CalendarStyle {
  final TextStyle monthStyle;
  final TextStyle dayOfWeekStyle;
  final TextStyle dateStyle;
  final Color selectedColor;
  final Color textSelectedColor;
  final Color textDisabledColor;
  final Color backgroundColor;
  final Color borderColor;
  final Color iconActiveColor;
  final Color iconDisableColor;
  final Color disabledColor;

  CalendarStyle({
    required this.monthStyle,
    required this.dayOfWeekStyle,
    required this.dateStyle,
    required this.selectedColor,
    required this.textSelectedColor,
    required this.textDisabledColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.iconActiveColor,
    required this.iconDisableColor,
    required this.disabledColor,
  });
}

class CalendarStyles {
  final CalendarSharedStyle shared;
  final CalendarStyle regular;
  final CalendarStyle disabled;

  CalendarStyles({
    required this.shared,
    required this.regular,
    required this.disabled,
  });
}
