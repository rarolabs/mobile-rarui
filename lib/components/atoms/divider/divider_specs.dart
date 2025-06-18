import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';
import '../../../theme/theme_data.dart';
import 'divider_component.dart';
import 'divider_style.dart';

part 'divider_style_set.dart';

class DividerSpecs extends DividerComponent {
  ///
  ///[styles] Estilos do componente
  ///[value] Value do Switch
  ///[onChanged] Função quando clicado
  ///
  const DividerSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    super.labelSemantics,
    super.hintSemantics,
  });

  /// Usado para Switch com cor secondary
  static DividerStyles get standard {
    const height = 1.0;
    const thickness = 1.0;
    return DividerStyles(
      regular: DividerStyle(
        color: QTheme.colors.black.withAlpha(25),
        thickness: thickness,
        height: height,
      ),
      shared: DividerSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size.fromHeight(height),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: DividerStyle(
        color: QTheme.colors.gray1,
      ),
    );
  }
}
