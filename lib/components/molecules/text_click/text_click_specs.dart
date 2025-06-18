import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../atoms/label/label_specs.dart';
import 'text_click_component.dart';
import 'text_click_style.dart';

class TextClickSpecs extends TextClickComponent {
  const TextClickSpecs({
    super.key,
    required super.styles,
    required super.text,
    required super.behaviour,
    super.initialValue,
    super.showCheckbox,
    super.onCheckboxChange,
    super.hintSemantics,
    super.labelSemantics,
  });

  /// Representa o estilo do componente com ícone de tamanho 28 e cor Gray5
  static TextClickStyles get standardStyle {
    return TextClickStyles(
      shared: TextClickSharedStyle(
        titleFormat: LabelStyleSet.paragraphRoboto16Gray5Bold,
        subtitleFormat: LabelStyleSet.paragraphRoboto16Gray5Bold,
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x48),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      regular: TextClickStyle(),
    );
  }
}
