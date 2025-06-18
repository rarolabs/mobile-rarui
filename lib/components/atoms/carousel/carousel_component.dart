import 'package:flutter/material.dart';

import '../../../theme/sizes.dart';
import '../../../utils/interfaces/behaviour.dart';
import '../../../utils/interfaces/style.dart';
import '../../../utils/mixin/component.dart';
import 'carousel_specs.dart';
import 'carousel_style.dart';

/// Esta classe é responsável por gerenciar qualquer tipo de image
///
/// Faz a tratativa de arquivos assets locais e remotos e imagens http
class CarouselComponent extends StatelessWidget with Component<CarouselStyle, CarouselSharedStyle> {
  // Comportamento do componente
  final Behaviour behaviour;

  // Estilo do componente
  final CarouselStyleSet styles;

  /// Altura da  imagem
  final double carouselHeight;

  /// A extensão do item do carossel
  final double itemExtent;

  /// A extensão mínima dos itens durante a rolagem
  final double? shrinkExtent;

  /// Itens do carossel
  final List<Widget> children;

  /// Função de callback que navega para uma nova pagina
  final void Function(int)? onTap;

  const CarouselComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.carouselHeight,
    required this.children,
    required this.itemExtent,
    this.shrinkExtent,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<CarouselStyle, CarouselSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
      disabled: styles.specs.disabled,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenRegular(
    CarouselStyle style,
    CarouselSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return SizedBox(
      height: carouselHeight,
      child: CarouselView(
        itemExtent: itemExtent,
        shrinkExtent: shrinkExtent ?? QSizes.x0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(style.radius),
          ),
        ),
        elevation: style.elevation,
        onTap: onTap,
        children: children,
      ),
    );
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.error: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
        Behaviour.disabled: Behaviour.regular,
        Behaviour.loading: Behaviour.regular,
      };
}
