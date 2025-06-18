part of 'card_cashback_info_specs.dart';

enum CardCashbackInfoStyleSet {
  standard;

  const CardCashbackInfoStyleSet();

  CardCashbackInfoStyles get specs => switch (this) {
        standard => CardCashbackInfoSpecs.standard,
      };
}
