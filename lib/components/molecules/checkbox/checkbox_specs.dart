import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../atoms/label/label_specs.dart';
import 'checkbox_component.dart';
import 'checkbox_style.dart';

part 'checkbox_style_set.dart';

class CheckboxSpecs extends CheckboxComponent {
  const CheckboxSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    required super.title,
    super.isChecked,
    super.onChanged,
    super.hintSemantics,
    super.labelSemantics,
  });

  /// Renderiza o componente de Checkbox padrão
  static CheckboxStyles get regular {
    return CheckboxStyles(
      regular: CheckboxStyle(
        selectedColor: QTheme.colors.secondaryColorBase,
        unselectedColor: QTheme.colors.gray3,
        iconColor: QTheme.colors.white,
        borderColor: QTheme.colors.transparent,
      ),
      disabled: CheckboxStyle(
        selectedColor: QTheme.colors.secondaryColorBase,
        unselectedColor: QTheme.colors.gray3,
        iconColor: QTheme.colors.white,
        borderColor: QTheme.colors.transparent,
      ),
      shared: CheckboxSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.maxFinite, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
        labelStyle: LabelStyleSet.captionRoboto14Gray4Regular,
      ),
    );
  }
}
