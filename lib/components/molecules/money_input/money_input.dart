import 'package:flutter/material.dart';
import 'package:rarUI/components/atoms/atoms.dart';
import 'package:rarUI/utils/enums/coin_type.dart';
import 'package:rarUI/utils/extensions/money_formatter_extension.dart';

class RMoneyInput extends StatelessWidget {
  const RMoneyInput({
    Key? key,
    this.controller,
    this.initialValue = 0.0,
    this.coinType = CoinType.real,
  }) : super(key: key);

  final TextEditingController? controller;
  final CoinType coinType;
  final double? initialValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RTextFormField(
          controller: controller,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          initialValue: initialValue == null
              ? null
              : coinType.currencyFormat.format(initialValue!),
          inputFormatters: [
            MoneyFormatter(coinType: coinType),
          ],
        ),
      ],
    );
  }
}
