import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/sizes_card.dart';
import '../../../theme/theme_data.dart';
import '../../atoms/icon/icon_specs.dart';
import 'card_icon_component.dart';
import 'card_icon_style.dart';

part 'card_icon_style_set.dart';

class CardIconSpecs extends CardIconComponent {
  CardIconSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    required super.labelButton,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  });

  static CardIconStyles get size80x68Style {
    return CardIconStyles(
      regular: CardIconStyle(
        width: QSizesCard.x80,
        height: QSizesCard.x68,
        padding: const EdgeInsets.all(QSizes.x4),
        borderRadius: BorderRadius.circular(8),
        backgroundColor: QTheme.colors.white,
      ),
      shared: CardIconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesCard.x80, QSizesCard.x68),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: CardIconStyle(
        width: QSizesCard.x80,
        height: QSizesCard.x68,
        padding: const EdgeInsets.all(QSizes.x4),
        borderRadius: BorderRadius.circular(8),
        backgroundColor: QTheme.colors.white,
      ),
    );
  }

  static CardIconStyles get size80x68ErrorStyle {
    return CardIconStyles(
      regular: CardIconStyle(
        width: QSizesCard.x80,
        height: QSizesCard.x68,
        padding: const EdgeInsets.all(QSizes.x4),
        borderRadius: BorderRadius.circular(8),
        backgroundColor: QTheme.colors.white,
        iconStyle: IconStyleSet.size32Error,
      ),
      shared: CardIconSharedStyle(
        loadingStyle: LoadingStyle(
          size: Size.infinite,
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: CardIconStyle(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(QSizes.x4),
        borderRadius: BorderRadius.circular(8),
        backgroundColor: QTheme.colors.white,
      ),
    );
  }

  static CardIconStyles get size100x80Style {
    return CardIconStyles(
      regular: CardIconStyle(
        width: QSizesCard.x100,
        height: QSizesCard.x80,
        padding: const EdgeInsets.all(QSizes.x4),
        borderRadius: BorderRadius.circular(8),
        backgroundColor: QTheme.colors.white,
      ),
      shared: CardIconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesCard.x100, QSizesCard.x80),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: CardIconStyle(
        width: QSizesCard.x100,
        height: QSizesCard.x80,
        padding: const EdgeInsets.all(QSizes.x4),
        borderRadius: BorderRadius.circular(8),
        backgroundColor: QTheme.colors.white,
      ),
    );
  }

  static CardIconStyles get size108x88Style {
    return CardIconStyles(
      regular: CardIconStyle(
        width: QSizesCard.x108,
        height: QSizesCard.x88,
        padding: const EdgeInsets.all(QSizes.x4),
        borderRadius: BorderRadius.circular(8),
        backgroundColor: QTheme.colors.white,
      ),
      shared: CardIconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesCard.x108, QSizesCard.x88),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: CardIconStyle(
        width: QSizesCard.x108,
        height: QSizesCard.x88,
        padding: const EdgeInsets.all(QSizes.x4),
        borderRadius: BorderRadius.circular(8),
        backgroundColor: QTheme.colors.white,
      ),
    );
  }

  static CardIconStyles get sizeExpansiveStyle {
    return CardIconStyles(
      regular: CardIconStyle(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(QSizes.x4),
        borderRadius: BorderRadius.circular(8),
        backgroundColor: QTheme.colors.white,
      ),
      shared: CardIconSharedStyle(
        loadingStyle: LoadingStyle(
          size: Size.infinite,
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: CardIconStyle(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(QSizes.x4),
        borderRadius: BorderRadius.circular(8),
        backgroundColor: QTheme.colors.white,
      ),
    );
  }
}
