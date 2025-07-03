import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/molecules/expansion_tile/expansion_tile.dart';

void main() {
  testWidgets('RExpansionTile: deve renderizar o componente', (tester) async {
    bool isExpanded = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RExpansionTile(
            title: Text('Teste'),
            children: [Text('children')],
            onExpansionChanged: (p0) {
              isExpanded = !isExpanded;
            },
          ),
        ),
      ),
    );

    final expansionTile = tester.widget<RExpansionTile>(find.byType(RExpansionTile));

    expect(find.byType(RExpansionTile), findsOneWidget);
    expect(find.text('Teste'), findsOneWidget);
    expect(find.text('children'), findsNothing);

    await tester.tap(find.text('Teste'));
    await tester.pumpAndSettle();
    expect(isExpanded, isTrue);
    expect(find.text('children'), findsOneWidget);

    await tester.tap(find.text('Teste'));
    await tester.pumpAndSettle();
    expect(isExpanded, isFalse);

    expect(expansionTile.children.length, 1);
    expect(expansionTile.children[0], isA<Text>());
  });
}
