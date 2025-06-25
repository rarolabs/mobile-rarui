import 'example_material_specs.dart';
import 'example_material_style.dart';

enum ExampleMaterialStyleSet {
  regular;

  const ExampleMaterialStyleSet();

  ExampleMaterialStyles get specs {
    return switch (this) {
      regular => ExampleMaterialSpecs.regularStyle,
    };
  }
}
