import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import 'toggle_component.dart';
import 'toggle_style.dart';

part 'toggle_style_set.dart';

class ToggleSpecs extends ToggleComponent {
  ///
  ///[styles] Estilos do componente
  ///[value] Value do Switch
  ///[onChanged] Função quando clicado
  ///
  const ToggleSpecs({
    super.key,
    required super.behaviour,
    required super.initialValue,
    required super.onChanged,
    required super.styles,
    super.labelSemantics,
    super.hintSemantics,
  });

  /// Usado para Switch com cor secondary
  static ToggleStyles get secundaryColor {
    return ToggleStyles(
      regular: ToggleStyle(
        activeTrackColor: QTheme.colors.secondaryColorBase,
        trackColor: QTheme.colors.secondaryColorBase,
      ),
      shared: ToggleSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x44, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: ToggleStyle(
        activeTrackColor: QTheme.colors.gray1,
        trackColor: QTheme.colors.gray2,
      ),
    );
  }
}
