import '../../../shared_widget/loading_styles.dart';
import '../../atoms/label/label_specs.dart';

class QrCodeSharedStyle {
  final LoadingStyle loadingStyle;

  QrCodeSharedStyle({required this.loadingStyle});
}

class QrCodeStyle {
  final LabelStyleSet qrCodeDescriptionStyle;

  QrCodeStyle({required this.qrCodeDescriptionStyle});
}

class QrCodeStyles {
  final QrCodeSharedStyle shared;
  final QrCodeStyle regular;

  QrCodeStyles({
    required this.shared,
    required this.regular,
  });
}
