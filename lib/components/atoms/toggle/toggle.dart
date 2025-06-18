import 'toggle_specs.dart';

class QToggle extends ToggleSpecs {
  /// Style configuration for [UToggle]
  final ToggleStyleSet style;

  const QToggle({
    required this.style,
    super.key,
    required super.behaviour,
    required super.initialValue,
    required super.onChanged,
    super.labelSemantics,
    super.hintSemantics,
  }) : super(styles: style);

//QToggle na cor Secundary quando ativo(true) e cinza quando (false)
  const QToggle.secundaryColor({
    super.key,
    required super.behaviour,
    required super.initialValue,
    required super.onChanged,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = ToggleStyleSet.secundaryColor,
        super(
          styles: ToggleStyleSet.secundaryColor,
        );
}
