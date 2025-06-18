import 'package:flutter/material.dart';

import '../../../rarui.dart';
import 'carousel_specs.dart';

class QCarousel extends CarouselSpecs {
  /// Configuração de style para a [QLabel]
  final CarouselStyleSet style;

  /// Construtor padrão de imagem
  const QCarousel({
    super.key,
    required super.behaviour,
    required super.carouselHeight,
    required super.children,
    required super.itemExtent,
    required this.style,
    super.shrinkExtent,
    super.onTap,
  }) : super(styles: style);

  const QCarousel.banners({
    super.key,
    required super.behaviour,
    required super.carouselHeight,
    required super.itemExtent,
    List<QImage>? banners,
    super.shrinkExtent,
    super.onTap,
  })  : style = CarouselStyleSet.banners,
        super(styles: CarouselStyleSet.banners, children: banners as List<Widget>);

  const QCarousel.categories({
    super.key,
    required super.behaviour,
    required super.carouselHeight,
    required super.itemExtent,
    List<QCardCashbackCategory>? categories,
    super.shrinkExtent,
    super.onTap,
  })  : style = CarouselStyleSet.categories,
        super(styles: CarouselStyleSet.categories, children: categories as List<Widget>);
}
