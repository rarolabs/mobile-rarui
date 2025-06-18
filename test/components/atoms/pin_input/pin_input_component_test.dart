import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/pin_input/pin_input.dart';
import 'package:rarUI/shared_widget/loading_widget.dart';
import 'package:rarUI/utils/interfaces/behaviour.dart';

void main() {
  testWidgets('Exibir componente QPinInput', (tester) async {
    // Mock dos valores usados no widget
    const String inputValue = '123456';
    // Função para capturar o valor inserido
    String? capturedValue;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: QPinInput.standard(
              behaviour: Behaviour.regular,
              onCompleted: (value) => capturedValue = value,
            ),
          ),
        ),
      ),
    );

    // Localiza o Pinput e clica nele
    final pinputFinder = find.byType(QPinInput);
    expect(pinputFinder, findsOneWidget);
    await tester.ensureVisible(pinputFinder);
    await tester.tap(pinputFinder, warnIfMissed: false);
    await tester.pump();

    // Digita a sequência de números
    await tester.enterText(pinputFinder, inputValue);
    await tester.pumpAndSettle();

    // Verifica se o valor foi capturado corretamente
    expect(capturedValue, inputValue);
  });

  testWidgets('Exibir componente QPinInput desabilitado, não permitir input', (tester) async {
    // Mock dos valores usados no widget
    const String inputValue = '123456';
    // Função para capturar o valor inserido
    String? capturedValue;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: QPinInput.standard(
              behaviour: Behaviour.disabled,
              onCompleted: (value) => capturedValue = value,
            ),
          ),
        ),
      ),
    );

    // Localiza o Pinput e clica nele
    final pinputFinder = find.byType(QPinInput);
    expect(pinputFinder, findsOneWidget);
    await tester.tap(pinputFinder, warnIfMissed: false);
    await tester.pump();

    // Digita a sequência de números
    await tester.enterText(pinputFinder, inputValue);
    await tester.pumpAndSettle();

    // Verifica se o valor foi capturado corretamente
    expect(capturedValue, isNull);
    expect(capturedValue != inputValue, isTrue);
  });

  testWidgets('Exibir componente QPinInput loading', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: QPinInput.standard(
              behaviour: Behaviour.loading,
              onCompleted: (value) {},
            ),
          ),
        ),
      ),
    );

    final pinputFinder = find.byType(QPinInput);
    expect(pinputFinder, findsOne);

    final loadingFinder = find.byType(LoadingWidget);
    expect(loadingFinder, findsOne);

    final sliderFinder = find.byType(Slider);
    expect(sliderFinder, findsNothing);
  });
}
