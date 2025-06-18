import 'divider_specs.dart';

class QDivider extends DividerSpecs {
  /// Style configuration for [UToggle]
  final DividerStyleSet style;

  const QDivider({
    required this.style,
    super.key,
    required super.behaviour,
    super.labelSemantics,
    super.hintSemantics,
  }) : super(styles: style);

  //QDivider padrão
  const QDivider.standard({
    super.key,
    required super.behaviour,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = DividerStyleSet.standard,
        super(
          styles: DividerStyleSet.standard,
        );
}
