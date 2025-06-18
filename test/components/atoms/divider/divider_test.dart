import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/atoms.dart';
import 'package:rarUI/utils/interfaces/behaviour.dart';

void main() {
  group('QDivider tests', () {
    testWidgets('Should render QDivider.standard', (WidgetTester tester) async {
      // Construir o widget com Material
      await tester.pumpWidget(
        const MaterialApp(
          home: Material(
            child: QDivider.standard(
              behaviour: Behaviour.regular,
            ),
          ),
        ),
      );
      final qDividerWidgetFinder = find.byType(QDivider);

      expect(qDividerWidgetFinder, findsOneWidget);
    });
  });

  testWidgets('Should render QDivider.standard', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: QDivider.standard(
            behaviour: Behaviour.loading,
          ),
        ),
      ),
    );

    // Verificar se o Switch não está presente
    expect(find.byType(QDivider), findsOneWidget);
  });

  testWidgets('Should render QDivider.standard disabled', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: QDivider.standard(
            behaviour: Behaviour.disabled,
          ),
        ),
      ),
    );

    // Verificar se o QDivider existe
    expect(find.byType(QDivider), findsOneWidget);
  });
}
