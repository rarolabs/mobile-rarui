import '../../../shared_widget/loading_styles.dart';

class PasswordRequirementsSharedStyle {
  final LoadingStyle loadingStyle;

  PasswordRequirementsSharedStyle({
    required this.loadingStyle,
  });
}

class PasswordRequirementsStyle {
  PasswordRequirementsStyle();
}

class PasswordRequirementsStyles {
  PasswordRequirementsSharedStyle shared;
  PasswordRequirementsStyle regular;

  PasswordRequirementsStyles({
    required this.shared,
    required this.regular,
  });
}
