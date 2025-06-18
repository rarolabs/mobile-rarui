import 'step_indicator_specs.dart';

class QStepIndicator extends StepIndicatorSpecs {
  final StepIndicatorStyleSet style;

  const QStepIndicator({
    required this.style,
    required super.behaviour,
    required super.currentStep,
    required super.totalSteps,
    super.key,
  }) : super(styles: style);
}
