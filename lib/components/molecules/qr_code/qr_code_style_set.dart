import 'qr_code_specs.dart';
import 'qr_code_style.dart';

enum QrCodeStyleSet {
  standard(QrCodeSpecs.standard);

  final QrCodeStyles Function() build;

  const QrCodeStyleSet(this.build);
}
