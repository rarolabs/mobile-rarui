import 'qr_code_specs.dart';
import 'qr_code_style_set.dart';

class QrCode extends QrCodeSpecs {
  /// Estilos do componente
  final QrCodeStyleSet style;

  QrCode({
    super.key,
    required super.behaviour,
    required super.imageByte,
    required super.qrCodeDescription,
    required this.style,
    super.onError,
  }) : super(
          styles: style.build(),
        );

  /// QR Code com estilo [regular]
  /// Renderiza 1 QR Code com tamanho [`200`] px
  /// Renderiza 1 label com tamanho [`14`] px e cor [gray4]
  /// A String da imagem deve ser do tipo [Uint8List]
  QrCode.standard({
    super.key,
    required super.behaviour,
    required super.imageByte,
    required super.qrCodeDescription,
    super.onError,
  })  : style = QrCodeStyleSet.standard,
        super(
          styles: QrCodeStyleSet.standard.build(),
        );
}
