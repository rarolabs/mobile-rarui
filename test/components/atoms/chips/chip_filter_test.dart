import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/components/atoms/atoms.dart';

void main() {
  late Widget widget;
  late ValueNotifier<bool> selected;

  setUpAll(() {
    selected = ValueNotifier(true);
    widget = ListenableBuilder(
        listenable: selected,
        builder: (context, child) {
          return RChipFilter(
            selected: selected.value,
            showCheckMark: true,
            label: 'Chip Filter',
            onSelected: (value) {
              selected.value = value;
            },
          );
        });
  });

  testWidgets('RChipFilter: deve renderizar corretamente', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: widget,
        ),
      ),
    );
    final rChipFilterFinder = find.byType(RChipFilter);
    expect(rChipFilterFinder, findsOneWidget);
    final labelTextFinder = find.text('Chip Filter');
    expect(labelTextFinder, findsOne);
    final rChipWidget = tester.widget<RChipFilter>(rChipFilterFinder);
    expect(rChipWidget.selected, true);
  });

  testWidgets('RChipFilter: deve alterar o estado corretamente',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: widget,
        ),
      ),
    );
    var rChipFilterFinder = find.byType(RChipFilter);
    var rChipWidget = tester.widget<RChipFilter>(rChipFilterFinder);
    expect(rChipWidget.selected, true);
    await tester.tap(rChipFilterFinder);
    await tester.pumpAndSettle();
    rChipWidget = tester.widget<RChipFilter>(rChipFilterFinder);
    expect(rChipWidget.selected, false);
    await tester.tap(rChipFilterFinder);
    await tester.pumpAndSettle();
    rChipWidget = tester.widget<RChipFilter>(rChipFilterFinder);
    expect(rChipWidget.selected, true);
  });
}
