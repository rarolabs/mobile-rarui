import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/rarui.dart';

void main() {
  late ValueListenableBuilder widget;
  ValueNotifier<int> groupValue = ValueNotifier(0);

  setUpAll(() {
    widget = ValueListenableBuilder(
        valueListenable: groupValue,
        builder: (context, _groupValue, child) {
          return RRadioButton<int>(
            value: 1,
            groupValue: _groupValue,
            onChanged: (value) {
              groupValue.value = value!;
            },
          );
        });
  });
  testWidgets('RRadioButton: deve renderizar o componente corretamente',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));
    final rRadioButtonFinder = find.byType(RRadioButton<int>);
    expect(rRadioButtonFinder, findsOneWidget);
    var rRadioButton = tester.widget<RRadioButton>(rRadioButtonFinder);
    expect(rRadioButton.value, 1);
    expect(rRadioButton.groupValue, 0);
  });

  testWidgets(
      'RRadioButton: deve selecionar o componente RRadioButton corretamente',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));
    final rRadioButtonFinder = find.byType(RRadioButton<int>);
    expect(rRadioButtonFinder, findsOneWidget);
    var rRadioButton = tester.widget<RRadioButton>(rRadioButtonFinder);
    expect(rRadioButton.value, 1);
    expect(rRadioButton.groupValue, 0);
    await tester.tapAt(Offset(0, 24));
    await tester.pumpAndSettle();
    rRadioButton = tester.widget<RRadioButton>(rRadioButtonFinder);
    expect(rRadioButton.value, 1);
    expect(rRadioButton.groupValue, 1);
  });

  testWidgets(
      'RRadioButton: deve renderizar o componente corretamente com texto',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RRadioButton<int>(
            value: 1,
            groupValue: 0,
            onChanged: (value) {
              groupValue.value = value!;
            },
            label: 'Label de teste',
          ),
        ),
      ),
    );
    final rRadioButtonFinder = find.byType(RRadioButton<int>);
    expect(rRadioButtonFinder, findsOneWidget);
    var rRadioButton = tester.widget<RRadioButton>(rRadioButtonFinder);
    expect(rRadioButton.value, 1);
    expect(rRadioButton.groupValue, 0);
    expect(rRadioButton.label, 'Label de teste');
  });
}
