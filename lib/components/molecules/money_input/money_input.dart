import 'package:flutter/material.dart';
import 'package:rarUI/components/atoms/atoms.dart';
import 'package:rarUI/components/atoms/balance_display/balance_display.dart';
import 'package:rarUI/components/molecules/buttons/icon_button.dart';
import 'package:rarUI/utils/enums/coin_type.dart';
import 'package:rarUI/utils/extensions/money_formatter_extension.dart';

class RMoneyInput extends StatefulWidget {
  const RMoneyInput({
    Key? key,
    this.controller,
    this.initialValue = 0.0,
    this.coinType = CoinType.real,
    this.initiallyVisible = true,
    this.balanceDescription,
    this.balanceValue = 0.0,
    this.dividerWidth = 200.0,
    this.inputTextStyle,
    this.balanceDescriptionTextStyle,
    this.balanceValueTextStyle,
  }) : super(key: key);

  final TextEditingController? controller;
  final CoinType coinType;
  final double? initialValue;
  final String? balanceDescription;
  final double balanceValue;
  final bool initiallyVisible;
  final double dividerWidth;
  final TextStyle? inputTextStyle;
  final TextStyle? balanceDescriptionTextStyle;
  final TextStyle? balanceValueTextStyle;

  @override
  State<RMoneyInput> createState() => _RMoneyInputState();
}

class _RMoneyInputState extends State<RMoneyInput> {
  late bool visible;

  @override
  void initState() {
    visible = widget.initiallyVisible;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RTextFormField(
          controller: widget.controller,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          style: widget.inputTextStyle ??
              theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
          textAlign: TextAlign.center,
          initialValue: widget.initialValue == null
              ? null
              : widget.coinType.currencyFormat.format(widget.initialValue!),
          inputFormatters: [
            MoneyFormatter(coinType: widget.coinType),
          ],
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
        ),
        SizedBox(
          width: widget.dividerWidth,
          child: Divider(
            height: 1,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 4.0,
          children: [
            Visibility(
                visible: widget.balanceDescription != null,
                child: RLabel(
                  text: widget.balanceDescription!,
                  style: widget.balanceDescriptionTextStyle ??
                      theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                )),
            RBalanceDisplay(
              balanceText:
                  widget.coinType.currencyFormat.format(widget.balanceValue),
              initiallyVisible: visible,
              textStyle: widget.balanceValueTextStyle ??
                  theme.textTheme.bodyLarge
                      ?.copyWith(color: theme.colorScheme.onSurface),
            ),
            RIconButton(
              icon: Icons.visibility,
              size: 16.0,
              onPressed: () {
                setState(() {
                  visible = !visible;
                });
              },
            ),
          ],
        )
      ],
    );
  }
}
