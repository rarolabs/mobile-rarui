import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../atoms/icon/icon_specs.dart';
import '../../atoms/label/label_specs.dart';
import 'card_financial_info_component.dart';
import 'card_financial_info_style.dart';

class CardFinancialInfoSpecs extends CardFinancialInfoComponent {
  const CardFinancialInfoSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    required super.title,
    required super.value,
    required super.limitDescription,
    required super.limitValue,
    required super.visibilityIconPath,
    required super.visibilityOffIconPath,
    super.showValue,
    super.onShowValue,
  });

  static CardFinancialInfoStyles get standard {
    return CardFinancialInfoStyles(
      regular: CardFinancialInfoStyle(
        backgroundColor: QTheme.colors.gray2,
        loadingStyle: LoadingStyle(
          size: const Size(double.maxFinite, QSizes.x348),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      shared: CardFinancialInfoSharedStyle(
        titleStyle: LabelStyleSet.bodyRoboto16Gray4Regular,
        valueStyle: LabelStyleSet.h4Lato24Gray5Bold,
        limitDescriptionStyle: LabelStyleSet.bodyRoboto14Gray5Medium,
        limitValueStyle: LabelStyleSet.bodyRoboto14Gray5SemiBold,
        valueIconStyle: IconStyleSet.size16Gray5,
      ),
    );
  }
}
