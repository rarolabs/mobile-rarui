import 'card_info_specs.dart';

class QCardInfo extends CardInfoSpecs {
  /// Configuração de estilo do componente
  final CardInfoStyleSet style;

  const QCardInfo({
    required this.style,
    required super.behaviour,
    required super.cardSkinURL,
    super.isVertical,
    super.title,
    super.subtitle,
    super.textSemantics,
    super.key,
  }) : super(styles: style);

  /// Card info padrão
  const QCardInfo.standard({
    required super.behaviour,
    required super.cardSkinURL,
    super.title,
    super.subtitle,
    super.textSemantics,
    super.isVertical,
    super.key,
  })  : style = CardInfoStyleSet.standard,
        super(
          styles: CardInfoStyleSet.standard,
        );

  const QCardInfo.vertical({
    required super.behaviour,
    required super.cardSkinURL,
    super.title,
    super.subtitle,
    super.textSemantics,
    super.key,
  })  : style = CardInfoStyleSet.standard,
        super(
        isVertical: true,
        styles: CardInfoStyleSet.standard,
      );
}
