import 'card_icon_button_specs.dart';

class QCardIconButton extends CardIconButtonSpecs {
  final CardIconButtonStyleSet style;

  QCardIconButton.standard({
    super.key,
    required super.behaviour,
    required super.title,
    required super.subtitle,
    required super.image,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = CardIconButtonStyleSet.standard,
        super(
          styles: CardIconButtonStyleSet.standard.specs,
        );

  QCardIconButton.withButton({
    super.key,
    required super.behaviour,
    required super.title,
    required super.subtitle,
    required super.buttonText,
    required super.image,
    required super.onButtonPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = CardIconButtonStyleSet.withButton,
        super(
          styles: CardIconButtonStyleSet.withButton.specs,
        );

  QCardIconButton.coupon({
    super.key,
    required super.behaviour,
    required super.title,
    required super.subtitle,
    required super.footer,
    required super.buttonText,
    required super.onButtonPressed,
    required super.image,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = CardIconButtonStyleSet.coupon,
        super(
          styles: CardIconButtonStyleSet.coupon.specs,
          horizontalAlignment: true,
        );

  QCardIconButton.info({
    super.key,
    required super.behaviour,
    required super.title,
    required super.subtitle,
    required super.svgBase64,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = CardIconButtonStyleSet.coupon,
        super(
          styles: CardIconButtonStyleSet.coupon.specs,
          horizontalAlignment: true,
        );
}
