import '../../atoms/label/label_specs.dart';
import 'money_input_specs.dart';

class QMoneyInput extends MoneyInputSpecs {
  /// Style configuration for [QMoneyInput]
  final MoneyInputStyleSet style;

  const QMoneyInput({
    required this.style,
    super.key,
    required super.behaviour,
    required super.labelStyle,
    required super.formFieldKey,
    required super.label,
    super.accountBalance,
    super.initialValue,
    super.coinType,
    super.onValueChange,
    super.icon,
    super.onIconTap,
    super.enabled,
    super.controller,
    super.hintLabel,
    super.hintSemantics,
    super.hintAccountBalanceLabel,
    super.minValue,
    super.maxValue,
    super.errorText,
  }) : super(styles: style);

  const QMoneyInput.standard({
    super.key,
    required super.behaviour,
    required super.formFieldKey,
    required super.label,
    super.accountBalance,
    super.initialValue,
    super.coinType,
    super.onValueChange,
    super.enabled,
    super.controller,
    super.hintLabel,
    super.hintSemantics,
    super.errorText,
  })  : style = MoneyInputStyleSet.standard,
        super(
          styles: MoneyInputStyleSet.standard,
          labelStyle: LabelStyleSet.h2Lato32Gray5Bold,
        );

  const QMoneyInput.standardWithoutLabel({
    super.key,
    required super.behaviour,
    required super.formFieldKey,
    super.initialValue,
    super.coinType,
    super.onValueChange,
    super.enabled,
    super.controller,
    super.hintLabel,
    super.hintSemantics,
    super.minValue,
    super.maxValue,
    super.errorText,
  })  : style = MoneyInputStyleSet.standard,
        super(
          styles: MoneyInputStyleSet.standard,
          labelStyle: LabelStyleSet.h2Lato32Gray5Bold,
        );

  const QMoneyInput.transfer({
    super.key,
    required super.behaviour,
    required super.formFieldKey,
    required super.label,
    required super.icon,
    required super.onIconTap,
    super.accountBalance,
    super.initialValue,
    super.coinType,
    super.enabled,
    super.controller,
    super.hintLabel,
    super.hintSemantics,
    super.minValue,
    super.maxValue,
    super.errorText,
  })  : style = MoneyInputStyleSet.transferencia,
        super(
          styles: MoneyInputStyleSet.transferencia,
          labelStyle: LabelStyleSet.h2Lato32Gray5Bold,
        );

  /// Usado para inputs de transferência com o divider na cor [primaryBase]
  const QMoneyInput.transferBaseColor({
    super.key,
    required super.behaviour,
    required super.formFieldKey,
    required super.label,
    super.accountBalance,
    super.icon,
    super.onIconTap,
    super.initialValue,
    super.coinType,
    super.onValueChange,
    super.enabled,
    super.controller,
    super.hintLabel,
    super.hintSemantics,
    super.hintAccountBalanceLabel,
    super.minValue,
    super.maxValue,
    super.errorText,
  })  : style = MoneyInputStyleSet.transferenciaBaseColor,
        super(
          styles: MoneyInputStyleSet.transferenciaBaseColor,
          labelStyle: LabelStyleSet.h2Lato32Gray5Bold,
        );

  /// Usado para inputs de transferência com o description roboto 12 na cor [gray5]
  const QMoneyInput.withDescriptionInCaption12Gray5({
    super.key,
    required super.behaviour,
    required super.formFieldKey,
    super.accountBalance,
    super.icon,
    super.onIconTap,
    super.initialValue,
    super.coinType,
    super.onValueChange,
    super.enabled,
    super.controller,
    super.hintLabel,
    super.hintSemantics,
    super.hintAccountBalanceLabel,
    super.minValue,
    super.maxValue,
    super.errorText,
  })  : style = MoneyInputStyleSet.withDescriptionInCaption12Gray5,
        super(
          styles: MoneyInputStyleSet.withDescriptionInCaption12Gray5,
          labelStyle: LabelStyleSet.captionRoboto12Gray5Regular,
        );
}
