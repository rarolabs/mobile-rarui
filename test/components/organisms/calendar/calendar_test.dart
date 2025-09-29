import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/rarui.dart';

void main() {
  ValueNotifier<DateTime?> selectedDate = ValueNotifier(null);
  testWidgets(
      'RCalendar: deve renderizar corretamente e muda o valor da data atual',
      (tester) async {
    final rCalendarKey = const Key("calendar");
    final widget = ValueListenableBuilder(
        valueListenable: selectedDate,
        builder: (context, value, child) {
          return RCalendar(
            key: rCalendarKey,
            initialDate: DateTime(2023, 1, 1),
            firstDate: DateTime(2020, 1, 1),
            lastDate: DateTime(2025, 1, 1),
            onDateChanged: (date) {
              selectedDate.value = date;
            },
          );
        });

    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

    final calendar = tester.widget<RCalendar>(find.byType(RCalendar));

    expect(calendar.initialDate, DateTime(2023, 1, 1));
    expect(calendar.firstDate, DateTime(2020, 1, 1));
    expect(calendar.lastDate, DateTime(2025, 1, 1));
    await tester.tap(find.text('18'));
    await tester.pumpAndSettle();
    expect(selectedDate.value, DateTime(2023, 1, 18));
  });
}
