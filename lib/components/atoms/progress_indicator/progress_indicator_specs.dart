import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import 'progress_indicator_component.dart';
import 'progress_indicator_style.dart';

part 'progress_indicator_style_set.dart';

class ProgressIndicatorSpecs extends ProgressIndicatorComponent {
  ///
  ///[styles] Estilos do componente
  ///[progress] Valor do progresso
  ///
  const ProgressIndicatorSpecs({
    super.key,
    required super.behaviour,
    required super.progress,
    required super.styles,
    super.labelSemantics,
    super.hintSemantics,
  });

  /// Usado para progresse com cor secondary
  static ProgressIndicatorStyles get progressIndicatorSecondaryColor {
    return ProgressIndicatorStyles(
      regular: ProgressIndicatorStyle(
        progressColor: QTheme.colors.secondaryColorBase,
        height: QSizes.x4,
      ),
      shared: ProgressIndicatorSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x4),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: ProgressIndicatorStyle(
        progressColor: QTheme.colors.gray2,
        backgroundColor: QTheme.colors.gray1,
        height: QSizes.x4,
      ),
    );
  }
}
