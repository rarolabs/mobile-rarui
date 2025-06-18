import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/sizes_icon.dart';
import '../../../theme/theme_data.dart';
import 'icon_component.dart';
import 'icon_style.dart';

part 'icon_style_set.dart';

class IconSpecs extends IconComponent {
  const IconSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
    super.isBase64,
  });

  /// Icone tamanho 16
  static IconStyles get size16SecondaryBaseStyle {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x16,
        iconColor: QTheme.colors.secondaryColorBase,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x16, QSizesIcon.x16),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x16,
        iconColor: QTheme.colors.secondaryColorBase.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 20 cor Secondadry base
  static IconStyles get size20SecondaryBaseStyle {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x20,
        iconColor: QTheme.colors.secondaryColorBase,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x20, QSizesIcon.x20),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x20,
        iconColor: QTheme.colors.secondaryColorBase.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 20
  static IconStyles get size20WhiteStyle {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x20,
        iconColor: QTheme.colors.white,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x20, QSizesIcon.x20),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x20,
        iconColor: QTheme.colors.white.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 14 cor branco
  static IconStyles get size14WhiteStyle {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x12,
        iconColor: QTheme.colors.white,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x20, QSizesIcon.x20),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x20,
        iconColor: QTheme.colors.white.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 12 cor Gray3
  static IconStyles get size12Gray3Style {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x12,
        iconColor: QTheme.colors.gray3,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x12, QSizesIcon.x12),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x12,
        iconColor: QTheme.colors.white.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 16 cor success
  static IconStyles get size16Success0Style {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x16,
        iconColor: QTheme.colors.successColorBase,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x16, QSizesIcon.x16),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x16,
        iconColor: QTheme.colors.white.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 16 cor preta
  static IconStyles get size16BlackStyle {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x16,
        iconColor: QTheme.colors.black,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x16, QSizesIcon.x16),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x16,
        iconColor: QTheme.colors.white.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 24
  static IconStyles get size24SuccessStyle {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x24,
        iconColor: QTheme.colors.successColorBase,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x24, QSizesIcon.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x24,
        iconColor: QTheme.colors.successColorBase.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 24
  static IconStyles get size24WarningStyle {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x24,
        iconColor: QTheme.colors.warningColorBase,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x24, QSizesIcon.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x24,
        iconColor: QTheme.colors.warningColorBase.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 16
  static IconStyles get size16Gray5Style {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x16,
        iconColor: QTheme.colors.gray5,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x16, QSizesIcon.x16),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x16,
        iconColor: QTheme.colors.gray5.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 24
  static IconStyles get size24Gray5Style {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x24,
        iconColor: QTheme.colors.gray5,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x24, QSizesIcon.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x24,
        iconColor: QTheme.colors.gray5.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 24 e cor [gray7]
  static IconStyles get size24Gray7Style {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x24,
        iconColor: QTheme.colors.gray7,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x24, QSizesIcon.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x24,
        iconColor: QTheme.colors.gray7.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 28
  static IconStyles get size28Gray5Style {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x28,
        iconColor: QTheme.colors.gray5,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x28, QSizesIcon.x28),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x28,
        iconColor: QTheme.colors.gray5.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 24
  static IconStyles get size24Gray3Style {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x24,
        iconColor: QTheme.colors.gray3,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x24, QSizesIcon.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x24,
        iconColor: QTheme.colors.gray3.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 12
  static IconStyles get size12Gray1Style {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x12,
        iconColor: QTheme.colors.gray1,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x12, QSizesIcon.x12),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x12,
        iconColor: QTheme.colors.gray1.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 24 com cor de error
  static IconStyles get size24Error {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x24,
        iconColor: QTheme.colors.errorColorBase,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x24, QSizesIcon.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x24,
        iconColor: QTheme.colors.gray3.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 24
  static IconStyles get size24SecondaryBaseStyle {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x24,
        iconColor: QTheme.colors.secondaryColorBase,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x24, QSizesIcon.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x24,
        iconColor: QTheme.colors.gray5.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 24
  static IconStyles get size24RedStyle {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x24,
        iconColor: QTheme.colors.errorColorBase,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x24, QSizesIcon.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x24,
        iconColor: QTheme.colors.errorColorBase.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 48 errorBase
  static IconStyles get size48ErrorBaseStyle {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x48,
        iconColor: QTheme.colors.errorColorBase,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x48, QSizesIcon.x48),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x48,
        iconColor: QTheme.colors.errorColorBase.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho [24] e cor [white]
  static IconStyles get size24WhiteStyle {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x24,
        iconColor: QTheme.colors.white,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x24, QSizesIcon.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x24,
        iconColor: QTheme.colors.white,
      ),
    );
  }

  /// Icone tamanho [24] e cor [primaryBase]
  static IconStyles get size24PrimaryBaseStyle {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x24,
        iconColor: QTheme.colors.primaryColorBase,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x24, QSizesIcon.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x24,
        iconColor: QTheme.colors.primaryColorBase,
      ),
    );
  }

  /// Icone tamanho [24] e cor [primaryBaseDrak]
  static IconStyles get size24PrimaryBaseDarkStyle {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x24,
        iconColor: QTheme.colors.primaryColorDark,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x24, QSizesIcon.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x24,
        iconColor: QTheme.colors.primaryColorDark,
      ),
    );
  }

  /// Icone tamanho 28
  static IconStyles get size28CianoStyle {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x28,
        iconColor: QTheme.colors.ciano,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x28, QSizesIcon.x28),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x28,
        iconColor: QTheme.colors.ciano.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 32
  static IconStyles get size32Gray5Style {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x32,
        iconColor: QTheme.colors.gray5,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x32, QSizesIcon.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x32,
        iconColor: QTheme.colors.gray5.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 32 e cor [black]
  static IconStyles get size32BlackStyle {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x32,
        iconColor: QTheme.colors.black,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x32, QSizesIcon.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x32,
        iconColor: QTheme.colors.black.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 32
  static IconStyles get size32Gray1Style {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x32,
        iconColor: QTheme.colors.gray1,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x32, QSizesIcon.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x32,
        iconColor: QTheme.colors.gray1.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 32
  static IconStyles get size32ErrorStyle {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x32,
        iconColor: QTheme.colors.errorColorBase,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x32, QSizesIcon.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x32,
        iconColor: QTheme.colors.errorColorBase.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 36
  static IconStyles get size36WhiteStyle {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x36,
        iconColor: QTheme.colors.white,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x36, QSizesIcon.x36),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x36,
        iconColor: QTheme.colors.white.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 72
  static IconStyles get size72SuccessBaseStyle {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x72,
        iconColor: QTheme.colors.successColorBase,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x72, QSizesIcon.x72),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x72,
        iconColor: QTheme.colors.white.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 72
  static IconStyles get size72ErrorBaseStyle {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x72,
        iconColor: QTheme.colors.errorColorBase,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x72, QSizesIcon.x72),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x72,
        iconColor: QTheme.colors.white.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 72 e cor warningBase
  static IconStyles get size72WarningBaseStyle {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x72,
        iconColor: QTheme.colors.warningColorBase,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x72, QSizesIcon.x72),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x72,
        iconColor: QTheme.colors.white.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 130
  static IconStyles get size130Gray5Style {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x128,
        iconColor: QTheme.colors.gray5,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x128, QSizesIcon.x128),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x128,
        iconColor: QTheme.colors.white.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 28
  static IconStyles get size28SecondaryStyle {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x28,
        iconColor: QTheme.colors.secondaryColorBase,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x28, QSizesIcon.x28),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x28,
        iconColor: QTheme.colors.secondaryColorBase.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 72 e cor WarningLightStyle
  static IconStyles get size72WarningLightStyle {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x72,
        iconColor: QTheme.colors.warningColorLight,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x72, QSizesIcon.x72),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x72,
        iconColor: QTheme.colors.secondaryColorBase.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 72 e cor Gray5
  static IconStyles get size72Gray5Style {
    return IconStyles(
      regular: IconStyle(
        size: QSizesIcon.x72,
        iconColor: QTheme.colors.gray5,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizesIcon.x72, QSizesIcon.x72),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizesIcon.x72,
        iconColor: QTheme.colors.secondaryColorBase.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }

  /// Icone tamanho 28 cor gray7
  static IconStyles get size28Gray7Style {
    return IconStyles(
      regular: IconStyle(
        size: QSizes.x28,
        iconColor: QTheme.colors.gray7,
      ),
      shared: IconSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x28, QSizes.x28),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: IconStyle(
        size: QSizes.x28,
        iconColor: QTheme.colors.gray7.withAlpha((50 * 255 / 100).toInt()),
      ),
    );
  }
}
