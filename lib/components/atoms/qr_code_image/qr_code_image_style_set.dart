part of 'qr_code_image_specs.dart';

enum QrCodeImageStyleSet {
  standard;

  const QrCodeImageStyleSet();

  QrCodeImageStyles get specs => switch (this) {
        standard => QrCodeImageSpecs.standard,
      };
}
