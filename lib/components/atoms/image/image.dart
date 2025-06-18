import 'image_specs.dart';

class QImage extends ImageSpecs {
  /// Configuração de style para a [QLabel]
  final ImageStyleSet style;

  /// Construtor padrão de imagem
  const QImage({
    super.key,
    required super.behaviour,
    required super.path,
    required this.style,
    super.height,
    super.width,
    super.fit,
    super.errorWidget,
    super.onTap,
  }) : super(styles: style);

  const QImage.standard({
    super.key,
    required super.behaviour,
    required super.path,
    super.height,
    super.width,
    super.fit,
    super.errorWidget,
    super.onTap,
  })  : style = ImageStyleSet.standard,
        super(styles: ImageStyleSet.standard);
}
