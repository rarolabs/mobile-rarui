import '../../../shared_widget/loading_styles.dart';

class WebviewPageSharedStyle {
  final LoadingStyle loadingStyle;

  WebviewPageSharedStyle({
    required this.loadingStyle,
  });
}

class WebviewPageStyle {
  WebviewPageStyle();
}

class WebviewPageStyles {
  WebviewPageSharedStyle shared;
  WebviewPageStyle regular;

  WebviewPageStyles({
    required this.shared,
    required this.regular,
  });
}
