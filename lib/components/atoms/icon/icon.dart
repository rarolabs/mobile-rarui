import 'icon_specs.dart';

class QIcon extends IconSpecs {
  /// Style configurtion for [QIcon]
  final IconStyleSet style;

  const QIcon({
    required this.style,
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  }) : super(styles: style);

  /// Ícone com tamanho 16 e cor Secondary
  const QIcon.size16Secondary({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size16SecondaryBase,
        super(styles: IconStyleSet.size16SecondaryBase);

  /// Ícone com tamanho 24 e cor Success
  const QIcon.size24Success({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size24Success,
        super(styles: IconStyleSet.size24Success);

  /// Ícone com tamanho 24 e cor Warning
  const QIcon.size24Warning({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size24Warning,
        super(styles: IconStyleSet.size24Warning);

  /// Ícone com tamanho 20 e cor White
  const QIcon.size20White({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size20White,
        super(styles: IconStyleSet.size20White);

  /// Ícone com tamanho 20 e cor Secondary
  const QIcon.size20Secondary({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size20SecondaryBase,
        super(styles: IconStyleSet.size20SecondaryBase);

  /// Ícone com tamanho 14 e cor White
  const QIcon.size14White({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size14White,
        super(styles: IconStyleSet.size14White);

  /// Ícone com tamanho 16 e cor Gray5
  const QIcon.icon16Gray5({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size16Gray5,
        super(styles: IconStyleSet.size16Gray5);

  /// Ícone com tamanho 14 e cor Gray3
  const QIcon.size14Gray3({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size12Gray3,
        super(styles: IconStyleSet.size12Gray3);

  /// Ícone com tamanho 24 e cor Gray5
  const QIcon.size24Gray5({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size24Gray5,
        super(styles: IconStyleSet.size24Gray5);

  /// Ícone com tamanho 24 e cor Gray3
  const QIcon.size24Gray3({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size24Gray3,
        super(styles: IconStyleSet.size24Gray3);

  /// Ícone com tamanho 24 e cor SecondaryColorBase
  const QIcon.size24SecondaryColorBase({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size24SecondaryBase,
        super(styles: IconStyleSet.size24SecondaryBase);

  /// Ícone com tamanho 24 e cor Red
  const QIcon.size24Red({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size24Red,
        super(styles: IconStyleSet.size24Red);

  /// Ícone com tamanho [24] e cor [white]
  const QIcon.size24White({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size24White,
        super(styles: IconStyleSet.size24White);

  /// Ícone com tamanho [24] e cor [primaryBase]
  const QIcon.size24PrimaryBase({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size24PrimaryBase,
        super(styles: IconStyleSet.size24PrimaryBase);

  /// Ícone com tamanho [24] e cor [primaryBaseDark]
  const QIcon.size24PrimaryBaseDark({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size24PrimaryBaseDark,
        super(styles: IconStyleSet.size24PrimaryBaseDark);

  /// Ícone com tamanho 28 e cor Ciano
  const QIcon.size28Ciano({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size28Ciano,
        super(styles: IconStyleSet.size28Ciano);

  /// Ícone com tamanho 32 e cor Gray5
  const QIcon.size32Gray5({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size32Gray5,
        super(styles: IconStyleSet.size32Gray5);

  /// Ícone com tamanho 32 e cor Gray1
  const QIcon.size32Gray1({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size32Gray1,
        super(styles: IconStyleSet.size32Gray1);

  /// Ícone com tamanho 36 e cor White
  const QIcon.size36White({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size36White,
        super(styles: IconStyleSet.size36White);

  /// Ícone com tamanho 130 e cor Gray5
  const QIcon.size130Gray5({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size130Gray5,
        super(styles: IconStyleSet.size130Gray5);

  /// Ícone com tamanho 48 e cor Red
  const QIcon.size48ErrorBase({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size48ErrorBase,
        super(styles: IconStyleSet.size48ErrorBase);

  /// Ícone com tamanho 16 e cor Success0
  const QIcon.size16Success0({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size16Success0,
        super(styles: IconStyleSet.size16Success0);

  /// Ícone com tamanho 16 e cor Black
  const QIcon.size16Black({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size16Black,
        super(styles: IconStyleSet.size16Black);

  const QIcon.size24Error({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size24Error,
        super(styles: IconStyleSet.size24Error);

  /// Ícone com tamanho 72 e cor successBase
  const QIcon.size72SuccessBase({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size72SuccessBase,
        super(styles: IconStyleSet.size72SuccessBase);

  /// Ícone com tamanho 72 e cor errorBase
  const QIcon.size72ErrorBase({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size72ErrorBase,
        super(styles: IconStyleSet.size72ErrorBase);

  /// Ícone com tamanho 72 e cor warningBase
  const QIcon.size72WarningBase({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size72WarningBase,
        super(styles: IconStyleSet.size72WarningBase);

  /// Ícone com tamanho 28 e cor Secondary
  const QIcon.size28Secondary({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size28Secondary,
        super(styles: IconStyleSet.size28Secondary);

  /// Ícone a partir de um base64 com tamanho 16 e cor Black
  const QIcon.base64size16Black({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size16Black,
        super(styles: IconStyleSet.size16Black, isBase64: true);

  /// Ícone a partir de um base64 com tamanho 32 e cor Black
  const QIcon.base64size32Black({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size32Black,
        super(styles: IconStyleSet.size32Black, isBase64: true);

  /// Ícone com tamanho 72 e cor warningLight
  const QIcon.size72WarningLight({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size72WarningLight,
        super(styles: IconStyleSet.size72WarningLight);

  /// Ícone com tamanho 72 e cor Gray5
  const QIcon.size72Gray5({
    super.key,
    required super.behaviour,
    required super.svgPath,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = IconStyleSet.size72Gray5,
        super(styles: IconStyleSet.size72Gray5);
}
