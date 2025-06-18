import 'package:intl/intl.dart';

import '../enums/coin_type.dart';

extension NumUtils on num {
  String formattedMoney(CoinType type) => NumberFormat.currency(
        locale: type.locale,
        symbol: type.symbol,
      ).format(this);

  String toPercentage({int decimalDigits = 2}) =>
      NumberFormat.decimalPercentPattern(decimalDigits: decimalDigits).format(this / 100);
}
