import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/rarui.dart';

void main() {
  late List<DropdownMenuItem<String>> items;
  late RDropdownButton<String> dropdownButton;
  setUpAll(() {
    items = [
      DropdownMenuItem<String>(value: "a", child: Text("a")),
      DropdownMenuItem<String>(value: "b", child: Text("b")),
    ];
    dropdownButton = RDropdownButton<String>(
      icon: Icon(Icons.arrow_drop_down),
      items: items,
      value: items[0].value,
      onChanged: (item) {},
    );
  });

  testWidgets("RDropdownButton: deve renderizar o componente corretamente ",
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: dropdownButton)));
    final rDropsownButtonFinder = find.byType(RDropdownButton<String>);
    expect(rDropsownButtonFinder, findsOneWidget);
    final iconFinder = find.byIcon(Icons.arrow_drop_down);
    expect(iconFinder, findsOne);
    final labelTextFinder = find.text('a');
    expect(labelTextFinder, findsOne);
  });

  testWidgets('RDropdownButton: deve alterar o estado corretamente',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: dropdownButton,
        ),
      ),
    );
    var rDropdownButtonFinder = find.byType(RDropdownButton<String>);
    expect(find.text('a'), findsOne);
    expect(find.text('b'), findsNothing);
    await tester.tap(rDropdownButtonFinder);
    await tester.pumpAndSettle();
    await tester.tap(find.text('b'));
    await tester.pumpAndSettle();
    expect(find.text('a'), findsNothing);
    expect(find.text('b'), findsOne);
  });
}
