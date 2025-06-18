import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../atoms/image/image_specs.dart';
import '../../atoms/label/label_specs.dart';
import 'card_info_component.dart';
import 'card_info_styles.dart';

part 'card_info_style_set.dart';

class CardInfoSpecs extends CardInfoComponent {
  const CardInfoSpecs({
    required super.behaviour,
    required super.styles,
    required super.cardSkinURL,
    super.isVertical,
    super.title,
    super.subtitle,
    super.textSemantics,
    super.key,
  });

  /// Estilos para o componente CardInfo regular
  static CardInfoStyles get standardStyle {
    return CardInfoStyles(
      regular: CardInfoStyle(),
      shared: CardInfoSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x292, QSizes.x184),
          baseColor: QTheme.colors.gray1,
          highlightColor: QTheme.colors.gray2,
        ),
        imageStyleSet: ImageStyleSet.standard,
        titleStyle: LabelStyleSet.captionRoboto14WhiteRegular,
        subtitleStyle: LabelStyleSet.captionRoboto14WhiteBold,
      ),
    );
  }
}
