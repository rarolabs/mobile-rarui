import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/atoms.dart';

void main() {
  late Widget widget;
  late ValueNotifier<bool> selected;

  setUpAll(() {
    selected = ValueNotifier(false);
    widget = ListenableBuilder(
        listenable: selected,
        builder: (context, child) {
          return RChipInput(
            icon: Icon(Icons.abc),
            selected: selected.value,
            label: 'Chip Input',
            onSelected: (value) {
              selected.value = value;
            },
            deleteIcon: Icon(Icons.delete),
            onDeleted: () {},
          );
        });
  });

  testWidgets('RChipInput: deve renderizar corretamente', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: widget,
        ),
      ),
    );
    final rChipInputFinder = find.byType(RChipInput);
    expect(rChipInputFinder, findsOneWidget);
    final iconFinder = find.byIcon(Icons.abc);
    expect(iconFinder, findsOne);
    final deleteIconFinder = find.byIcon(Icons.delete);
    expect(deleteIconFinder, findsOne);
    final labelTextFinder = find.text('Chip Input');
    expect(labelTextFinder, findsOne);
    final rChipWidget = tester.widget<RChipInput>(rChipInputFinder);
    expect(rChipWidget.selected, false);
    expect(rChipWidget.isEnabled, true);
  });

  testWidgets('RChipInput: deve alterar o estado corretamente', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: widget,
        ),
      ),
    );
    var rChipInputFinder = find.byType(RChipInput);
    var rChipWidget = tester.widget<RChipInput>(rChipInputFinder);
    expect(rChipWidget.selected, false);
    await tester.tap(rChipInputFinder);
    await tester.pumpAndSettle();
    rChipWidget = tester.widget<RChipInput>(rChipInputFinder);
    expect(rChipWidget.selected, true);
    await tester.tap(rChipInputFinder);
    await tester.pumpAndSettle();
    rChipWidget = tester.widget<RChipInput>(rChipInputFinder);
    expect(rChipWidget.selected, false);
  });
}
