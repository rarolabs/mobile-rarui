part of 'step_indicator_specs.dart';

enum StepIndicatorStyleSet {
  regular;

  const StepIndicatorStyleSet();

  StepIndicatorStyles get specs {
    return switch (this) {
      regular => StepIndicatorSpecs.standard,
    };
  }
}
