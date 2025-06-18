part of 'divider_specs.dart';

enum DividerStyleSet {
  standard;

  const DividerStyleSet();

  DividerStyles get specs {
    return switch (this) {
      standard => DividerSpecs.standard,
    };
  }
}
