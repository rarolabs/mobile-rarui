part of 'card_icon_button_specs.dart';

enum CardIconButtonStyleSet {
  standard,
  withButton,
  coupon;

  const CardIconButtonStyleSet();

  CardIconButtonStyles get specs => switch (this) {
        standard => CardIconButtonSpecs.standard,
        withButton => CardIconButtonSpecs.withButton,
        coupon => CardIconButtonSpecs.coupon,
      };
}
