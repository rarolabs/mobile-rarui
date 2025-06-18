import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/tokens.dart';
import '../../atoms/label/label_specs.dart';
import 'qr_code_component.dart';
import 'qr_code_style.dart';

class QrCodeSpecs extends QrCodeComponent {
  const QrCodeSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    required super.imageByte,
    required super.qrCodeDescription,
    super.onError,
  });

  static QrCodeStyles standard() {
    return QrCodeStyles(
      shared: QrCodeSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x200, QSizes.x200),
          baseColor: QTheme.colors.gray1,
          highlightColor: QTheme.colors.gray2,
        ),
      ),
      regular: QrCodeStyle(
        qrCodeDescriptionStyle: LabelStyleSet.captionRoboto14Gray4Regular,
      ),
    );
  }
}
