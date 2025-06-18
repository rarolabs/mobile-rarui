import '../../../theme/theme_data.dart';
import 'card_financial_info_specs.dart';
import 'card_financial_info_style_set.dart';

class QCardFinancialInfo extends CardFinancialInfoSpecs {
  /// Style configurtion for [CardFinancialInfo]
  final CardFinancialInfoStyleSet style;

  const QCardFinancialInfo({
    super.key,
    required super.behaviour,
    required this.style,
    required super.title,
    required super.value,
    required super.limitDescription,
    required super.limitValue,
    required super.visibilityIconPath,
    required super.visibilityOffIconPath,
  }) : super(styles: style);

  /// Standard style for [CardFinancialInfo]
  /// Fundo [Gray1]
  QCardFinancialInfo.standard({
    super.key,
    required super.behaviour,
    required super.title,
    required super.value,
    required super.limitDescription,
    required super.limitValue,
    super.showValue,
    super.onShowValue,
  })  : style = CardFinancialInfoStyleSet.standard,
        super(
          styles: CardFinancialInfoStyleSet.standard,
          visibilityIconPath: QTheme.svgs.visibility,
          visibilityOffIconPath: QTheme.svgs.visibilityHide,
        );
}
