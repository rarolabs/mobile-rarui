part of 'circular_progress_specs.dart';

enum CircularProgressStyleSet {
  small12Gray2Style,
  small12SuccessColorBaseStyle,
  small12ErrorColorBaseStyle,
  small12PrimaryColorBaseStyle,
  large85Gray2Style;

  const CircularProgressStyleSet();

  QCircularProgressStyles get specs {
    return switch (this) {
      small12Gray2Style => CircularProgressSpecs.small12Gray2Style,
      small12SuccessColorBaseStyle => CircularProgressSpecs.small12SuccessColorBaseStyle,
      small12ErrorColorBaseStyle => CircularProgressSpecs.small12ErrorColorBaseStyle,
      small12PrimaryColorBaseStyle => CircularProgressSpecs.small12PrimaryColorBaseStyle,
      large85Gray2Style => CircularProgressSpecs.large85Gray2Style,
    };
  }
}
