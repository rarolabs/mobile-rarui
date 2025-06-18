part of 'toggle_specs.dart';

enum ToggleStyleSet {
  secundaryColor;

  const ToggleStyleSet();

  ToggleStyles get specs {
    return switch (this) {
      secundaryColor => ToggleSpecs.secundaryColor,
    };
  }
}
