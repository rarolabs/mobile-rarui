import 'current_balance_specs.dart';

class QCurrentBalance extends CurrentBalanceSpecs {
  /// Style configuration for [QCurrentBalance]
  final CurrentBalanceStyleSet style;

  const QCurrentBalance({
    required this.style,
    super.key,
    required super.behaviour,
    required super.value,
    required super.title,
    super.isHidden,
    super.hintSemantics,
    super.labelSemantics,
  }) : super(styles: style);

  const QCurrentBalance.regular({
    super.key,
    required super.behaviour,
    required super.value,
    required super.title,
    super.isHidden,
    super.hintSemantics,
    super.labelSemantics,
  })  : style = CurrentBalanceStyleSet.regular,
        super(styles: CurrentBalanceStyleSet.regular);
}
