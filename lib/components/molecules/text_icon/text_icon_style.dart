import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../atoms/icon/icon_specs.dart';
import '../../atoms/label/label_specs.dart';

class TextIconSharedStyle {
  final LoadingStyle loadingStyle;

  /// Estilo de texto do título
  final LabelStyleSet titleFormat;

  /// Estilo de texto do subtítulo
  final LabelStyleSet subtitleFormat;

  TextIconSharedStyle({
    required this.loadingStyle,
    required this.titleFormat,
    required this.subtitleFormat,
  });
}

class TextIconStyle {
  /// Largura do componente
  final double? width;

  /// Paddings do componente
  final EdgeInsets leftPadding;

  final EdgeInsets topPadding;

  final EdgeInsets rightPadding;

  /// Estilo do Icon
  final IconStyleSet iconStyle;

  const TextIconStyle({
    required this.iconStyle,
    required this.leftPadding,
    required this.topPadding,
    required this.rightPadding,
    this.width,
  });
}

class TextIconStyles {
  final TextIconSharedStyle shared;
  final TextIconStyle regular;

  const TextIconStyles({
    required this.shared,
    required this.regular,
  });
}
