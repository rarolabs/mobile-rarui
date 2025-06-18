import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/step_item/step_item_specs.dart';
import 'package:rarUI/rarui.dart';
import 'package:rarUI/shared_widget/loading_widget.dart';

void main() {
  group('StepItemComponent Testes', () {
    testWidgets('Should render QStepItem', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Material(
            child: QStepItem(
              behaviour: Behaviour.regular,
              style: StepItemStyleSet.standard,
              stepNumber: 1,
            ),
          ),
        ),
      );

      final stepItemWidgetFinder = find.byType(QStepItem);
      final stepItemWidget = tester.widget<QStepItem>(stepItemWidgetFinder);

      expect(stepItemWidgetFinder, findsOneWidget);
      expect(stepItemWidget.stepNumber, 1);
      expect(find.byIcon(Icons.check), findsNothing);
    });

    testWidgets('Should render QStepItem disabled',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Material(
            child: QStepItem(
              behaviour: Behaviour.disabled,
              style: StepItemStyleSet.standard,
              stepNumber: 3,
            ),
          ),
        ),
      );

      final stepItemWidgetFinder = find.byType(QStepItem);
      final stepItemWidget = tester.widget<QStepItem>(stepItemWidgetFinder);

      expect(stepItemWidgetFinder, findsOneWidget);
      expect(stepItemWidget.stepNumber, 3);
      expect(find.byIcon(Icons.check), findsNothing);
    });

    testWidgets('Should render QStepItem loading', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Material(
            child: QStepItem(
              behaviour: Behaviour.loading,
              style: StepItemStyleSet.standard,
              stepNumber: 1,
            ),
          ),
        ),
      );

      expect(find.byType(LoadingWidget), findsOneWidget);
      expect(find.byIcon(Icons.check), findsNothing);
      expect(find.text('1'), findsNothing);
    });

    testWidgets('Should render QStepItem checked', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Material(
            child: QStepItem(
              behaviour: Behaviour.regular,
              style: StepItemStyleSet.completed,
              stepNumber: 1,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.check), findsOneWidget);
      expect(find.text('1'), findsNothing);
    });
  });
}
