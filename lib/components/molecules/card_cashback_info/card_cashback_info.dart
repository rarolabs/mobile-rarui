import 'card_cashback_info_specs.dart';

class QCardCashbackInfo extends CardCashbackInfoSpecs {
  final CardCashbackInfoStyleSet style;

  QCardCashbackInfo.standard({
    super.key,
    required super.behaviour,
    required super.title,
    required super.subtitle,
    required super.buttonText,
    required super.image,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = CardCashbackInfoStyleSet.standard,
        super(
          styles: CardCashbackInfoStyleSet.standard.specs,
        );
}
