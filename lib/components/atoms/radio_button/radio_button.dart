import 'package:flutter/material.dart';
import 'package:rarUI/components/atoms/label/label.dart';

class RRadioButton<T> extends StatelessWidget {
  RRadioButton({
    Key? key,
    required this.value,
    required this.groupValue,
    this.onChanged,
    this.activeColor,
    this.label,
  }) : super(key: key);

  final T value;
  final T groupValue;
  final ValueChanged<T?>? onChanged;
  final Color? activeColor;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 32,
        maxHeight: 48,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Radio<T>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            activeColor: activeColor,
          ),
          Visibility(
            visible: label != null && label!.isNotEmpty,
            child: Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: RLabel(
                  text: label ?? '',
                  maxLines: 2,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: groupValue == value
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
