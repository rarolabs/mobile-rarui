import 'package:flutter/material.dart';

class RDatePicker extends StatelessWidget {
  const RDatePicker({
    Key? key,
    required this.onDateSelected,
    required this.builder,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.helpText,
    this.cancelText,
    this.confirmText,
    this.errorFormatText,
    this.errorInvalidText,
    this.fieldHintText,
    this.fieldLabelText,
    this.locale,
  }) : super(key: key);

  final Function(DateTime) onDateSelected;
  final Widget Function(VoidCallback onPressed) builder;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? helpText;
  final String? cancelText;
  final String? confirmText;
  final String? errorFormatText;
  final String? errorInvalidText;
  final String? fieldHintText;
  final String? fieldLabelText;
  final Locale? locale;

  @override
  Widget build(BuildContext context) {
    return builder(
      () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: initialDate ?? DateTime.now(),
          firstDate: firstDate ?? DateTime(1900),
          lastDate: lastDate ?? DateTime(2100),
          helpText: helpText,
          cancelText: cancelText,
          confirmText: confirmText,
          errorFormatText: errorFormatText,
          errorInvalidText: errorInvalidText,
          fieldHintText: fieldHintText,
          fieldLabelText: fieldLabelText,
          locale: locale,
        );

        if (picked != null) {
          onDateSelected(picked);
        }
      },
    );
  }
}
