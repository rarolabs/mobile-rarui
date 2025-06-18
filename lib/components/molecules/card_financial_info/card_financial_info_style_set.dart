import 'card_financial_info_specs.dart';
import 'card_financial_info_style.dart';

enum CardFinancialInfoStyleSet {
  standard;

  const CardFinancialInfoStyleSet();

  CardFinancialInfoStyles get specs {
    return switch (this) {
      standard => CardFinancialInfoSpecs.standard,
    };
  }
}
