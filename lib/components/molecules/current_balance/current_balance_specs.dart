import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../atoms/icon/icon_specs.dart';
import '../../atoms/label/label_specs.dart';
import 'current_balance_component.dart';
import 'current_balance_style.dart';

part 'current_balance_style_set.dart';

class CurrentBalanceSpecs extends CurrentBalanceComponent {
  const CurrentBalanceSpecs({
    super.key,
    required super.value,
    required super.title,
    required super.behaviour,
    required super.styles,
    super.isHidden,
    super.hintSemantics,
    super.labelSemantics,
  });

  /// Renderiza o componente CurrentBalance padrão
  static CurrentBalanceStyles get regular {
    return CurrentBalanceStyles(
      regular: const CurrentBalanceStyle(iconStyle: IconStyleSet.size16Gray5),
      disabled: const CurrentBalanceStyle(iconStyle: IconStyleSet.size16Gray5),
      shared: CurrentBalanceSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(double.maxFinite, QSizes.x44),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
        labelStyle: LabelStyleSet.captionRoboto12Gray5Regular,
      ),
    );
  }
}
