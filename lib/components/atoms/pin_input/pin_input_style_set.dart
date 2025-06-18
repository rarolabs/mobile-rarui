part of 'pin_input_specs.dart';

enum PinInputStyleSet {
  h2Lato32Bold;

  const PinInputStyleSet();

  PinInputStyles get specs {
    return switch (this) {
      h2Lato32Bold => PinInputSpecs.h2Lato32BoldStyle,
    };
  }
}
