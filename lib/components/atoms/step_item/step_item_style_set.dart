part of 'step_item_specs.dart';

enum StepItemStyleSet {
  completed,
  standard;

  const StepItemStyleSet();

  StepItemStyles get specs {
    return switch (this) {
      standard => StepItemSpecs.standardStyle,
      completed => StepItemSpecs.completedStyle,
    };
  }
}
