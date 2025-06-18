import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/tokens.dart';
import 'qr_code_image_component.dart';
import 'qr_code_image_style.dart';

part 'qr_code_image_style_set.dart';

class QrCodeImageSpecs extends QrCodeImageComponent {
  const QrCodeImageSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    required super.qrCodeData,
  });

  static QrCodeImageStyles get standard {
    return QrCodeImageStyles(
      shared: QrCodeImageSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size.fromWidth(QSizes.x200),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      regular: const QrCodeImageStyle(),
    );
  }
}
