import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/atoms.dart';

void main() {
  late RChipAssist widget;

  setUpAll(() {
    widget = RChipAssist(
      icon: Icon(Icons.abc),
      label: 'Chip Assist',
      onPressed: () {},
    );
  });

  testWidgets('RChipAssist: deve renderizar corretamente', (tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));
    final rChipAssistFinder = find.byType(RChipAssist);
    expect(rChipAssistFinder, findsOneWidget);
    final iconFinder = find.byIcon(Icons.abc);
    expect(iconFinder, findsOne);
    final labelTextFinder = find.text('Chip Assist');
    expect(labelTextFinder, findsOne);
  });
}
