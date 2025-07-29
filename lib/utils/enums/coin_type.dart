import 'package:intl/intl.dart';

enum CoinType {
  real,
  dollar,
  euro,
}

extension CoinTypeExtension on CoinType {
  String get symbol {
    switch (this) {
      case CoinType.real:
        return 'R\$';
      case CoinType.dollar:
        return '\$';
      case CoinType.euro:
        return '€';
    }
  }

  String get locale {
    switch (this) {
      case CoinType.real:
        return 'pt_BR';
      case CoinType.dollar:
        return 'en_US';
      case CoinType.euro:
        return 'de_DE';
    }
  }
}

CoinType? coinTypeFromCurrencyCode(String code) {
  switch (code.toUpperCase()) {
    case 'BRL':
      return CoinType.real;
    case 'USD':
      return CoinType.dollar;
    case 'EUR':
      return CoinType.euro;
    default:
      return CoinType.real;
  }
}

CoinType? coinTypeFromString(String value) {
  try {
    return CoinType.values.byName(value);
  } catch (_) {
    return null;
  }
}

extension CurrencyTextInputExtension on CoinType {
  NumberFormat get currencyFormat => NumberFormat.currency(
        locale: locale,
        name: name,
        symbol: symbol,
      );
}
