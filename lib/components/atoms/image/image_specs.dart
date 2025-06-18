import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';
import '../../../theme/theme_data.dart';
import 'image_component.dart';
import 'image_style.dart';

part 'image_style_set.dart';

class ImageSpecs extends ImageComponent {
  const ImageSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    required super.path,
    super.height,
    super.width,
    super.fit,
    super.errorWidget,
    super.onTap,
  });

  /// Estilo padrão
  static LabelStyles get standardStyle {
    return LabelStyles(
      regular: ImageStyle(),
      shared: ImageSharedStyle(
        loadingStyle: LoadingStyle(
          size: Size.zero,
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: ImageStyle(),
      error: ImageStyle(),
    );
  }
}
