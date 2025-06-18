import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../utils/interfaces/behaviour.dart';
import '../../../utils/interfaces/style.dart';
import '../../../utils/mixin/component.dart';
import 'qr_code_image_specs.dart';
import 'qr_code_image_style.dart';

class QrCodeImageComponent extends StatelessWidget with Component<QrCodeImageStyle, QrCodeImageSharedStyle> {
  /// Status do behavior
  final Behaviour behaviour;

  /// Estilo do componente
  final QrCodeImageStyleSet styles;

  /// info qrcode a ser exibido
  final String qrCodeData;

  const QrCodeImageComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.qrCodeData,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<QrCodeImageStyle, QrCodeImageSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenRegular(
    QrCodeImageStyle style,
    QrCodeImageSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      _QQrCodeImageWidget(
        style: style,
        sharedStyle: otherStyle,
        behaviour: behaviour,
        qrCodeData: qrCodeData,
      );

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.loading: Behaviour.regular,
        Behaviour.error: Behaviour.regular,
        Behaviour.disabled: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
      };
}

class _QQrCodeImageWidget extends StatelessWidget {
  const _QQrCodeImageWidget({
    required this.style,
    required this.sharedStyle,
    required this.behaviour,
    required this.qrCodeData,
  });

  final QrCodeImageStyle style;
  final QrCodeImageSharedStyle sharedStyle;
  final Behaviour behaviour;
  final String qrCodeData;

  @override
  Widget build(BuildContext context) {
    return QrImageView(
      data: qrCodeData,
      version: QrVersions.auto,
      size: MediaQuery.sizeOf(context).width * 0.53,
    );
  }
}
