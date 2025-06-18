part of 'card_cashback_category_specs.dart';

enum CardCashbackCategoryStyleSet {
  size72x72(CardCashbackCategorySpecs.size72x72Style);

  final CardCashbackCategoryStyles Function() build;

  const CardCashbackCategoryStyleSet(this.build);
}
