import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import 'pin_input_component.dart';
import 'pin_input_style.dart';

part 'pin_input_style_set.dart';

class PinInputSpecs extends PinInputComponent {
  const PinInputSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    super.length,
    super.autofocus,
    super.obscureText,
    super.onCompleted,
    super.textSemantics,
    super.hintSemantics,
    super.textEditingController,
  });

  static PinInputStyles get h2Lato32BoldStyle {
    return PinInputStyles(
      shared: PinInputSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x348, QSizes.x68),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      regular: PinInputStyle(
        textStyle: QTheme.fonts.h2Lato32Bold.copyWith(color: QTheme.colors.primaryColorBase),
      ),
      disabled: PinInputStyle(
        textStyle: QTheme.fonts.h2Lato32Bold.copyWith(color: QTheme.colors.gray3),
      ),
    );
  }
}
