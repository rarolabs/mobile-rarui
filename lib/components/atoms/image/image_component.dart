import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/interfaces/behaviour.dart';
import '../../../utils/interfaces/style.dart';
import '../../../utils/mixin/component.dart';
import 'image_specs.dart';
import 'image_style.dart';

/// Esta classe é responsável por gerenciar qualquer tipo de image
///
/// Faz a tratativa de arquivos assets locais e remotos e imagens http
class ImageComponent extends StatelessWidget with Component<ImageStyle, ImageSharedStyle> {
  // Comportamento do componente
  final Behaviour behaviour;

  // Estilo do componente
  final ImageStyleSet styles;

  /// Caminho da imagem
  final String path;

  /// Altura da  imagem
  final double? height;

  /// Largura da imagem
  final double? width;

  /// Ajuste da imagem
  final BoxFit? fit;

  /// Customiza a imagem de erro
  final Widget? errorWidget;

  /// Callback caso a imagem tenha função
  final VoidCallback? onTap;

  const ImageComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.path,
    this.height,
    this.width,
    this.fit,
    this.errorWidget,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<ImageStyle, ImageSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
      disabled: styles.specs.disabled,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    ImageStyle style,
    ImageSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return Shimmer.fromColors(
      baseColor: otherStyle.loadingStyle.baseColor,
      highlightColor: otherStyle.loadingStyle.highlightColor,
      child: ColoredBox(
        color: otherStyle.loadingStyle.highlightColor,
        child: _ImageWidget(
          path: path,
          height: height,
          width: width,
          fit: fit,
          errorWidget: errorWidget,
          onTap: onTap,
        ),
      ),
    );
  }

  @override
  Widget whenRegular(
    ImageStyle style,
    ImageSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _ImageWidget(
      path: path,
      height: height,
      width: width,
      fit: fit,
      errorWidget: errorWidget,
      onTap: onTap,
    );
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.error: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
        Behaviour.disabled: Behaviour.regular,
      };
}

class _ImageWidget extends StatelessWidget {
  final String path;

  final double? height;

  final double? width;

  final BoxFit? fit;

  final Widget? errorWidget;

  final VoidCallback? onTap;
  const _ImageWidget({
    required this.path,
    this.height,
    this.width,
    this.fit,
    this.errorWidget,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget? image;
    if (path.startsWith('assets/') || path.startsWith('packages/')) {
      if (path.contains('.svg')) {
        image = SvgPicture.asset(
          path,
          height: height,
          width: width,
          fit: fit ?? BoxFit.contain,
        );
      } else if (path.contains('.png') || path.contains('.jpg') || path.contains('.jpeg') || path.contains('.webp')) {
        image = Image.asset(
          path,
          height: height,
          width: width,
          fit: fit ?? BoxFit.contain,
        );
      }
    } else if (path.startsWith('http')) {
      if (path.contains('.svg')) {
        image = SvgPicture.network(
          path,
          height: height,
          width: width,
          fit: fit ?? BoxFit.contain,
        );
      } else if (path.contains('.png') || path.contains('.jpg') || path.contains('.jpeg') || path.contains('.webp')) {
        image = Image.network(
          path,
          height: height,
          width: width,
          fit: fit ?? BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => errorImage,
        );
      }
    }

    image ??= SizedBox(
      height: height,
      width: width,
      child: errorImage,
    );

    return GestureDetector(onTap: onTap, child: image);
  }

  Widget get errorImage => errorWidget ?? const Icon(Icons.image_not_supported_outlined);
}
