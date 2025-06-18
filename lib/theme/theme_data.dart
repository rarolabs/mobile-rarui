import 'package:flutter/material.dart';

import 'colors.dart';
import 'svgs.dart';
import 'typography.dart';

abstract class QTheme {
  static IColors _colors = QColors();
  static IColors get colors => _colors;
  static ITypography get fonts => QTypography();
  static ISvgs get svgs => QSvgs();

  static void setColors(Map<String, Color> colorsMap) => _colors = QColors(colors: colorsMap);
}
