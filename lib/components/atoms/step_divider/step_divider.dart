import 'step_divider_specs.dart';

class QStepDivider extends StepDividerSpecs {
  /// Style configuration for [QStepDivider]
  final StepDividerStyleSet style;

  const QStepDivider({
    required this.style,
    super.key,
    required super.behaviour,
  }) : super(styles: style);

  //QStepDivider padrão
  const QStepDivider.standard({
    super.key,
    required super.behaviour,
  })  : style = StepDividerStyleSet.standard,
        super(
          styles: StepDividerStyleSet.standard,
        );
}
