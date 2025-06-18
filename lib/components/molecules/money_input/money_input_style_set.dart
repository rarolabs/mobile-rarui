part of 'money_input_specs.dart';

enum MoneyInputStyleSet {
  standard,
  transferencia,
  transferenciaBaseColor,
  withDescriptionInCaption12Gray5;

  const MoneyInputStyleSet();

  MoneyInputStyles get specs => switch (this) {
        standard => MoneyInputSpecs.standardStyle,
        transferencia => MoneyInputSpecs.transferenciaStyle,
        transferenciaBaseColor => MoneyInputSpecs.transferenciaBaseColorStyle,
        withDescriptionInCaption12Gray5 => MoneyInputSpecs.withDescriptionInCaption12Gray5Style,
      };
}
