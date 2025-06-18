import '../../../../shared_widget/loading_styles.dart';

class ImageSharedStyle {
  final LoadingStyle loadingStyle;

  ImageSharedStyle({
    required this.loadingStyle,
  });
}

class ImageStyle {
  ImageStyle();
}

class LabelStyles {
  final ImageSharedStyle shared;
  final ImageStyle regular;
  final ImageStyle disabled;
  final ImageStyle error;

  LabelStyles({
    required this.shared,
    required this.regular,
    required this.disabled,
    required this.error,
  });
}
