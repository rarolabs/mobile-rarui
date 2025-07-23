import 'package:flutter/material.dart';

class RCalendar extends StatelessWidget {
  RCalendar({
    Key? key,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.onDateChanged,
    this.currentDate,
    this.selectableDayPredicate,
  }) : super(key: key);

  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime? currentDate;
  final ValueChanged<DateTime> onDateChanged;
  final SelectableDayPredicate? selectableDayPredicate;

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker(
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      currentDate: currentDate,
      onDateChanged: onDateChanged,
      selectableDayPredicate: selectableDayPredicate,
    );
  }
}
