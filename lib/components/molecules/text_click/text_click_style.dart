import '../../../shared_widget/loading_styles.dart';
import '../../atoms/label/label_specs.dart';

class TextClickSharedStyle {
  final LoadingStyle loadingStyle;

  /// Estilo de texto do título
  final LabelStyleSet titleFormat;

  /// Estilo de texto do subtítulo
  final LabelStyleSet subtitleFormat;

  TextClickSharedStyle({
    required this.loadingStyle,
    required this.titleFormat,
    required this.subtitleFormat,
  });
}

class TextClickStyle {
  TextClickStyle();
}

class TextClickStyles {
  TextClickSharedStyle shared;
  TextClickStyle regular;

  TextClickStyles({
    required this.shared,
    required this.regular,
  });
}
