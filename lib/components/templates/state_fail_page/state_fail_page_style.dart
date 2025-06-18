import '../../../shared_widget/loading_styles.dart';
import '../../atoms/label/label_specs.dart';
import '../../molecules/button/button_specs.dart';

class StateFailPageSharedStyle {
  final LoadingStyle loadingStyle;

  StateFailPageSharedStyle({
    required this.loadingStyle,
  });
}

class StateFailPageStyle {
  final ButtonStyleSet buttonStyle;
  final LabelStyleSet titleStyle;
  final LabelStyleSet descriptionStyle;
  StateFailPageStyle({
    required this.buttonStyle,
    required this.titleStyle,
    required this.descriptionStyle,
  });
}

class StateFailPageStyles {
  StateFailPageSharedStyle shared;
  StateFailPageStyle regular;

  StateFailPageStyles({
    required this.shared,
    required this.regular,
  });
}
