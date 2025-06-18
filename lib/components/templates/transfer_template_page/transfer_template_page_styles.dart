import '../../atoms/label/label_specs.dart';
import '../../molecules/button/button_specs.dart';
import '../../molecules/money_input/money_input_specs.dart';

class TransferTemplatePageSharedStyle {
  final MoneyInputStyleSet moneyInputStyle;
  final LabelStyleSet moneyInputLabelStyle;
  final LabelStyleSet moneyInputDescriptionStyle;
  final LabelStyleSet moneyAccountBalanceStyle;
  final ButtonStyleSet primaryButtonStyle;
  final ButtonStyleSet secondaryButtonStyle;

  TransferTemplatePageSharedStyle({
    required this.moneyInputStyle,
    required this.moneyInputLabelStyle,
    required this.moneyInputDescriptionStyle,
    required this.moneyAccountBalanceStyle,
    required this.primaryButtonStyle,
    required this.secondaryButtonStyle,
  });

  TransferTemplatePageSharedStyle copyWith({
    MoneyInputStyleSet? moneyInputStyle,
    LabelStyleSet? moneyInputLabelStyle,
    LabelStyleSet? moneyInputDescriptionStyle,
    LabelStyleSet? moneyAccountBalanceStyle,
    ButtonStyleSet? primaryButtonStyle,
    ButtonStyleSet? secondaryButtonStyle,
  }) {
    return TransferTemplatePageSharedStyle(
      moneyInputStyle: moneyInputStyle ?? this.moneyInputStyle,
      moneyInputLabelStyle: moneyInputLabelStyle ?? this.moneyInputLabelStyle,
      moneyInputDescriptionStyle: moneyInputDescriptionStyle ?? this.moneyInputDescriptionStyle,
      moneyAccountBalanceStyle: moneyAccountBalanceStyle ?? this.moneyAccountBalanceStyle,
      primaryButtonStyle: primaryButtonStyle ?? this.primaryButtonStyle,
      secondaryButtonStyle: secondaryButtonStyle ?? this.secondaryButtonStyle,
    );
  }
}

class TransferTemplatePageStyle {
  final LabelStyleSet titleStyle;
  final LabelStyleSet subtitleStyle;

  TransferTemplatePageStyle({
    required this.titleStyle,
    required this.subtitleStyle,
  });

  TransferTemplatePageStyle copyWith({
    LabelStyleSet? titleStyle,
    LabelStyleSet? subtitleStyle,
  }) {
    return TransferTemplatePageStyle(
      titleStyle: titleStyle ?? this.titleStyle,
      subtitleStyle: subtitleStyle ?? this.subtitleStyle,
    );
  }
}

class TransferTemplatePageStyles {
  TransferTemplatePageSharedStyle shared;
  TransferTemplatePageStyle regular;

  TransferTemplatePageStyles({
    required this.shared,
    required this.regular,
  });
}
