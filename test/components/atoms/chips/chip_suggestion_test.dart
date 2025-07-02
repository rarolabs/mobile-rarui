import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/atoms.dart';

void main() {
  late RChipSuggestion widget;

  setUpAll(() {
    widget = RChipSuggestion(
      label: 'Chip Suggestion',
      onPressed: () {},
    );
  });

  testWidgets('RChipSuggestion: deve renderizar corretamente', (tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));
    final rChipSuggestionFinder = find.byType(RChipSuggestion);
    expect(rChipSuggestionFinder, findsOneWidget);
    final labelTextFinder = find.text('Chip Suggestion');
    expect(labelTextFinder, findsOne);
  });
}
