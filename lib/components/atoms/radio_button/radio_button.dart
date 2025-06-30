import 'package:flutter/material.dart';

class RRadioButton<T> extends StatelessWidget {
  RRadioButton({
    Key? key,
    required this.value,
    required this.groupValue,
    this.onChanged,
    this.activeColor,
  }) : super(key: key);

  final T value;
  final T groupValue;
  final ValueChanged<T?>? onChanged;
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    return Radio<T>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      activeColor: activeColor,
    );
  }
}
