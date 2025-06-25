import 'example_material_specs.dart';
import 'example_material_style_set.dart';

class QExampleMaterialPage extends ExampleMaterialSpecs {
  final ExampleMaterialStyleSet style;

  const QExampleMaterialPage({
    super.key,
    required super.behaviour,
    required this.style,
    super.semanticsLabel,
    super.semanticsHint,
  }) : super(styles: style);

  QExampleMaterialPage.regular({
    super.key,
    required super.behaviour,
    super.semanticsLabel,
    super.semanticsHint,
  })  : style = ExampleMaterialStyleSet.regular,
        super(
          styles: ExampleMaterialStyleSet.regular,
        );
}
