part of 'card_icon_label_specs.dart';

enum CardIconLabelStyleSet {
  standard(CardIconLabelSpecs.standard),
  cashback(CardIconLabelSpecs.cashback),
  withImage(CardIconLabelSpecs.withImage);

  final CardIconLabelStyles Function() build;

  const CardIconLabelStyleSet(this.build);
}
