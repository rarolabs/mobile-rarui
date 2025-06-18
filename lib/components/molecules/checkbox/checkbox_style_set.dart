part of 'checkbox_specs.dart';

enum CheckboxStyleSet {
  regular;

  const CheckboxStyleSet();

  CheckboxStyles get specs {
    return switch (this) {
      regular => CheckboxSpecs.regular,
    };
  }
}
