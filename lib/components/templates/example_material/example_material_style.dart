import '../../../shared_widget/loading_styles.dart';

class ExampleMaterialSharedStyle {
  final LoadingStyle loadingStyle;

  ExampleMaterialSharedStyle({required this.loadingStyle});
}

class ExampleMaterialStyle {
  ExampleMaterialStyle();
}

class ExampleMaterialStyles {
  final ExampleMaterialSharedStyle sharedStyle;
  final ExampleMaterialStyle regular;

  const ExampleMaterialStyles({
    required this.sharedStyle,
    required this.regular,
  });
}
