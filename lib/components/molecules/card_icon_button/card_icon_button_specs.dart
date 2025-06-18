import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/sizes_card.dart';
import '../../../theme/theme_data.dart';
import '../../atoms/label/label_specs.dart';
import '../button/button_specs.dart';
import 'card_icon_button_component.dart';
import 'card_icon_button_style.dart';

part 'card_icon_button_style_set.dart';

class CardIconButtonSpecs extends CardIconButtonComponent {
  CardIconButtonSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    required super.title,
    required super.subtitle,
    super.buttonText,
    super.horizontalAlignment,
    super.footer,
    super.onPressed,
    super.onButtonPressed,
    super.labelSemantics,
    super.hintSemantics,
    super.image,
    super.svgBase64,
  });

  static CardIconButtonStyles get standard {
    return CardIconButtonStyles(
      regular: CardIconButtonStyle(
        width: QSizes.x144,
        height: QSizes.x160,
        iconSize: QSizes.x56,
        textSpacing: QSizes.x12,
        padding: const EdgeInsets.all(QSizes.x4),
        borderRadius: BorderRadius.circular(QSizes.x8),
        backgroundColor: QTheme.colors.gray10,
        borderColor: QTheme.colors.gray11,
      ),
      shared: CardIconButtonSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x348, QSizes.x256),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
        titleStyle: LabelStyleSet.captionRoboto14BlackBold,
        subtitleStyle: LabelStyleSet.captionRoboto12BlackRegular,
        footerStyle: LabelStyleSet.captionRoboto14BlackBold,
      ),
      disabled: CardIconButtonStyle(
        width: QSizes.x348,
        height: QSizes.x256,
        buttonHeight: QSizes.x32,
        buttonWidth: QSizes.x144,
        iconSize: QSizes.x80,
        textSpacing: QSizes.x12,
        padding: const EdgeInsets.all(QSizes.x4),
        borderRadius: BorderRadius.circular(QSizes.x8),
        backgroundColor: QTheme.colors.gray10,
        borderColor: QTheme.colors.gray11,
      ),
    );
  }

  static CardIconButtonStyles get withButton {
    return CardIconButtonStyles(
      regular: CardIconButtonStyle(
        width: double.infinity,
        height: QSizesCard.x248,
        buttonHeight: QSizes.x32,
        buttonWidth: QSizes.x144,
        iconSize: QSizes.x80,
        textSpacing: QSizes.x8,
        padding: const EdgeInsets.all(QSizes.x4),
        borderRadius: BorderRadius.circular(QSizes.x8),
        backgroundColor: QTheme.colors.gray10,
        borderColor: QTheme.colors.gray11,
      ),
      shared: CardIconButtonSharedStyle(
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
      disabled: CardIconButtonStyle(
        width: QSizes.x348,
        height: QSizes.x256,
        buttonHeight: QSizes.x32,
        buttonWidth: QSizes.x144,
        iconSize: QSizes.x80,
        textSpacing: QSizes.x12,
        padding: const EdgeInsets.all(QSizes.x4),
        borderRadius: BorderRadius.circular(QSizes.x8),
        backgroundColor: QTheme.colors.gray10,
        borderColor: QTheme.colors.gray11,
      ),
    );
  }

  static CardIconButtonStyles get coupon {
    return CardIconButtonStyles(
      regular: CardIconButtonStyle(
        width: double.infinity,
        height: QSizes.x136,
        buttonHeight: QSizes.x28,
        buttonWidth: QSizes.x84,
        iconSize: QSizes.x52,
        textSpacing: QSizes.x12,
        padding: const EdgeInsets.all(QSizes.x8),
        borderRadius: BorderRadius.circular(QSizes.x8),
        backgroundColor: QTheme.colors.gray10,
        borderColor: QTheme.colors.gray11,
      ),
      shared: CardIconButtonSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x348, QSizes.x256),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
        titleStyle: LabelStyleSet.paragraphRoboto16BlackBold,
        subtitleStyle: LabelStyleSet.bodyRoboto14BlackRegular,
        footerStyle: LabelStyleSet.captionRoboto12BlackBold,
        buttonStyleSet: ButtonStyleSet.dashedBorder,
      ),
      disabled: CardIconButtonStyle(
        width: QSizes.x348,
        height: QSizes.x256,
        buttonHeight: QSizes.x32,
        buttonWidth: QSizes.x144,
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
