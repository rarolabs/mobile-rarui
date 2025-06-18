import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import 'carousel_component.dart';
import 'carousel_style.dart';

part 'carousel_style_set.dart';

class CarouselSpecs extends CarouselComponent {
  const CarouselSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    required super.carouselHeight,
    required super.children,
    required super.itemExtent,
    super.shrinkExtent,
    super.onTap,
  });

  /// Estilo de banners
  static CarouselStyles get bannersStyle {
    return CarouselStyles(
      regular: CarouselStyle(
        radius: QSizes.x16,
        elevation: 2,
      ),
      shared: CarouselSharedStyle(
        loadingStyle: LoadingStyle(
          size: Size.zero,
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: CarouselStyle(
        radius: QSizes.x16,
      ),
    );
  }

  /// Estilo de categorias
  static CarouselStyles get categoriesStyle {
    return CarouselStyles(
      regular: CarouselStyle(
        radius: QSizes.x4,
        elevation: 2,
      ),
      shared: CarouselSharedStyle(
        loadingStyle: LoadingStyle(
          size: Size.zero,
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: CarouselStyle(
        radius: QSizes.x16,
      ),
    );
  }
}
