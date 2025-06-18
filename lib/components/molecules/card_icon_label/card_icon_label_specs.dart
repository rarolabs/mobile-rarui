import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/sizes_card.dart';
import '../../../theme/theme_data.dart';
import '../../atoms/label/label_specs.dart';
import 'card_icon_label_component.dart';
import 'card_icon_label_style.dart';

part 'card_icon_label_style_set.dart';

class CardIconLabelSpecs extends CardIconLabelComponent {
  CardIconLabelSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    required super.title,
    required super.subtitle,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
    super.image,
  });

  static CardIconLabelStyles standard() {
    return CardIconLabelStyles(
      regular: CardIconLabelStyle(
        width: QSizes.x144,
        height: QSizes.x160,
        iconSize: QSizes.x56,
        textSpacing: QSizes.x12,
        padding: const EdgeInsets.all(QSizes.x4),
        borderRadius: BorderRadius.circular(QSizes.x8),
        backgroundColor: QTheme.colors.white,
        borderColor: QTheme.colors.gray2,
        titleStyle: LabelStyleSet.bodyRoboto16Gray6Light,
        subtitleStyle: LabelStyleSet.bodyRoboto14Gray6Light,
        initialsTitleStyle: LabelStyleSet.bodyRoboto16Gray6Light,
      ),
      shared: CardIconLabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x144, QSizes.x160),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: CardIconLabelStyle(
        width: QSizes.x144,
        height: QSizes.x160,
        iconSize: QSizes.x56,
        textSpacing: QSizes.x12,
        padding: const EdgeInsets.all(QSizes.x4),
        borderRadius: BorderRadius.circular(QSizes.x8),
        backgroundColor: QTheme.colors.white,
        borderColor: QTheme.colors.gray2,
        titleStyle: LabelStyleSet.bodyRoboto16Gray6Light,
        subtitleStyle: LabelStyleSet.bodyRoboto14Gray6Light,
        initialsTitleStyle: LabelStyleSet.bodyRoboto24WhiteBold,
      ),
    );
  }

  static CardIconLabelStyles cashback() {
    return CardIconLabelStyles(
      regular: CardIconLabelStyle(
        width: QSizesCard.x160,
        height: QSizesCard.x160,
        iconSize: QSizes.x72,
        textSpacing: QSizes.x12,
        padding: const EdgeInsets.all(QSizes.x12),
        borderRadius: BorderRadius.circular(QSizes.x8),
        backgroundColor: QTheme.colors.gray10,
        borderColor: QTheme.colors.gray11,
        titleStyle: LabelStyleSet.captionRoboto14BlackBold,
        subtitleStyle: LabelStyleSet.captionRoboto12BlackRegular,
        initialsTitleStyle: LabelStyleSet.captionRoboto14BlackBold,
      ),
      shared: CardIconLabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x144, QSizes.x160),
          baseColor: QTheme.colors.gray10,
          highlightColor: QTheme.colors.gray10,
        ),
      ),
      disabled: CardIconLabelStyle(
        width: QSizesCard.x156,
        height: QSizesCard.x160,
        iconSize: QSizes.x72,
        textSpacing: QSizes.x12,
        padding: const EdgeInsets.all(QSizes.x12),
        borderRadius: BorderRadius.circular(QSizes.x12),
        backgroundColor: QTheme.colors.gray10,
        borderColor: QTheme.colors.gray11,
        titleStyle: LabelStyleSet.captionRoboto14BlackBold,
        subtitleStyle: LabelStyleSet.captionRoboto12BlackRegular,
        initialsTitleStyle: LabelStyleSet.captionRoboto14BlackBold,
      ),
    );
  }

  static CardIconLabelStyles withImage() {
    return CardIconLabelStyles(
      regular: CardIconLabelStyle(
        width: QSizesCard.x156,
        height: QSizesCard.x160,
        iconSize: QSizes.x72,
        textSpacing: QSizes.x12,
        padding: const EdgeInsets.all(QSizes.x12),
        borderRadius: BorderRadius.circular(QSizes.x12),
        backgroundColor: QTheme.colors.gray1,
        borderColor: QTheme.colors.gray2,
        titleStyle: LabelStyleSet.bodyRoboto14Gray3SemiBold,
        subtitleStyle: LabelStyleSet.captionRoboto12PrimaryBold,
        initialsTitleStyle: LabelStyleSet.bodyRoboto14Gray3SemiBold,
      ),
      shared: CardIconLabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x144, QSizes.x160),
          baseColor: QTheme.colors.gray1,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: CardIconLabelStyle(
        width: QSizesCard.x156,
        height: QSizesCard.x160,
        iconSize: QSizes.x72,
        textSpacing: QSizes.x12,
        padding: const EdgeInsets.all(QSizes.x12),
        borderRadius: BorderRadius.circular(QSizes.x12),
        backgroundColor: QTheme.colors.gray1,
        borderColor: QTheme.colors.gray2,
        titleStyle: LabelStyleSet.bodyRoboto14Gray3SemiBold,
        subtitleStyle: LabelStyleSet.captionRoboto12PrimaryBold,
        initialsTitleStyle: LabelStyleSet.bodyRoboto14Gray3SemiBold,
      ),
    );
  }
}
