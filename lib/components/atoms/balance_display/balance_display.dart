import 'package:flutter/material.dart';

class RBalanceDisplay extends StatelessWidget {
  final String balanceText;
  final TextStyle? textStyle;
  final bool initiallyVisible;

  const RBalanceDisplay({
    super.key,
    required this.balanceText,
    this.textStyle,
    this.initiallyVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultStyle = theme.textTheme.headlineSmall?.copyWith(
      fontWeight: FontWeight.bold,
      color: textStyle?.color,
    );

    var hiddenBalanceText = '•••••';

    return Text(initiallyVisible ? '$balanceText' : '${hiddenBalanceText}',
        style: initiallyVisible ? textStyle : defaultStyle);
  }
}
