import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/molecules/app_bar/app_bar/app_bar_component.dart';
import 'package:rarUI/components/molecules/app_bar/app_bar/app_bar_specs.dart';
import 'package:rarUI/utils/interfaces/behaviour.dart';

void main() {
  group('AppBarComponent', () {
    testWidgets('Deve renderizar com título, botão voltar e ações', (WidgetTester tester) async {
      const String title = 'Título Teste';
      bool backButtonPressed = false;
      bool actionPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBarComponent(
              behaviour: Behaviour.regular,
              styles: AppBarStyleSet.appBar,
              title: title,
              onPressedBackButton: () {
                backButtonPressed = true;
              },
              actions: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    actionPressed = true;
                  },
                ),
              ],
              buttonSemantics: 'Voltar',
              hintSemantics: 'Botão voltar',
            ),
          ),
        ),
      );

      expect(find.text(title), findsOneWidget);
      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.byType(IconButton), findsNWidgets(2));

      // Interação com o botão voltar
      final backButton = find.byType(IconButton).first; // Primeiro IconButton é o de voltar
      await tester.tap(backButton);
      await tester.pump();

      expect(backButtonPressed, isTrue);

      // Interação com o botão de ação
      final actionButton = find.byIcon(Icons.add);
      await tester.tap(actionButton);
      await tester.pump();

      expect(actionPressed, isTrue);
    });

    testWidgets('Deve renderizar corretamente sem ações e botão voltar', (WidgetTester tester) async {
      const String title = 'Título Teste';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: AppBarComponent(
              behaviour: Behaviour.regular,
              styles: AppBarStyleSet.appBar,
              title: title,
              showLeadingIcon: false,
              actions: null,
            ),
          ),
        ),
      );

      expect(find.text(title), findsOneWidget);
      expect(find.byType(SvgPicture), findsNothing); // Sem botão de voltar
      expect(find.byType(IconButton), findsNothing); // Sem ações
    });
  });
}
