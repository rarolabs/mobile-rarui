import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/tokens.dart';
import 'slider_component.dart';
import 'slider_style.dart';

part 'slider_style_set.dart';

class SliderSpecs extends SliderComponent {
  const SliderSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    required super.labelStyle,
    super.minValue,
    super.coinType,
    required super.currentValue,
    required super.maxValue,
    required super.onChanged,
    super.divisions,
    super.hintSemantics,
    super.labelSemantics,
  });

  static SliderStyles primaryStyle() {
    return SliderStyles(
      shared: SliderSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.maxFinite, QSizes.x40),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      regular: SliderStyle(
        activedColor: QTheme.colors.primaryColorBase,
        indicatorColor: QTheme.colors.secondaryColorBase,
      ),
      disabled: SliderStyle(
        activedColor: QTheme.colors.gray2,
        indicatorColor: QTheme.colors.gray1,
      ),
    );
  }
}
