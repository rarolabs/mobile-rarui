import 'label_specs.dart';

class QLabel extends LabelSpecs {
  /// Configuração de style para a [QLabel]
  final LabelStyleSet style;

  const QLabel({
    required this.style,
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  }) : super(styles: style);

  const QLabel.h1Lato42Gray5Bold({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.h1Lato42Gray5Bold,
        super(styles: LabelStyleSet.h1Lato42Gray5Bold);

  const QLabel.h1Lato42PrimaryBold({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.h1Lato42PrimaryBold,
        super(styles: LabelStyleSet.h1Lato42PrimaryBold);

  const QLabel.h1Lato42SecondaryBold({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.h1Lato42SecondaryColorBaseBold,
        super(styles: LabelStyleSet.h1Lato42SecondaryColorBaseBold);

  const QLabel.h2Lato32Gray5Bold({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.h2Lato32Gray5Bold,
        super(styles: LabelStyleSet.h2Lato32Gray5Bold);

  const QLabel.h3Lato28Gray5Bold({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.h3Lato28Gray5Bold,
        super(styles: LabelStyleSet.h3Lato28Gray5Bold);

  const QLabel.h4Lato24Gray5Bold({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.h4Lato24Gray5Bold,
        super(styles: LabelStyleSet.h4Lato24Gray5Bold);

  const QLabel.h4Lato24WhiteBold({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.h4Lato24WhiteBold,
        super(styles: LabelStyleSet.h4Lato24WhiteBold);

  const QLabel.h4Lato24PrimaryBaseBold({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.h4Lato24PrimaryBaseBold,
        super(styles: LabelStyleSet.h4Lato24PrimaryBaseBold);

  const QLabel.h5Lato20Gray5Bold({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.h5Lato20Gray5Bold,
        super(styles: LabelStyleSet.h5Lato20Gray5Bold);

  const QLabel.h5Roboto20Gray8Bold({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.h5Roboto20Gray8Bold,
        super(styles: LabelStyleSet.h5Roboto20Gray8Bold);

  const QLabel.bodyRoboto20Gray8Regular({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.bodyRoboto20Gray8Regular,
        super(styles: LabelStyleSet.bodyRoboto20Gray8Regular);

  const QLabel.h5Lato20WhiteBold({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.h5Lato20WhiteBold,
        super(styles: LabelStyleSet.h5Lato20WhiteBold);

  const QLabel.paragraphRoboto16Gray5Bold({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.paragraphRoboto16Gray5Bold,
        super(styles: LabelStyleSet.paragraphRoboto16Gray5Bold);

  const QLabel.paragraphRoboto16WhiteBold({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.paragraphRoboto16WhiteBold,
        super(styles: LabelStyleSet.paragraphRoboto16WhiteBold);

  const QLabel.paragraphRoboto16Gray1Bold({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.paragraphRoboto16WhiteBold,
        super(styles: LabelStyleSet.paragraphRoboto16WhiteBold);

  const QLabel.bodyRoboto16Gray5SemiBold({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.bodyRoboto16Gray5SemiBold,
        super(styles: LabelStyleSet.bodyRoboto16Gray5SemiBold);

  /// Label utilizado em títulos com tamanho 16 e cor Gray6
  const QLabel.bodyRoboto16Gray6Light({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.bodyRoboto16Gray6Light,
        super(styles: LabelStyleSet.bodyRoboto16Gray6Light);

  const QLabel.paragraphRoboto16PrimaryBold({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.paragraphRoboto16PrimaryBold,
        super(styles: LabelStyleSet.paragraphRoboto16PrimaryBold);

  const QLabel.paragraphRoboto16Gray5Regular({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.paragraphRoboto16Gray5Regular,
        super(styles: LabelStyleSet.paragraphRoboto16Gray5Regular);

  const QLabel.paragraphRoboto16Gray9Regular({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.paragraphRoboto16Gray9Regular,
        super(styles: LabelStyleSet.paragraphRoboto16Gray9Regular);

  const QLabel.paragraphRoboto16Gray4Regular({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.paragraphRoboto16Gray4Regular,
        super(styles: LabelStyleSet.paragraphRoboto16Gray4Regular);

  const QLabel.captionRoboto14Gray5Bold({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.captionRoboto14Gray5Bold,
        super(styles: LabelStyleSet.captionRoboto14Gray5Bold);

  const QLabel.bodyRoboto14Gray5SemiBold({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.bodyRoboto14Gray5SemiBold,
        super(styles: LabelStyleSet.bodyRoboto14Gray5SemiBold);

  /// Label utilizado em títulos com tamanho 14 e cor Gray6
  const QLabel.bodyRoboto14Gray6Light({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textOverflow,
    super.textAlign,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.bodyRoboto14Gray6Light,
        super(styles: LabelStyleSet.bodyRoboto14Gray6Light);

  /// Label utilizado em títulos grandes com tamanho 24 e cor Branca
  const QLabel.bodyRoboto24WhiteBold({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.bodyRoboto24WhiteBold,
        super(styles: LabelStyleSet.bodyRoboto24WhiteBold);

  const QLabel.captionRoboto14Gray5Regular({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.captionRoboto14Gray5Regular,
        super(styles: LabelStyleSet.captionRoboto14Gray5Regular);

  const QLabel.captionRoboto14Gray4Regular({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.captionRoboto14Gray4Regular,
        super(styles: LabelStyleSet.captionRoboto14Gray4Regular);

  const QLabel.bodyRoboto16Gray5Medium({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.bodyRoboto16Gray5Medium,
        super(styles: LabelStyleSet.bodyRoboto16Gray5Medium);

  const QLabel.bodyRoboto16Gray4Medium({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.bodyRoboto16Gray4Medium,
        super(styles: LabelStyleSet.bodyRoboto16Gray4Medium);

  const QLabel.captionRoboto12ErrorBaseRegular({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.captionRoboto12ErrorBaseRegular,
        super(styles: LabelStyleSet.captionRoboto12ErrorBaseRegular);

  const QLabel.captionRoboto12Gray3Regular({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.captionRoboto12Gray3Regular,
        super(styles: LabelStyleSet.captionRoboto12Gray3Regular);

  const QLabel.captionRoboto14Gray3Regular({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.captionRoboto14Gray3Regular,
        super(styles: LabelStyleSet.captionRoboto14Gray3Regular);

  const QLabel.captionRoboto12Gray5Regular({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.captionRoboto12Gray5Regular,
        super(styles: LabelStyleSet.captionRoboto12Gray5Regular);

  const QLabel.captionRoboto12SecondaryRegular({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.captionRoboto12SecondaryRegular,
        super(styles: LabelStyleSet.captionRoboto12SecondaryRegular);

  const QLabel.captionRoboto12Gray5Bold({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.captionRoboto12Gray5Bold,
        super(styles: LabelStyleSet.captionRoboto12Gray5Bold);

  const QLabel.captionRoboto14SuccessRegular({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.captionRoboto14SuccessRegular,
        super(styles: LabelStyleSet.captionRoboto14SuccessRegular);

  /// Utilizado apenas para [botões]
  ///
  /// Parágrafo tamanho 16 bold
  const QLabel.paragraphRoboto16Bold({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.hintSemantics,
  })  : style = LabelStyleSet.paragraphRoboto16Bold,
        super(styles: LabelStyleSet.paragraphRoboto16Bold);

  const QLabel.h4Lato24Gray6Bold({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.h4Lato24Gray6Bold,
        super(
          styles: LabelStyleSet.h4Lato24Gray6Bold,
        );

  /// Utilizado apenas para textos em negrito de cor diferente
  ///
  /// Parágrafo tamanho 14 medium
  const QLabel.paragraphRoboto14HightlightSecondaryBaseStyle({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.hintSemantics,
  })  : style = LabelStyleSet.paragraphRoboto14HightlightSecondaryBaseStyle,
        super(styles: LabelStyleSet.paragraphRoboto14HightlightSecondaryBaseStyle);

  /// Legenda tamanho 14 [regular] na cor [white]
  const QLabel.captionRoboto14WhiteRegular({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.captionRoboto14WhiteRegular,
        super(styles: LabelStyleSet.captionRoboto14WhiteRegular);

  /// Legenda tamanho 14 [bold] na cor [white]
  const QLabel.captionRoboto14WhiteBold({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.captionRoboto14WhiteBold,
        super(styles: LabelStyleSet.captionRoboto14WhiteBold);

  /// Legenda tamanho 12 [bold] na cor [gray4]
  const QLabel.captionRoboto12Gray4Bold({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.captionRoboto12Gray4Bold,
        super(styles: LabelStyleSet.captionRoboto12Gray4Bold);

  const QLabel.captionRoboto12Gray4Regular({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.captionRoboto12Gray4Regular,
        super(styles: LabelStyleSet.captionRoboto12Gray4Regular);

  const QLabel.captionRoboto12ErrorBold({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.captionRoboto12ErrorBold,
        super(styles: LabelStyleSet.captionRoboto12ErrorBold);

  const QLabel.bodyRoboto14WhiteMedium({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.bodyRoboto14WhiteMedium,
        super(styles: LabelStyleSet.bodyRoboto14WhiteMedium);

  const QLabel.bodyRoboto14Gray3Medium({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.bodyRoboto14Gray3Medium,
        super(styles: LabelStyleSet.bodyRoboto14Gray3Medium);

  const QLabel.bodyRoboto14Gray5Regular({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.bodyRoboto14Gray5Regular,
        super(styles: LabelStyleSet.bodyRoboto14Gray5Regular);

  const QLabel.bodyRoboto14Gray5Medium({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.bodyRoboto14Gray5Medium,
        super(styles: LabelStyleSet.bodyRoboto14Gray5Medium);

  const QLabel.bodyRoboto14ErrorRegular({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.bodyRoboto14ErrorRegular,
        super(styles: LabelStyleSet.bodyRoboto14ErrorRegular);

  const QLabel.captionRoboto14ErrorRegular({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.captionRoboto14ErrorRegular,
        super(styles: LabelStyleSet.captionRoboto14ErrorRegular);

  const QLabel.paragraphRoboto16Gray3Bold({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.paragraphRoboto16Gray3Bold,
        super(styles: LabelStyleSet.paragraphRoboto16Gray3Bold);

  const QLabel.paragraphRoboto16Gray4Bold({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.paragraphRoboto16Gray4Bold,
        super(styles: LabelStyleSet.paragraphRoboto16Gray4Bold);

  const QLabel.bodyRoboto16WhiteRegular({
    super.key,
    required super.behaviour,
    super.text,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
    super.textDirection,
    super.minFontSize,
    super.group,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = LabelStyleSet.bodyRoboto16WhiteRegular,
        super(styles: LabelStyleSet.bodyRoboto16WhiteRegular);
}
