import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../atoms/label/label_specs.dart';
import 'radio_button_component.dart';
import 'radio_button_style.dart';

class RadioButtonSpecs extends RadioButtonComponent {
  RadioButtonSpecs({
    super.key,
    required super.styles,
    required super.options,
    required super.onChanged,
    required super.behaviour,
    super.radioBehaviour,
    super.initialOption,
    super.hintSemantics,
    super.labelSemantics,
    super.withDivider = true,
  });

  static QRadioButtonStyles standardStyle() {
    return QRadioButtonStyles(
      shared: QRadioButtonSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      regular: QRadioButtonStyle(
        activeColor: QTheme.colors.secondaryColorBase,
        fillColor: QTheme.colors.gray3,
        radioDisabledColor: QTheme.colors.gray2,
        titleStyle: LabelStyleSet.paragraphRoboto16Gray5Regular,
        subTitleStyle: LabelStyleSet.captionRoboto14Gray3Regular,
      ),
      disabled: QRadioButtonStyle(
        activeColor: QTheme.colors.gray2,
        fillColor: QTheme.colors.gray2,
        radioDisabledColor: QTheme.colors.gray2,
        titleStyle: LabelStyleSet.paragraphRoboto16Gray5Regular,
        subTitleStyle: LabelStyleSet.captionRoboto14Gray3Regular,
      ),
    );
  }

  static QRadioButtonStyles withoutDividerStyle() {
    return QRadioButtonStyles(
      shared: QRadioButtonSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      regular: QRadioButtonStyle(
        activeColor: QTheme.colors.secondaryColorBase,
        fillColor: QTheme.colors.gray3,
        radioDisabledColor: QTheme.colors.gray2,
        titleStyle: LabelStyleSet.bodyRoboto16Gray5Medium,
        subTitleStyle: LabelStyleSet.captionRoboto14Gray3Regular,
      ),
      disabled: QRadioButtonStyle(
        activeColor: QTheme.colors.gray2,
        fillColor: QTheme.colors.gray2,
        radioDisabledColor: QTheme.colors.gray2,
        titleStyle: LabelStyleSet.bodyRoboto16Gray5Medium,
        subTitleStyle: LabelStyleSet.captionRoboto14Gray3Regular,
      ),
    );
  }
}
