import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/rarui.dart';

void main() {
  late List<DropdownMenuEntry<int>> items;
  late RDropdownMenu<int> dropdownMenu;
  setUpAll(() {
    items = [
      DropdownMenuEntry<int>(value: 1, label: "a"),
      DropdownMenuEntry<int>(value: 2, label: "b"),
    ];
    dropdownMenu = RDropdownMenu<int>(
      dropdownMenuEntries: items,
      onSelected: (item) {},
    );
  });

  testWidgets("RDropdownMenu: deve renderizar o componente corretamente ",
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: dropdownMenu)));
    final rDropsownMenuFinder = find.byType(RDropdownMenu<int>);
    expect(rDropsownMenuFinder, findsOneWidget);
    var labelTextFinder = find.text('a');
    expect(labelTextFinder, findsOne);
    labelTextFinder = find.text('b');
    expect(labelTextFinder, findsOne);
  });

  testWidgets('RDropdownMenu: deve alterar o estado corretamente',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: dropdownMenu,
        ),
      ),
    );
    var rDropdownMenuFinder = find.byType(RDropdownMenu<int>);
    expect(find.text('a'), findsAny);
    expect(find.text('b'), findsAny);
    await tester.tap(rDropdownMenuFinder);
    await tester.pumpAndSettle();
    await tester.tap(find.text('b').first, warnIfMissed: false);
    await tester.pumpAndSettle();
    expect(find.text('a'), findsAny);
    expect(find.text('b'), findsAny);
  });
}
