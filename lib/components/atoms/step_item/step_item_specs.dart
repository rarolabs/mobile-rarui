import 'dart:ui';

import '../../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import 'step_item_component.dart';
import 'step_item_style.dart';

part 'step_item_style_set.dart';

class StepItemSpecs extends StepItemComponent {
  const StepItemSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    required super.stepNumber,
  });

  static StepItemStyles get standardStyle {
    return StepItemStyles(
      shared: StepItemSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x44, QSizes.x24),
          baseColor: QTheme.colors.gray1,
          highlightColor: QTheme.colors.gray2,
        ),
      ),
      regular: StepItemStyle(
        textColor: QTheme.colors.white,
        backgroundColor: QTheme.colors.secondaryColorBase,
      ),
      disabled: StepItemStyle(
        textColor: QTheme.colors.gray6,
        backgroundColor: QTheme.colors.gray2,
      ),
    );
  }

  static StepItemStyles get completedStyle {
    return StepItemStyles(
      shared: StepItemSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x44, QSizes.x24),
          baseColor: QTheme.colors.gray1,
          highlightColor: QTheme.colors.gray2,
        ),
      ),
      regular: StepItemStyle(
        textColor: QTheme.colors.white,
        backgroundColor: QTheme.colors.secondaryColorBase,
        isCompleted: true,
      ),
      disabled: StepItemStyle(
        textColor: QTheme.colors.gray6,
        backgroundColor: QTheme.colors.gray2,
      ),
    );
  }
}
