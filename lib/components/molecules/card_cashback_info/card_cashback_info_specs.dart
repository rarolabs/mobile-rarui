import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/sizes_card.dart';
import '../../../theme/theme_data.dart';
import '../../atoms/label/label_specs.dart';
import '../button/button_specs.dart';
import 'card_cashback_info_component.dart';
import 'card_cashback_info_style.dart';

part 'card_cashback_info_style_set.dart';

class CardCashbackInfoSpecs extends CardCashbackInfoComponent {
  CardCashbackInfoSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    required super.title,
    required super.subtitle,
    required super.buttonText,
    super.horizontalAlignment,
    super.footer,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
    super.image,
  });

  static CardCashbackInfoStyles get standard {
    return CardCashbackInfoStyles(
      regular: CardCashbackInfoStyle(
        width: double.infinity,
        height: QSizesCard.x248,
        iconSize: QSizes.x80,
        textSpacing: QSizes.x8,
        padding: const EdgeInsets.all(QSizes.x4),
        borderRadius: BorderRadius.circular(QSizes.x8),
        backgroundColor: QTheme.colors.gray10,
        borderColor: QTheme.colors.gray11,
      ),
      shared: CardCashbackInfoSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x348, QSizes.x256),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
        titleStyle: LabelStyleSet.h5Lato20BlackBold,
        subtitleStyle: LabelStyleSet.bodyRoboto16BlackMedium,
        footerStyle: LabelStyleSet.h5Lato20BlackBold,
        buttonStyleSet: ButtonStyleSet.primaryBase,
      ),
      disabled: CardCashbackInfoStyle(
        width: QSizes.x348,
        height: QSizes.x256,
        iconSize: QSizes.x80,
        textSpacing: QSizes.x12,
        padding: const EdgeInsets.all(QSizes.x4),
        borderRadius: BorderRadius.circular(QSizes.x8),
        backgroundColor: QTheme.colors.gray10,
        borderColor: QTheme.colors.gray11,
      ),
    );
  }

  static CardCashbackInfoStyles get coupon {
    return CardCashbackInfoStyles(
      regular: CardCashbackInfoStyle(
        width: QSizes.x360,
        height: QSizes.x144,
        iconSize: QSizes.x72,
        textSpacing: QSizes.x12,
        padding: const EdgeInsets.all(QSizes.x4),
        borderRadius: BorderRadius.circular(QSizes.x8),
        backgroundColor: QTheme.colors.gray10,
        borderColor: QTheme.colors.gray11,
      ),
      shared: CardCashbackInfoSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x348, QSizes.x256),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
        titleStyle: LabelStyleSet.captionRoboto12Gray5Bold,
        subtitleStyle: LabelStyleSet.captionRoboto12Gray5Regular,
        footerStyle: LabelStyleSet.captionRoboto12Gray5Bold,
        buttonStyleSet: ButtonStyleSet.dashedBorder,
      ),
      disabled: CardCashbackInfoStyle(
        width: QSizes.x348,
        height: QSizes.x256,
        iconSize: QSizes.x80,
        textSpacing: QSizes.x12,
        padding: const EdgeInsets.all(QSizes.x4),
        borderRadius: BorderRadius.circular(QSizes.x8),
        backgroundColor: QTheme.colors.gray10,
        borderColor: QTheme.colors.gray11,
      ),
    );
  }
}
