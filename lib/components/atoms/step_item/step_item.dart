import 'step_item_specs.dart';

class QStepItem extends StepItemSpecs {
  /// Style configuration for [QStepItem]
  final StepItemStyleSet style;

  const QStepItem({
    required this.style,
    required super.behaviour,
    required super.stepNumber,
    super.key,
  }) : super(styles: style);

  const QStepItem.standard({
    required super.behaviour,
    required super.stepNumber,
    super.key,
  })  : style = StepItemStyleSet.standard,
        super(
          styles: StepItemStyleSet.standard,
        );

  const QStepItem.completed({
    required super.behaviour,
    required super.stepNumber,
    super.key,
  })  : style = StepItemStyleSet.completed,
        super(
          styles: StepItemStyleSet.completed,
        );
}
