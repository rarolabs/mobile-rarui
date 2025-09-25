import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/components/atoms/rich_text/rich_text.dart';

void main() {
  testWidgets('RRichText renders with multiple text spans',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RRichText(
            children: [
              TextSpan(text: 'Olá '),
              TextSpan(
                  text: 'Pessoa',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: '!'),
            ],
          ),
        ),
      ),
    );

    expect(find.textContaining('Olá'), findsOneWidget);
    expect(find.textContaining('Pessoa'), findsOneWidget);
    expect(find.textContaining('!'), findsOneWidget);
  });

  testWidgets('RRichText supports semanticsLabel and semanticsIdentifier',
      (WidgetTester tester) async {
    const label = 'Texto acessível';
    const identifier = 'rich_text_id';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RRichText(
            semanticsLabel: label,
            semanticsIdentifier: identifier,
            children: [
              TextSpan(text: 'Texto oculto'),
            ],
          ),
        ),
      ),
    );

    final semanticFinder = find.bySemanticsLabel(label);
    expect(semanticFinder, findsOneWidget);
  });
}
