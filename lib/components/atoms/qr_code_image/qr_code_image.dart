import 'qr_code_image_specs.dart';

class QQrCodeImage extends QrCodeImageSpecs {
  const QQrCodeImage.standard({
    super.key,
    required super.behaviour,
    required super.qrCodeData,
  }) : super(styles: QrCodeImageStyleSet.standard);
}
