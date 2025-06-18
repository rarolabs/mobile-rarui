import 'card_icon_label_specs.dart';

class QCardIconLabel extends CardIconLabelSpecs {
  /// Style configurtion for [QCardIconLabel]
  final CardIconLabelStyleSet style;

  /// Representa o componente principal, contendo título, subtítulo e um
  /// Circle Avatar com as iniciais do título
  QCardIconLabel.standard({
    super.key,
    required super.behaviour,
    required super.title,
    required super.subtitle,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = CardIconLabelStyleSet.standard,
        super(
          styles: CardIconLabelStyleSet.standard.build(),
        );

  /// Variação do componente principal, contendo título, subtítulo e uma
  /// imagem ao invés de iniciais com bordas ligeiramente arredondadas
  QCardIconLabel.withImage({
    super.key,
    required super.behaviour,
    required super.title,
    required super.subtitle,
    required super.image,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = CardIconLabelStyleSet.withImage,
        super(
          styles: CardIconLabelStyleSet.withImage.build(),
        );

  /// Variação do componente principal feito para cashback, contendo título, subtítulo e uma
  /// imagem ao invés de iniciais com bordas ligeiramente arredondadas
  QCardIconLabel.cashback({
    super.key,
    required super.behaviour,
    required super.title,
    required super.subtitle,
    required super.image,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = CardIconLabelStyleSet.cashback,
        super(
          styles: CardIconLabelStyleSet.cashback.build(),
        );
}
