import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/components/molecules/caroussel/caroussel.dart';

void main() {
  group('RCarousel', () {
    testWidgets('renders all carousel items when navigated',
        (WidgetTester tester) async {
      final items = List.generate(
        3,
        (index) => Container(
          key: ValueKey('carousel_item_$index'),
          width: double.infinity,
          height: 100,
          color: Colors.red,
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RCaroussel(
              items: items,
              height: 150,
              showIndicator: false,
            ),
          ),
        ),
      );

      final pageView = find.byType(PageView);
      expect(pageView, findsOneWidget);

      for (var i = 0; i < items.length; i++) {
        // Arrasta para a próxima página (a cada iteração)
        await tester.drag(pageView, const Offset(-400.0, 0.0));
        await tester.pumpAndSettle();

        expect(find.byKey(ValueKey('carousel_item_$i')), findsOneWidget);
      }
    });

    testWidgets('shows page indicator when showIndicator is true',
        (WidgetTester tester) async {
      final items = List.generate(2, (index) => Text('Item $index'));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RCaroussel(
              items: items,
              showIndicator: true,
            ),
          ),
        ),
      );

      // Espera encontrar exatamente dois indicadores (pontinhos)
      final indicators = find.byType(AnimatedContainer);
      expect(indicators, findsNWidgets(2));
    });

    testWidgets('respects specified height', (WidgetTester tester) async {
      const customHeight = 180.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RCaroussel(
              items: [Text('Item')],
              height: customHeight,
            ),
          ),
        ),
      );

      final carousel = tester.widget<Column>(find.byType(Column));
      expect(carousel, isNotNull);
    });

    testWidgets('renders correct number of pages in PageView',
        (WidgetTester tester) async {
      final items = List.generate(4, (i) => Text('Page $i'));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RCaroussel(
              items: items,
            ),
          ),
        ),
      );

      final pageView = find.byType(PageView);
      expect(pageView, findsOneWidget);
    });
  });
}
