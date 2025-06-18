import '../../../shared_widget/loading_styles.dart';

class QrCodeImageSharedStyle {
  final LoadingStyle loadingStyle;

  QrCodeImageSharedStyle({
    required this.loadingStyle,
  });
}

class QrCodeImageStyle {
  const QrCodeImageStyle();
}

class QrCodeImageStyles {
  final QrCodeImageSharedStyle shared;
  final QrCodeImageStyle regular;

  QrCodeImageStyles({required this.shared, required this.regular});
}
