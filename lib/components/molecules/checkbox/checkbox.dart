import 'checkbox_specs.dart';

class QCheckbox extends CheckboxSpecs {
  /// Style configurtion for [QCheckbox]
  final CheckboxStyleSet style;

  const QCheckbox({
    super.key,
    required this.style,
    required super.behaviour,
    required super.title,
    required super.onChanged,
    super.isChecked,
    super.hintSemantics,
    super.labelSemantics,
  }) : super(styles: style);

  const QCheckbox.regular({
    super.key,
    required super.behaviour,
    required super.title,
    super.isChecked,
    super.onChanged,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = CheckboxStyleSet.regular,
        super(styles: CheckboxStyleSet.regular);
}
