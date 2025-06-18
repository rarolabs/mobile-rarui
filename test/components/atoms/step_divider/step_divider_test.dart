import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/step_divider/step_divider_specs.dart';
import 'package:rarUI/rarui.dart';
import 'package:rarUI/shared_widget/loading_widget.dart';

void main() {
  group('StepDividerComponent Testes', () {
    testWidgets('Should render QStepDivider.standard',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Material(
            child: QStepDivider(
              behaviour: Behaviour.regular,
              style: StepDividerStyleSet.standard,
            ),
          ),
        ),
      );

      final stepDividerWidgetFinder = find.byType(QStepDivider);
      final stepDividerWidget =
          tester.widget<QStepDivider>(stepDividerWidgetFinder);

      expect(stepDividerWidgetFinder, findsOneWidget);
      expect(stepDividerWidget.behaviour, Behaviour.regular);
    });

    testWidgets('Should render QStepDivider.standard loading',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Material(
            child: QStepDivider(
              behaviour: Behaviour.loading,
              style: StepDividerStyleSet.standard,
            ),
          ),
        ),
      );

      expect(find.byType(LoadingWidget), findsOneWidget);
    });
  });
}
