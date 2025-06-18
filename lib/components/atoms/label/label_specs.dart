import 'package:flutter/material.dart';

import '../../../../shared_widget/loading_styles.dart';
import '../../../theme/sizes.dart';
import '../../../theme/theme_data.dart';
import 'label_component.dart';
import 'label_style.dart';

part 'label_style_set.dart';

class LabelSpecs extends LabelComponent {
  ///
  ///[styles] Estilos do componente
  ///[text] Texto do Label
  ///[maxLines] número máximo de linhas
  ///
  /// Como fazer a nomenclatura:
  ///
  ///[tamanho] [fonte] [tamanho da fonte] [cor] [peso da fonte]
  /// exemplo: h1Lato42Gray5
  ///
  /// Propriedades:
  /// - [h1]: Nível do título
  /// - [Lato]: Família da fonte
  /// - [42]: Tamanho da fonte em pixels
  /// - [Gray5]: Cor do texto
  /// - [5]: Peso da fonte
  ///
  const LabelSpecs({
    super.key,
    required super.behaviour,
    required super.styles,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  });

  /// Usado para títulos grandes H1
  static LabelStyles get h1Lato42Gray5BoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.h1Lato42Bold.copyWith(
          color: QTheme.colors.gray5,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.h1Lato42Bold.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.h1Lato42Bold.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para títulos grandes H1 com cor `primaryBase`
  static LabelStyles get h1Lato42PrimaryBoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.h1Lato42Bold.copyWith(
          color: QTheme.colors.primaryColorBase,
          fontWeight: FontWeight.w700,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.h1Lato42Bold.copyWith(
          color: QTheme.colors.gray3,
          fontWeight: FontWeight.w700,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.h1Lato42Bold.copyWith(
          color: QTheme.colors.errorColorBase,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  /// Usado para títulos grandes H1 color [secondaryColorBase]
  static LabelStyles get h1Lato42SecondaryColorBaseBoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.h1Lato42Bold.copyWith(color: QTheme.colors.secondaryColorBase),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.h1Lato42Bold.copyWith(color: QTheme.colors.gray3),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.h1Lato42Bold.copyWith(color: QTheme.colors.secondaryColorBase),
      ),
    );
  }

  /// Usado para títulos grandes H2
  static LabelStyles get h2Lato32Gray5BoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.h2Lato32Bold.copyWith(
          color: QTheme.colors.gray5,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.h2Lato32Bold.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.h2Lato32Bold.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para títulos grandes H3
  static LabelStyles get h3Lato28Gray5BoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.h3Lato28Bold.copyWith(
          color: QTheme.colors.gray5,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.h3Lato28Bold.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.h3Lato28Bold.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para títulos grandes H4
  static LabelStyles get h4Lato24Gray5BoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.h4Lato24Bold.copyWith(
          color: QTheme.colors.gray5,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.h4Lato24Bold.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.h4Lato24Bold.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para títulos grandes H4 cor Primary
  static LabelStyles get h4Lato24PrimaryBoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.h4Lato24Bold.copyWith(
          color: QTheme.colors.primaryColorBase,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.h4Lato24Bold.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.h4Lato24Bold.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para títulos grandes H4
  static LabelStyles get h4Lato24WhiteBoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.h4Lato24Bold.copyWith(color: QTheme.colors.white),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.h4Lato24Bold.copyWith(color: QTheme.colors.white),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.h4Lato24Bold.copyWith(color: QTheme.colors.errorColorBase),
      ),
    );
  }

  /// Usado para títulos grandes H4 na cor [primary]
  static LabelStyles get h4Lato24PrimaryBaseBoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.h4Lato24Bold.copyWith(color: QTheme.colors.primaryColorBase),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.h4Lato24Bold.copyWith(color: QTheme.colors.gray3),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.h4Lato24Bold.copyWith(color: QTheme.colors.errorColorBase),
      ),
    );
  }

  /// Usado para títulos grandes h5
  static LabelStyles get h5Lato20Gray5BoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.h5Lato20Bold.copyWith(
          color: QTheme.colors.gray5,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.h5Lato20Bold.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.h5Lato20Bold.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para títulos grandes h5 na cor Gray8
  static LabelStyles get h5Roboto20Gray8BoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.h5Roboto20Bold.copyWith(
          color: QTheme.colors.gray8,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.h5Roboto20Bold.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.h5Roboto20Bold.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para corpo da tela grandes na cor Gray8
  static LabelStyles get bodyRoboto20Gray8RegularStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto20Regular.copyWith(
          color: QTheme.colors.gray8,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto20Regular.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto20Regular.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para títulos grandes h5
  static LabelStyles get h5Lato20WhiteBoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.h5Lato20Bold.copyWith(color: QTheme.colors.white),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.h5Lato20Bold.copyWith(color: QTheme.colors.white),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.h5Lato20Bold.copyWith(color: QTheme.colors.errorColorBase),
      ),
    );
  }

  /// Usado para títulos grandes h5 com cor preta
  static LabelStyles get h5Lato20BlackBoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.h5Lato20Bold.copyWith(color: QTheme.colors.black),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.h5Lato20Bold.copyWith(color: QTheme.colors.black),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.h5Lato20Bold.copyWith(color: QTheme.colors.errorColorBase),
      ),
    );
  }

  /// Usado para paragrafos com tamanho padrão
  static LabelStyles get paragraphRoboto16Gray5RegularStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Regular.copyWith(
          color: QTheme.colors.gray5,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Regular.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Regular.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para legendas com tamanho padrão
  static LabelStyles get captionRoboto14Gray5RegularStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto14Regular.copyWith(
          color: QTheme.colors.gray5,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto14Regular.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto14Regular.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para legendas com tamanho padrão
  static LabelStyles get captionRoboto14Gray4RegularStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto14Regular.copyWith(
          color: QTheme.colors.gray4,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto14Regular.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto14Regular.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para legendas com tamanho padrão
  static LabelStyles get captionRoboto14Gray3RegularStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto14Regular.copyWith(color: QTheme.colors.gray3),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto14Regular.copyWith(color: QTheme.colors.gray3),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto14Regular.copyWith(color: QTheme.colors.errorColorBase),
      ),
    );
  }

  /// Usado para legendas com tamanho padrão e cor [successColorBase]
  static LabelStyles get captionRoboto14SuccessRegularStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto14Regular.copyWith(color: QTheme.colors.successColorBase),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto14Regular.copyWith(color: QTheme.colors.gray3),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto14Regular.copyWith(color: QTheme.colors.errorColorBase),
      ),
    );
  }

  /// Usado para legendas com tamanho 14 regular e na cor [white]
  static LabelStyles get captionRoboto14WhiteRegularStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto14Regular.copyWith(
          color: QTheme.colors.white,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto14Regular.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto14Regular.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para legendas com tamanho 14 bold e na cor [white]
  static LabelStyles get captionRoboto14WhiteBoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto14Bold.copyWith(
          color: QTheme.colors.white,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto14Regular.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto14Regular.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para legendas com tamanho pequeno e regular
  static LabelStyles get captionRoboto12Gray4BoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Bold.copyWith(
          color: QTheme.colors.gray4,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Bold.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Bold.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para legendas com tamanho pequeno e regular
  static LabelStyles get captionRoboto12Gray4RegularStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Regular.copyWith(
          color: QTheme.colors.gray4,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Regular.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Regular.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para legendas com tamanho pequeno e regular
  static LabelStyles get captionRoboto12Gray3RegularStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Regular.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Regular.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Regular.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para legendas com tamanho pequeno e regular
  static LabelStyles get captionRoboto12Gray5RegularStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Regular.copyWith(
          color: QTheme.colors.gray5,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Regular.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Regular.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para legendas com tamanho pequeno cor secundaria e regular
  static LabelStyles get captionRoboto12SecondaryRegularStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Regular.copyWith(color: QTheme.colors.secondaryColorBase),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Regular.copyWith(color: QTheme.colors.gray3),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Regular.copyWith(color: QTheme.colors.errorColorBase),
      ),
    );
  }

  /// Usado para legendas com tamanho pequeno cor black e regular
  static LabelStyles get captionRoboto12BlackRegularStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Regular.copyWith(
          color: QTheme.colors.black,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Regular.copyWith(color: QTheme.colors.gray3),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Regular.copyWith(color: QTheme.colors.errorColorBase),
      ),
    );
  }

  /// Usado para legendas com tamanho pequeno cor black e bold
  static LabelStyles get captionRoboto12BlackBoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Bold.copyWith(
          color: QTheme.colors.black,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Bold.copyWith(color: QTheme.colors.gray3),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Bold.copyWith(color: QTheme.colors.errorColorBase),
      ),
    );
  }

  /// Usado para legendas com tamanho pequeno e bold
  static LabelStyles get captionRoboto12Gray5BoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Bold.copyWith(color: QTheme.colors.gray5, height: 1.5),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Bold.copyWith(color: QTheme.colors.gray3),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Bold.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para legendas com tamanho pequeno e bold
  static LabelStyles get captionRoboto12SuccessBoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Bold.copyWith(color: QTheme.colors.successColorBase),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Bold.copyWith(color: QTheme.colors.gray3),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Bold.copyWith(color: QTheme.colors.successColorBase),
      ),
    );
  }

  /// Usado para legendas com tamanho pequeno e bold
  static LabelStyles get captionRoboto12WarningBoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Bold.copyWith(color: QTheme.colors.warningColorBase),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Bold.copyWith(color: QTheme.colors.gray3),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Bold.copyWith(color: QTheme.colors.warningColorBase),
      ),
    );
  }

  /// Usado para legendas com tamanho pequeno e bold
  static LabelStyles get captionRoboto12PrimaryBoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Bold.copyWith(color: QTheme.colors.primaryColorBase),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Bold.copyWith(color: QTheme.colors.gray3),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Bold.copyWith(color: QTheme.colors.primaryColorBase),
      ),
    );
  }

  /// Usado para legendas com tamanho pequeno e bold
  static LabelStyles get captionRoboto12ErrorBoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Bold.copyWith(color: QTheme.colors.errorColorBase),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Bold.copyWith(color: QTheme.colors.gray3),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Bold.copyWith(color: QTheme.colors.errorColorBase),
      ),
    );
  }

  /// Usado para legendas com tamanho pequeno e bold
  static LabelStyles get captionRoboto12ErrorBaseRegularStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Regular.copyWith(color: QTheme.colors.errorColorBase),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Regular.copyWith(color: QTheme.colors.gray3),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto12Regular.copyWith(color: QTheme.colors.errorColorBase),
      ),
    );
  }

  /// Usado para legendas com tamanho pequeno na cor error
  static LabelStyles get captionRoboto14ErrorRegularStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto14Regular.copyWith(color: QTheme.colors.errorColorBase),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto14Regular.copyWith(color: QTheme.colors.gray3),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto14Regular.copyWith(color: QTheme.colors.errorColorBase),
      ),
    );
  }

  /// Usado para parágrafos tamanho 16 cor gray4 e regular
  static LabelStyles get paragraphRoboto16Gray4RegularStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Regular.copyWith(
          color: QTheme.colors.gray4,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Regular.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Regular.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para parágrafos
  static LabelStyles get paragraphRoboto16Gray5BoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(
          color: QTheme.colors.gray5,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para parágrafos
  static LabelStyles get paragraphRoboto16BlackBoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(
          color: QTheme.colors.black,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para parágrafos na cor Gray9
  static LabelStyles get paragraphRoboto16Gray9RegularStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Regular.copyWith(
          color: QTheme.colors.gray9,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Regular.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Regular.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para parágrafos
  static LabelStyles get paragraphRoboto16WhiteBoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(color: QTheme.colors.white),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(color: QTheme.colors.white),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(color: QTheme.colors.errorColorBase),
      ),
    );
  }

  /// Usado para parágrafos
  static LabelStyles get paragraphRoboto16Gray1BoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(color: QTheme.colors.gray1),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(color: QTheme.colors.gray1),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(color: QTheme.colors.errorColorBase),
      ),
    );
  }

  /// Usado para parágrafos
  static LabelStyles get paragraphRoboto16Gray3BoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(color: QTheme.colors.gray3),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(color: QTheme.colors.gray3),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(color: QTheme.colors.errorColorBase),
      ),
    );
  }

  /// Usado para parágrafos
  static LabelStyles get paragraphRoboto16Gray4BoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(color: QTheme.colors.gray4),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(color: QTheme.colors.gray4),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(color: QTheme.colors.errorColorBase),
      ),
    );
  }

  /// Usado para corpo de texto
  static LabelStyles get bodyRoboto16Gray5SemiBoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto16SemiBold.copyWith(
          color: QTheme.colors.gray5,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto16SemiBold.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto16SemiBold.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para corpo de texto
  static LabelStyles get bodyRoboto16Gray5MediumStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto16Medium.copyWith(
          color: QTheme.colors.gray5,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto16Medium.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto16Medium.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para corpo de texto
  static LabelStyles get bodyRoboto16BlackMediumStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto16Medium.copyWith(
          color: QTheme.colors.black,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto16Medium.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto16Medium.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para corpo de texto
  static LabelStyles get bodyRoboto16Gray4MediumStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto16Medium.copyWith(
          color: QTheme.colors.gray4,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto16Medium.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto16Medium.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para captions
  static LabelStyles get captionRoboto14Gray5BoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto14Bold.copyWith(
          color: QTheme.colors.gray5,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto14Bold.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto14Bold.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para captions
  static LabelStyles get captionRoboto14BlackBoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto14Bold.copyWith(
          color: QTheme.colors.black,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto14Bold.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.captionRoboto14Bold.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para corpo de texto
  static LabelStyles get bodyRoboto14Gray5SemiBoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14SemiBold.copyWith(
          color: QTheme.colors.gray5,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14SemiBold.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14SemiBold.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para corpo de texto
  static LabelStyles get bodyRoboto14Gray3MediumStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Medium.copyWith(
          color: QTheme.colors.gray3,
          fontWeight: FontWeight.w500,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Medium.copyWith(
          color: QTheme.colors.gray3,
          fontWeight: FontWeight.w500,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Medium.copyWith(
          color: QTheme.colors.errorColorBase,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  /// Usado para corpo de texto
  static LabelStyles get bodyRoboto14Gray5MediumStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Medium.copyWith(
          color: QTheme.colors.gray5,
          fontWeight: FontWeight.w500,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Medium.copyWith(
          color: QTheme.colors.gray3,
          fontWeight: FontWeight.w500,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Medium.copyWith(
          color: QTheme.colors.errorColorBase,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  /// Usado para corpo de texto
  static LabelStyles get bodyRoboto14Gray5RegularStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Regular.copyWith(
          color: QTheme.colors.gray5,
          fontWeight: FontWeight.w500,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Regular.copyWith(
          color: QTheme.colors.gray3,
          fontWeight: FontWeight.w500,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Regular.copyWith(
          color: QTheme.colors.errorColorBase,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  /// Usado para corpo de texto
  static LabelStyles get bodyRoboto14BlackRegularStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Regular.copyWith(
          color: QTheme.colors.black,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Regular.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Regular.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para corpo de texto
  static LabelStyles get bodyRoboto14WhiteMediumStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Medium.copyWith(
          color: QTheme.colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Medium.copyWith(
          color: QTheme.colors.gray3,
          fontWeight: FontWeight.w500,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Medium.copyWith(
          color: QTheme.colors.errorColorBase,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  /// Usado para corpo de texto
  static LabelStyles get bodyRoboto14Gray3SemiBoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14SemiBold.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14SemiBold.copyWith(
          color: QTheme.colors.gray2,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14SemiBold.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para corpo de texto e cor vermelha com peso médio
  static LabelStyles get bodyRoboto14RedMediumStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Medium.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Medium.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Medium.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para títulos tamanho 16 regular e cor gray4
  static LabelStyles get bodyRoboto16Gray4RegularStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Light.copyWith(
          color: QTheme.colors.gray4,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Light.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Light.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para títulos tamanho 16 regular e cor gray4
  static LabelStyles get bodyRoboto16Gray9RegularStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Regular.copyWith(
          color: QTheme.colors.gray9,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Light.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Light.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  ///Usado para parágrafos tamanho 16 bold e de cor primary
  static LabelStyles get paragraphRoboto16PrimaryBoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(
          color: QTheme.colors.primaryColorBase,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  ///Usado para parágrafos tamanho 16 bold e de cor success
  static LabelStyles get paragraphRoboto16SuccessBoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(
          color: QTheme.colors.successColorBase,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  ///Usado para parágrafos tamanho 16 bold e de cor success
  static LabelStyles get paragraphRoboto16ErrorBoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Utilizado apenas para [botões]
  ///
  /// Parágrafo tamanho 16 bold
  static LabelStyles get paragraphRoboto16BoldStyle {
    return LabelStyles(
      regular: LabelStyle(textStyle: QTheme.fonts.paragraphRoboto16Bold),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold,
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold,
      ),
    );
  }

  /// Utilizado apenas para [botões]
  ///
  /// Parágrafo tamanho 16 bold e cor [secondary]
  static LabelStyles get paragraphRoboto16SecondaryBoldStyle {
    return LabelStyles(
      regular: LabelStyle(textStyle: QTheme.fonts.paragraphRoboto16Bold.copyWith(color: QTheme.colors.secondaryColorBase,)),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold,
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold,
      ),
    );
  }

  /// Utilizado apenas para [botões]
  ///
  /// Parágrafo tamanho 14 medium
  static LabelStyles get paragraphRoboto14MediumStyle {
    return LabelStyles(
      regular: LabelStyle(textStyle: QTheme.fonts.paragraphRoboto14Medium),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto14Medium,
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto14Medium,
      ),
    );
  }

  /// Usado para corpo de texto
  static LabelStyles get bodyRoboto14Gray6LightStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Light.copyWith(
          color: QTheme.colors.gray6,
          fontWeight: FontWeight.w200,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Light.copyWith(
          color: QTheme.colors.gray3,
          fontWeight: FontWeight.w200,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Light.copyWith(
          color: QTheme.colors.errorColorBase,
          fontWeight: FontWeight.w200,
        ),
      ),
    );
  }

  /// Usado para corpo de texto
  static LabelStyles get bodyRoboto16Gray6LightStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto16Light.copyWith(
          color: QTheme.colors.gray6,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto16Light.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto16Light.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para corpo de texto
  static LabelStyles get bodyRoboto16WhiteRegularStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto16Regular.copyWith(
          color: QTheme.colors.white,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto16Regular.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto16Regular.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para corpo de texto
  static LabelStyles get bodyRoboto24WhiteBoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto24Bold.copyWith(
          color: QTheme.colors.white,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto24Bold.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto24Bold.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Utilizado apenas para textos com negrito em cor diferente
  ///
  /// Parágrafo tamanho 14 regular
  static LabelStyles get paragraphRoboto14HightlightSecondaryBaseStyle {
    return LabelStyles(
      regular: LabelStyle(textStyle: QTheme.fonts.paragraphRoboto14Medium),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold,
        highlightColor: QTheme.colors.secondaryColorBase,
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16Bold,
        highlightColor: QTheme.colors.secondaryColorBase,
      ),
    );
  }

  /// Utilizado apenas `QListTile.error`
  /// Parágrafo tamanho 14 regular
  static LabelStyles get bodyRoboto14ErrorRegularStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Medium.copyWith(
          color: QTheme.colors.errorColorBase,
          fontWeight: FontWeight.w500,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Medium.copyWith(
          color: QTheme.colors.errorColorBase,
          fontWeight: FontWeight.w500,
        ),
        highlightColor: QTheme.colors.errorColorBase,
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Medium.copyWith(
          color: QTheme.colors.errorColorBase,
          fontWeight: FontWeight.w500,
        ),
        highlightColor: QTheme.colors.errorColorBase,
      ),
    );
  }

  /// Usado para títulos tamanho 16 bold e cor Secondary
  static LabelStyles get bodyRoboto16SecondaryBoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto16SemiBold.copyWith(
          fontWeight: FontWeight.w700,
          color: QTheme.colors.secondaryColorBase,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto16SemiBold.copyWith(
          fontWeight: FontWeight.w700,
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto16SemiBold.copyWith(
          fontWeight: FontWeight.w700,
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para títulos tamanho 14 bold com cor Secondary
  static LabelStyles get bodyRoboto14Gray5MediumBoldSecondaryStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto14Medium.copyWith(
          color: QTheme.colors.gray5,
        ),
        highlightColor: QTheme.colors.secondaryColorBase,
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto16SemiBold.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto16SemiBold.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para parágrafos
  static LabelStyles get paragraphRoboto16Gray5SemiBoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16SemiBold.copyWith(
          color: QTheme.colors.gray5,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16SemiBold.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.paragraphRoboto16SemiBold.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para corpo de texto
  static LabelStyles get bodyRoboto16Gray5BoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto16Bold.copyWith(
          color: QTheme.colors.gray5,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto16Bold.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.bodyRoboto16Bold.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }

  /// Usado para títulos grandes H4
  static LabelStyles get h4Lato24Gray6BoldStyle {
    return LabelStyles(
      regular: LabelStyle(
        textStyle: QTheme.fonts.h4Lato24Bold.copyWith(
          color: QTheme.colors.gray6,
        ),
      ),
      shared: LabelSharedStyle(
        loadingStyle: LoadingStyle(
          size: const Size(QSizes.x108, QSizes.x24),
          baseColor: QTheme.colors.gray2,
          highlightColor: QTheme.colors.gray1,
        ),
      ),
      disabled: LabelStyle(
        textStyle: QTheme.fonts.h4Lato24Bold.copyWith(
          color: QTheme.colors.gray3,
        ),
      ),
      error: LabelStyle(
        textStyle: QTheme.fonts.h4Lato24Bold.copyWith(
          color: QTheme.colors.errorColorBase,
        ),
      ),
    );
  }
}
