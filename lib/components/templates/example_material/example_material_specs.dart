import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/tokens.dart';
import 'example_material_component.dart';
import 'example_material_style.dart';

class ExampleMaterialSpecs extends ExampleMaterialComponent {
  const ExampleMaterialSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    super.semanticsLabel,
    super.semanticsHint,
  });

  static ExampleMaterialStyles get regularStyle {
    return ExampleMaterialStyles(
      sharedStyle: ExampleMaterialSharedStyle(
        loadingStyle: LoadingStyle(
          size: Size.zero,
          baseColor: QTheme.colors.transparent,
          highlightColor: QTheme.colors.transparent,
        ),
      ),
      regular: ExampleMaterialStyle(),
    );
  }
}
