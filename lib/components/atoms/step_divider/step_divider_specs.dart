import 'dart:ui';

import '../../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import 'step_divider_component.dart';
import 'step_divider_style.dart';

part 'step_divider_style_set.dart';

class StepDividerSpecs extends StepDividerComponent {
  const StepDividerSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
  });

  static StepDividerStyles get standardStyle {
    return StepDividerStyles(
      shared: StepDividerSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x44, QSizes.x24),
          baseColor: QTheme.colors.gray1,
          highlightColor: QTheme.colors.gray2,
        ),
      ),
      regular: StepDividerStyle(
        backgroundColors: [
          QTheme.colors.secondaryColorBase,
          QTheme.colors.secondaryColorBase,
        ],
      ),
      disable: StepDividerStyle(
        backgroundColors: [
          QTheme.colors.gray2,
          QTheme.colors.gray2,
        ],
      ),
      processing: StepDividerStyle(
        backgroundColors: [
          QTheme.colors.otpColor,
          QTheme.colors.otpColor.withValues(alpha: 0.0),
        ],
      ),
    );
  }
}
