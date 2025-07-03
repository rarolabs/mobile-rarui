import 'package:flutter/material.dart';

class RTimePicker extends StatelessWidget {
  const RTimePicker({
    Key? key,
    required this.onTimeSelected,
    required this.builder,
    this.initialTime,
    this.helpText,
    this.cancelText,
    this.confirmText,
    this.hourLabelText,
    this.minuteLabelText,
    this.errorInvalidText,
    this.orientation,
    this.entryMode,
  }) : super(key: key);

  final Function(TimeOfDay) onTimeSelected;
  final Widget Function(VoidCallback onPressed) builder;
  final TimeOfDay? initialTime;
  final String? helpText;
  final String? cancelText;
  final String? confirmText;
  final String? hourLabelText;
  final String? minuteLabelText;
  final String? errorInvalidText;
  final Orientation? orientation;
  final TimePickerEntryMode? entryMode;

  @override
  Widget build(BuildContext context) {
    return builder(
      () async {
        final TimeOfDay? picked = await showTimePicker(
          context: context,
          initialTime: initialTime ?? TimeOfDay.now(),
          helpText: helpText,
          cancelText: cancelText,
          confirmText: confirmText,
          hourLabelText: hourLabelText,
          minuteLabelText: minuteLabelText,
          errorInvalidText: errorInvalidText,
          orientation: orientation,
          initialEntryMode: entryMode ?? TimePickerEntryMode.dial,
        );

        if (picked != null) {
          onTimeSelected(picked);
        }
      },
    );
  }
}
