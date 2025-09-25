import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/components/atoms/balance_display/balance_display.dart';

void main() {
  group('RBalanceDisplay Tests', () {
    testWidgets('should display hidden balance by default',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RBalanceDisplay(
              balanceText: 'R\$ 1.234,56',
            ),
          ),
        ),
      );

      expect(find.text('•••••'), findsOneWidget);
      expect(find.text('R\$ 1.234,56'), findsNothing);
    });

    testWidgets('should display visible balance when initiallyVisible is true',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RBalanceDisplay(
              balanceText: 'R\$ 9.876,54',
              initiallyVisible: true,
            ),
          ),
        ),
      );

      expect(find.text('R\$ 9.876,54'), findsOneWidget);
      expect(find.text('•••••'), findsNothing);
    });

    testWidgets('should apply custom text style when visible',
        (WidgetTester tester) async {
      const customStyle = TextStyle(
        fontSize: 24,
        color: Colors.green,
        fontWeight: FontWeight.bold,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RBalanceDisplay(
              balanceText: 'R\$ 2.000,00',
              initiallyVisible: true,
              textStyle: customStyle,
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.byType(Text));
      expect(textWidget.style?.fontSize, 24);
      expect(textWidget.style?.color, Colors.green);
    });

    testWidgets('should use default style when hidden',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            textTheme: TextTheme(
              headlineSmall: TextStyle(
                fontSize: 18,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          home: Scaffold(
            body: RBalanceDisplay(
              balanceText: 'R\$ 3.000,00',
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.byType(Text));
      expect(textWidget.style?.fontSize, 18);
      expect(textWidget.style?.color, Colors.blue);
    });

    testWidgets('should maintain custom color in default style',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RBalanceDisplay(
              balanceText: 'R\$ 4.000,00',
              textStyle: TextStyle(color: Colors.purple),
            ),
          ),
        ),
      );

      final hiddenTextWidget = tester.widget<Text>(find.byType(Text));
      expect(hiddenTextWidget.style?.color, Colors.purple);

      await tester.tap(find.byType(RBalanceDisplay));
      await tester.pump();

      final visibleTextWidget = tester.widget<Text>(find.byType(Text));
      expect(visibleTextWidget.style?.color, Colors.purple);
    });
  });
}
