import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/molecules/step_indicator/step_indicator_component.dart';
import 'package:rarUI/components/molecules/step_indicator/step_indicator_specs.dart';
import 'package:rarUI/rarui.dart';

void main() {
  group('StepIndicatorComponent Widget Tests', () {
    testWidgets(
      'Renderiza StepIndicatorComponent com 3 passos e currentStep 2 utilizando keys',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: StepIndicatorComponent(
                behaviour: Behaviour.regular,
                styles: StepIndicatorStyleSet.regular,
                currentStep: 2,
                totalSteps: 3,
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final step1Finder = find.byKey(const ValueKey('step_item_1'));
        expect(step1Finder, findsOneWidget);
        expect(
          find.descendant(
            of: step1Finder,
            matching: find.byIcon(Icons.check),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: step1Finder,
            matching: find.text('1'),
          ),
          findsNothing,
        );

        final step2Finder = find.byKey(const ValueKey('step_item_2'));
        expect(step2Finder, findsOneWidget);
        expect(
          find.descendant(
            of: step2Finder,
            matching: find.text('2'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: step2Finder,
            matching: find.byIcon(Icons.check),
          ),
          findsNothing,
        );

        final step3Finder = find.byKey(const ValueKey('step_item_3'));
        expect(step3Finder, findsOneWidget);
        expect(
          find.descendant(
            of: step3Finder,
            matching: find.text('3'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: step3Finder,
            matching: find.byIcon(Icons.check),
          ),
          findsNothing,
        );

        expect(find.byType(QStepDivider), findsNWidgets(2));
      },
    );
  });

  testWidgets('Deve lançar erro se totalSteps for menor que 3',
      (WidgetTester tester) async {
    expect(
      () => StepIndicatorComponent(
        behaviour: Behaviour.regular,
        styles: StepIndicatorStyleSet.regular,
        currentStep: 1,
        totalSteps: 2,
      ),
      throwsA(isA<AssertionError>()),
    );
  });

  testWidgets('Deve lançar erro se totalSteps for maior que 7',
      (WidgetTester tester) async {
    expect(
      () => StepIndicatorComponent(
        behaviour: Behaviour.regular,
        styles: StepIndicatorStyleSet.regular,
        currentStep: 1,
        totalSteps: 8,
      ),
      throwsA(isA<AssertionError>()),
    );
  });
}
