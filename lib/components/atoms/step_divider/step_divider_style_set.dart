part of 'step_divider_specs.dart';

enum StepDividerStyleSet {
  standard;

  const StepDividerStyleSet();

  StepDividerStyles get specs {
    return switch (this) {
      standard => StepDividerSpecs.standardStyle,
    };
  }
}
