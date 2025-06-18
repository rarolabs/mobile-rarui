import '../../../../shared_widget/loading_styles.dart';
import '../../atoms/icon/icon_specs.dart';
import '../../atoms/label/label_specs.dart';

class CurrentBalanceSharedStyle {
  final LoadingStyle loadingStyle;
  final LabelStyleSet labelStyle;

  const CurrentBalanceSharedStyle({required this.loadingStyle, required this.labelStyle});
}

class CurrentBalanceStyle {
  final IconStyleSet iconStyle;

  const CurrentBalanceStyle({required this.iconStyle});
}

class CurrentBalanceStyles {
  final CurrentBalanceSharedStyle shared;
  final CurrentBalanceStyle regular;
  final CurrentBalanceStyle disabled;

  const CurrentBalanceStyles({
    required this.shared,
    required this.regular,
    required this.disabled,
  });
}
