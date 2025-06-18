import '../../../shared_widget/loading_styles.dart';
import '../../atoms/label/label_specs.dart';
import '../../molecules/button/button_specs.dart';

class StateSuccessPageSharedStyle {
  final LoadingStyle loadingStyle;

  const StateSuccessPageSharedStyle({
    required this.loadingStyle,
  });
}

class StateSuccessPageStyle {
  final ButtonStyleSet buttonStyle;
  final LabelStyleSet titleStyle;
  final LabelStyleSet countingStyle;

  const StateSuccessPageStyle({
    required this.buttonStyle,
    required this.titleStyle,
    required this.countingStyle,
  });
}

class StateSuccessPageStyles {
  final StateSuccessPageSharedStyle shared;
  final StateSuccessPageStyle regular;

  const StateSuccessPageStyles({
    required this.shared,
    required this.regular,
  });
}
