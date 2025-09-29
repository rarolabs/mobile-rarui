import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/components/atoms/switch/switch.dart';

void main() {
  late RSwitch widget;

  setUpAll(() {
    widget = RSwitch(
      initialValue: false,
      onChanged: (bool) {},
    );
  });
  testWidgets('RSwitch: deve renderizar o componente corretamente',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));
    final rSwitchFinder = find.byType(RSwitch);
    expect(rSwitchFinder, findsOneWidget);
    var rSwitch = tester.widget<RSwitch>(rSwitchFinder);
    expect(rSwitch.initialValue, false);
  });

  testWidgets('RSwitch: deve alterar o valor do componente corretamente',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));
    final switchFinder = find.byType(Switch);
    expect(switchFinder, findsOneWidget);
    var _switch = tester.widget<Switch>(switchFinder);
    expect(_switch.value, false);
    await tester.tap(switchFinder);
    await tester.pumpAndSettle();
    _switch = tester.widget<Switch>(switchFinder);
    expect(_switch.value, true);
    await tester.tap(switchFinder);
    await tester.pumpAndSettle();
    _switch = tester.widget<Switch>(switchFinder);
    expect(_switch.value, false);
  });
  testWidgets('RSwitch: deve renderizar um texto', (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: RSwitch(
      initialValue: false,
      onChanged: (bool) {},
      text: 'Switch Text',
    ))));
    final textFinder = find.text('Switch Text');
    expect(textFinder, findsOneWidget);
  });
}
