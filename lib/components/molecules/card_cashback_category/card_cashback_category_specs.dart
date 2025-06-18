import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/sizes_card.dart';
import '../../../theme/theme_data.dart';
import 'card_cashback_category_component.dart';
import 'card_cashback_category_style.dart';

part 'card_cashback_category_style_set.dart';

class CardCashbackCategorySpecs extends CardCashbackCategoryComponent {
  CardCashbackCategorySpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    required super.labelButton,
    required super.svgBase64,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  });

  static CardCashbackCategoryStyles size72x72Style() {
    return CardCashbackCategoryStyles(
      regular: CardCashbackCategoryStyle(
        width: QSizesCard.x72,
        height: QSizesCard.x72,
        padding: const EdgeInsets.symmetric(
          horizontal: QSizes.x4,
        ),
        borderRadius: BorderRadius.circular(QSizes.x8),
        backgroundColor: QTheme.colors.gray10,
      ),
      shared: CardCashbackCategorySharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesCard.x72, QSizesCard.x72),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: CardCashbackCategoryStyle(
        width: QSizesCard.x72,
        height: QSizesCard.x72,
        padding: const EdgeInsets.symmetric(
          horizontal: QSizes.x4,
          vertical: QSizes.x8,
        ),
        borderRadius: BorderRadius.circular(QSizes.x8),
        backgroundColor: QTheme.colors.gray10,
      ),
    );
  }
}
