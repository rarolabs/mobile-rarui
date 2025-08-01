import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/templates/review_template/review_template.dart';

void main() {
  group('RReviewTemplate Tests', () {
    const testData = {
      'Detail 1': 'Value 1',
      'Detail 2': 'Value 2',
    };

    testWidgets('should render all basic elements',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RReviewTemplate(
              bodyTitle: 'Transaction Review',
              valueLabel: 'Amount',
              valueText: 'R\$ 100,00',
              checkboxText: 'I confirm',
              details: testData,
              primaryButtonText: 'Confirm',
            ),
          ),
        ),
      );

      expect(find.text('Transaction Review'), findsOneWidget);
      expect(find.text('Amount'), findsOneWidget);
      expect(find.text('R\$ 100,00'), findsOneWidget);
      expect(find.text('I confirm'), findsOneWidget);
      expect(find.text('Confirm'), findsOneWidget);
      expect(find.text('Escrever uma mensagem'), findsOneWidget);

      // Verify details are rendered
      expect(find.text('Detail 1'), findsOneWidget);
      expect(find.text('Value 1'), findsOneWidget);
      expect(find.text('Detail 2'), findsOneWidget);
      expect(find.text('Value 2'), findsOneWidget);
    });

    testWidgets('should apply correct styles', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RReviewTemplate(
              bodyTitle: 'Title',
              valueLabel: 'Label',
              valueText: 'Value',
              checkboxText: 'Checkbox',
              details: testData,
              primaryButtonText: 'Button',
            ),
          ),
        ),
      );

      final valueText = tester.widget<Text>(find.text('Value'));
      expect(valueText.style?.color,
          Theme.of(tester.element(find.text('Value'))).primaryColor);
    });

    testWidgets('checkbox should toggle value', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RReviewTemplate(
              bodyTitle: 'Title',
              valueLabel: 'Label',
              valueText: 'Value',
              checkboxText: 'Checkbox',
              details: testData,
              primaryButtonText: 'Button',
            ),
          ),
        ),
      );

      final checkbox = find.byType(Checkbox);
      await tester.tap(checkbox);
      await tester.pump();

      final checkboxWidget = tester.widget<Checkbox>(checkbox);
      expect(checkboxWidget.value, isTrue);
    });

    testWidgets('should show message button with default text',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RReviewTemplate(
              bodyTitle: 'Title',
              valueLabel: 'Label',
              valueText: 'Value',
              checkboxText: 'Checkbox',
              details: testData,
              primaryButtonText: 'Button',
            ),
          ),
        ),
      );

      expect(find.text('Escrever uma mensagem'), findsOneWidget);
      expect(find.byIcon(Icons.message), findsOneWidget);
    });
  });
}
