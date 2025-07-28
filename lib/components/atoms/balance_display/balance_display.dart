import 'package:flutter/material.dart';

class RBalanceDisplay extends StatefulWidget {
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
  State<RBalanceDisplay> createState() => _RBalanceDisplayState();
}

class _RBalanceDisplayState extends State<RBalanceDisplay> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _isVisible = widget.initiallyVisible;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultStyle = theme.textTheme.headlineSmall?.copyWith(
      fontWeight: FontWeight.bold,
      color: widget.textStyle?.color,
    );

    var hiddenBalanceText = '•••••';

    return Text(_isVisible ? '${widget.balanceText}' : '${hiddenBalanceText}',
        style: _isVisible ? widget.textStyle : defaultStyle);
  }
}
