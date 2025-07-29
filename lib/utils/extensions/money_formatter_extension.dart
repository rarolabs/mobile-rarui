import 'dart:math';

import 'package:flutter/services.dart';
import 'package:rarUI/utils/enums/coin_type.dart';

class MoneyFormatter extends TextInputFormatter {
  MoneyFormatter({
    required this.coinType,
    this.minValue,
    this.maxValue,
  });

  final CoinType coinType;
  final num? minValue;
  final num? maxValue;

  num _newNum = 0;
  String _newString = '';

  bool _isLessThanMinValue(num value) {
    if (minValue == null) {
      return false;
    }
    return value < minValue!;
  }

  bool _isMoreThanMaxValue(num value) {
    if (maxValue == null) {
      return false;
    }
    return value > maxValue!;
  }

  void _formatter(String newText) {
    _newNum = _parseStrToNum(newText);
    _newString = coinType.currencyFormat.format(_newNum).trim();
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.contains(' ')) {
      return oldValue;
    }

    String newText = newValue.text.replaceAll(RegExp('[^0-9]'), '');

    final num value = _parseStrToNum(newText);

    if (_isLessThanMinValue(value) || _isMoreThanMaxValue(value)) {
      return oldValue;
    }

    _formatter(newText);

    if (newText.trim() == '' || newText == '00' || newText == '000') {
      return TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    return TextEditingValue(
      text: _newString,
      selection: TextSelection.collapsed(offset: _newString.length),
    );
  }

  num _parseStrToNum(String text) {
    num value = num.tryParse(text) ?? 0;
    if (coinType.currencyFormat.decimalDigits != null &&
        coinType.currencyFormat.decimalDigits! > 0) {
      value /= pow(10, coinType.currencyFormat.decimalDigits!);
    }
    return value;
  }
}
