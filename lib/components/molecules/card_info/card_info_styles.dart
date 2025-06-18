import '../../../shared_widget/loading_styles.dart';
import '../../atoms/image/image_specs.dart';
import '../../atoms/label/label_specs.dart';

class CardInfoSharedStyle {
  final LoadingStyle loadingStyle;
  final ImageStyleSet imageStyleSet;
  final LabelStyleSet titleStyle;
  final LabelStyleSet subtitleStyle;

  CardInfoSharedStyle({
    required this.loadingStyle,
    required this.imageStyleSet,
    required this.titleStyle,
    required this.subtitleStyle,
  });
}

class CardInfoStyle {}

class CardInfoStyles {
  final CardInfoStyle regular;
  final CardInfoSharedStyle shared;

  CardInfoStyles({
    required this.regular,
    required this.shared,
  });
}
