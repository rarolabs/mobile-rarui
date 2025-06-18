import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/molecules/card_info/card_info_component.dart';
import 'package:rarUI/components/molecules/card_info/card_info_specs.dart';
import 'package:rarUI/rarui.dart';

void main() {
  group('CardInfo - ', () {
    testWidgets('Renderização do componente', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CardInfoComponent(
              behaviour: Behaviour.regular,
              styles: CardInfoStyleSet.standard,
              cardSkinURL: '',
              title: 'test1',
              subtitle: 'test2',
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(CardInfoComponent), findsOneWidget);
      expect(find.byType(QImage), findsAtLeast(1));
      expect(find.byType(QLabel), findsExactly(2));
      expect(find.text('test1'), findsOneWidget);
      expect(find.text('test2'), findsOneWidget);
    });

    testWidgets('Renderização do componente sem subtitle', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CardInfoComponent(
              behaviour: Behaviour.regular,
              styles: CardInfoStyleSet.standard,
              cardSkinURL: '',
              title: 'test1',
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(CardInfoComponent), findsOneWidget);
      expect(find.byType(QImage), findsAtLeast(1));
      expect(find.byType(QLabel), findsOneWidget);
      expect(find.text('test1'), findsOneWidget);
    });

    testWidgets('Renderização do componente sem title', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CardInfoComponent(
              behaviour: Behaviour.regular,
              styles: CardInfoStyleSet.standard,
              cardSkinURL: '',
              subtitle: 'test2',
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(CardInfoComponent), findsOneWidget);
      expect(find.byType(QImage), findsAtLeast(1));
      expect(find.byType(QLabel), findsOneWidget);
      expect(find.text('test2'), findsOneWidget);
    });

    testWidgets('Renderização do componente sem title e subtitle', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CardInfoComponent(
              behaviour: Behaviour.regular,
              styles: CardInfoStyleSet.standard,
              cardSkinURL: '',
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(CardInfoComponent), findsOneWidget);
      expect(find.byType(QImage), findsAtLeast(1));
      expect(find.byType(QLabel), findsNothing);
    });
  });
}
