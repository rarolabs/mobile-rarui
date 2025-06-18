import 'package:intl/intl.dart';

import '../enums/coin_type.dart';

extension MoneyExtension on String {
  /// Converte valor em String com `R$`
  double get realToDouble =>
      double.tryParse(replaceAll('R\$', '').replaceAll('.', '').replaceAll(',', '.').trim()) ?? 0;

  /// Converte o valor em double
  double toDoubleMoney(CoinType type) {
    final format = NumberFormat.currency(
      locale: type.locale,
      symbol: type.symbol,
    );

    final cleaned = replaceAll(type.symbol, '').trim();

    return format.parse(cleaned).toDouble();
  }
}
