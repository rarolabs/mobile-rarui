import 'package:flutter/material.dart';

import '../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import '../../atoms/icon/icon_specs.dart';
import '../../atoms/label/label_specs.dart';
import 'text_icon_component.dart';
import 'text_icon_style.dart';

class TextIconSpecs extends IconTextComponent {
  const TextIconSpecs({
    super.key,
    required super.styles,
    required super.title,
    required super.behaviour,
    super.subtitle,
    super.leadingIconPath,
    super.trailingIconPath,
    super.hintSemantics,
    super.labelSemantics,
  });

  /// Representa o estilo do componente com ícone de tamanho 28 e cor Gray5
  static TextIconStyles get standardStyle {
    return TextIconStyles(
      shared: TextIconSharedStyle(
        titleFormat: LabelStyleSet.bodyRoboto14Gray5Medium,
        subtitleFormat: LabelStyleSet.bodyRoboto14Gray5Medium,
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      regular: const TextIconStyle(
        iconStyle: IconStyleSet.size28Gray5,
        leftPadding: EdgeInsets.only(left: QSizes.x16),
        rightPadding: EdgeInsets.only(right: QSizes.x16),
        topPadding: EdgeInsets.only(top: QSizes.x16),
      ),
    );
  }

  /// Representa o estilo do componente com ícone de tamanho 28 e cor Ciano
  static TextIconStyles get cianoStyle {
    return TextIconStyles(
      shared: TextIconSharedStyle(
        titleFormat: LabelStyleSet.bodyRoboto16Gray4Regular,
        subtitleFormat: LabelStyleSet.paragraphRoboto16Gray5Bold,
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      regular: const TextIconStyle(
        leftPadding: EdgeInsets.only(left: QSizes.x12),
        rightPadding: EdgeInsets.only(right: QSizes.x12),
        topPadding: EdgeInsets.only(top: QSizes.x12),
        iconStyle: IconStyleSet.size28Ciano,
      ),
    );
  }

  /// Representa o estilo do componente com ícone de tamanho 28 e cor Gray5
  static TextIconStyles get withSubtitle {
    return TextIconStyles(
      shared: TextIconSharedStyle(
        titleFormat: LabelStyleSet.paragraphRoboto16Gray5Bold,
        subtitleFormat: LabelStyleSet.captionRoboto12Gray5Bold,
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      regular: const TextIconStyle(
        iconStyle: IconStyleSet.size28Gray5,
        leftPadding: EdgeInsets.only(left: QSizes.x16),
        rightPadding: EdgeInsets.only(right: QSizes.x16),
        topPadding: EdgeInsets.only(top: QSizes.x16),
        width: QSizes.x280,
      ),
    );
  }

  /// Representa o estilo do componente com ícone de tamanho 28 e cor Secondary
  static TextIconStyles get secondaryStyle {
    return TextIconStyles(
      shared: TextIconSharedStyle(
        titleFormat: LabelStyleSet.bodyRoboto16SecondaryBold,
        subtitleFormat: LabelStyleSet.paragraphRoboto16Gray5Bold,
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      regular: const TextIconStyle(
        leftPadding: EdgeInsets.only(left: QSizes.x12),
        rightPadding: EdgeInsets.only(right: QSizes.x12),
        topPadding: EdgeInsets.only(top: QSizes.x12),
        iconStyle: IconStyleSet.size28Secondary,
      ),
    );
  }

  /// Representa o estilo do componente com ícone de tamanho 28 gray 5
  static TextIconStyles get body14Style {
    return TextIconStyles(
      shared: TextIconSharedStyle(
        titleFormat: LabelStyleSet.bodyRoboto14Gray5Medium,
        subtitleFormat: LabelStyleSet.bodyRoboto14Gray5Medium,
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      regular: const TextIconStyle(
        leftPadding: EdgeInsets.only(left: QSizes.x16),
        rightPadding: EdgeInsets.only(right: QSizes.x16),
        topPadding: EdgeInsets.only(top: QSizes.x12),
        iconStyle: IconStyleSet.size32Gray5,
      ),
    );
  }

  /// Representa o estilo do componente com ícone de tamanho 28 e cor Secondary
  static TextIconStyles get body14NegritoSecondaryStyle {
    return TextIconStyles(
      shared: TextIconSharedStyle(
        titleFormat: LabelStyleSet.bodyRoboto14Gray5MediumBoldSecondary,
        subtitleFormat: LabelStyleSet.bodyRoboto14Gray5MediumBoldSecondary,
        loadingStyle: LoadingStyle(
          size: const Size(double.infinity, QSizes.x32),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      regular: const TextIconStyle(
        leftPadding: EdgeInsets.only(left: QSizes.x16),
        rightPadding: EdgeInsets.only(right: QSizes.x16),
        topPadding: EdgeInsets.only(top: QSizes.x12),
        iconStyle: IconStyleSet.size32Gray5,
      ),
    );
  }
}
