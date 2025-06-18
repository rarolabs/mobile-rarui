import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../shared_widget/loading_widget.dart';
import '../../../theme/sizes.dart';
import '../../../utils/interfaces/behaviour.dart';
import '../../../utils/interfaces/style.dart';
import '../../../utils/mixin/component.dart';
import '../../atoms/label/label.dart';
import 'qr_code_style.dart';

class QrCodeComponent extends StatelessWidget with Component<QrCodeStyle, QrCodeSharedStyle> {
  /// Comportamento do componente, initial [Behaviour.regular]
  final Behaviour behaviour;

  /// Estilo do componente
  final QrCodeStyles styles;

  /// Base64 do QR Code
  final Uint8List imageByte;

  /// Descrição do QR Code
  final String qrCodeDescription;

  /// Funçao para tratar casos de erro
  final void Function(Object, StackTrace?)? onError;

  const QrCodeComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.imageByte,
    required this.qrCodeDescription,
    this.onError,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style(
      shared: styles.shared,
      regular: styles.regular,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenRegular(
    QrCodeStyle style,
    QrCodeSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _BaseQrCode(
      key: key,
      imageByte: imageByte,
      qrCodeDescription: qrCodeDescription,
      behaviour: childBehaviour,
      style: style,
      onError: onError,
    );
  }

  @override
  Widget whenLoading(
    QrCodeStyle style,
    QrCodeSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return LoadingWidget(style: otherStyle.loadingStyle);
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.disabled: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
        Behaviour.error: Behaviour.regular,
      };
}

class _BaseQrCode extends StatelessWidget {
  final Uint8List imageByte;
  final String qrCodeDescription;
  final Behaviour behaviour;
  final QrCodeStyle style;
  final void Function(Object, StackTrace?)? onError;

  const _BaseQrCode({
    super.key,
    required this.imageByte,
    required this.qrCodeDescription,
    required this.behaviour,
    required this.style,
    this.onError,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: QSizes.x200,
          height: QSizes.x200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: MemoryImage(imageByte),
              onError: onError,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: QSizes.x12),
        QLabel(
          style: style.qrCodeDescriptionStyle,
          behaviour: behaviour,
          text: qrCodeDescription,
        ),
      ],
    );
  }
}
