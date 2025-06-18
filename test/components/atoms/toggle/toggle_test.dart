import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/toggle/toggle.dart';
import 'package:rarUI/shared_widget/loading_widget.dart';
import 'package:rarUI/utils/interfaces/behaviour.dart';

void main() {
  group('ToggleComponent Testes', () {
    bool isOnPressed = false;

    testWidgets('renderizar o ToggleSecundaryColor e testar o onChanged', (WidgetTester tester) async {
      // Construir o widget com Material
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: QToggle.secundaryColor(
              key: const Key(
                ('myKey'),
              ),
              onChanged: (bool value) {
                isOnPressed = value;
              },
              behaviour: Behaviour.regular,
              initialValue: isOnPressed,
            ),
          ),
        ),
      );

      // Localizar o onChanged dentro do QToggle
      final toggleWidgetFinder = find.byKey(const Key('myKey'));
      final switchWdt = tester.widget<QToggle>(toggleWidgetFinder);

      // Garantir que o QToggle foi encontrado
      expect(switchWdt.initialValue, false);
    });
  });

  testWidgets('Exibir componente loading do toggle', (tester) async {
    // Mock dos valores usados no widget
    const bool isOnPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QToggle.secundaryColor(
            behaviour: Behaviour.loading,
            onChanged: (value) {},
            key: const Key(
              ('myKey'),
            ),
            initialValue: isOnPressed,
          ),
        ),
      ),
    );

    // Verificar se o Switch não está presente
    expect(find.byType(Switch), findsNothing);

    // Verificar se o loading está presente
    expect(find.byType(LoadingWidget), findsOneWidget);
  });

  testWidgets('Exibir componente slider disabled', (tester) async {
    // Mock dos valores usados no widget
    bool isOnPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QToggle.secundaryColor(
            behaviour: Behaviour.disabled,
            onChanged: (bool value) {
              isOnPressed = value;
            },
            key: const Key(
              ('myKey'),
            ),
            initialValue: isOnPressed,
          ),
        ),
      ),
    );

    // Verificar se o QToggle existe
    expect(find.byType(QToggle), findsOneWidget);

    // Verificar se o slider está presente
    expect(find.byType(Switch), findsOneWidget);
  });
}
