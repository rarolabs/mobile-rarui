import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/templates/set_limit/set_limit.dart';
import 'package:rarUI/rarui.dart';

void main() {
  testWidgets('RSetLimitTemplate renderiza corretamente e reage à interação', (WidgetTester tester) async {
    double testValue = 50.0;
    bool primaryPressed = false;
    bool secondaryPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RSetLimitTemplate(
            title: 'Definir Limite',
            primaryButtonTitle: 'Confirmar',
            secondaryButtonTitle: 'Cancelar',
            currentValue: testValue,
            startValue: 0,
            endValue: 100,
            onPrimaryButtonPressed: () => primaryPressed = true,
            onSecondaryButtonPressed: () => secondaryPressed = true,
          ),
        ),
      ),
    );

    // Verifica se o título e os botões estão renderizando
    expect(find.text('Definir Limite'), findsOneWidget);
    expect(find.text('Confirmar'), findsOneWidget);
    expect(find.text('Cancelar'), findsOneWidget);

    // Verifica se o valor inicial está visível
    expect(find.text(testValue.toStringAsFixed(2)), findsOneWidget);

    // Verifica se o slider está presente
    expect(find.byType(RSlider), findsOneWidget);

    // Pressiona o botão primário
    await tester.tap(find.text('Confirmar'));
    await tester.pump();
    expect(primaryPressed, isTrue);

    // Pressiona o botão secundário
    await tester.tap(find.text('Cancelar'));
    await tester.pump();
    expect(secondaryPressed, isTrue);
  });
}
