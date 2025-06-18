part of 'card_info_specs.dart';

enum CardInfoStyleSet {
  standard;

  const CardInfoStyleSet();

  CardInfoStyles get specs {
    return switch (this) {
      standard => CardInfoSpecs.standardStyle,
    };
  }
}
