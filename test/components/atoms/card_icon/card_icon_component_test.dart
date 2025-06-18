import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/molecules/card_icon/card_icon.dart';
import 'package:rarUI/theme/theme_data.dart';
import 'package:rarUI/utils/interfaces/behaviour.dart';

void main() {
  group('CardIconComponent Testes', () {
    bool isOnPressed = false;

    testWidgets('renderizar o CardIcon 80x67 e testar o button', (WidgetTester tester) async {
      // Construir o widget com Material
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: QCardIcon.captionRoboto14size80x68(
              behaviour: Behaviour.regular,
              svgPath: QTheme.svgs.visibility,
              text: 'Pix',
              onPressed: () {
                isOnPressed = true;
              },
            ),
          ),
        ),
      );

      // Localizar o InkWell dentro do QCardIcon
      final sizeFinder = find.byType(QCardIcon);
      final inkwellFinder = find.descendant(
        of: sizeFinder,
        matching: find.byType(InkWell).first,
      );

      // Garantir que o InkWell foi encontrado
      expect(inkwellFinder, findsOneWidget);

      // Simular o tap no InkWell
      await tester.tap(inkwellFinder);
      await tester.pump();

      // Verificar se o botão foi pressionado
      expect(isOnPressed, isTrue);
    });

    testWidgets('renderizar o CardIcon 102x80 e testar o button', (WidgetTester tester) async {
      // Construir o widget com Material
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: QCardIcon.paragraphRoboto16size100x80(
              behaviour: Behaviour.regular,
              svgPath: QTheme.svgs.visibility,
              text: 'Pix',
              onPressed: () {
                isOnPressed = true;
              },
            ),
          ),
        ),
      );

      // Localizar o InkWell dentro do QCardIcon
      final sizeFinder = find.byType(QCardIcon);
      final inkwellFinder = find.descendant(
        of: sizeFinder,
        matching: find.byType(InkWell).first,
      );

      // Garantir que o InkWell foi encontrado
      expect(inkwellFinder, findsOneWidget);

      // Simular o tap no InkWell
      await tester.tap(inkwellFinder);
      await tester.pump();

      // Verificar se o botão foi pressionado
      expect(isOnPressed, isTrue);
    });

    testWidgets('renderizar o CardIcon 109x88 e testar o button', (WidgetTester tester) async {
      // Construir o widget com Material
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: QCardIcon.paragraphRoboto16size108x88(
              behaviour: Behaviour.regular,
              svgPath: QTheme.svgs.visibility,
              text: 'Pix',
              onPressed: () {
                isOnPressed = true;
              },
            ),
          ),
        ),
      );

      // Localizar o InkWell dentro do QCardIcon
      final sizeFinder = find.byType(QCardIcon);
      final inkwellFinder = find.descendant(
        of: sizeFinder,
        matching: find.byType(InkWell).first,
      );

      // Garantir que o InkWell foi encontrado
      expect(inkwellFinder, findsOneWidget);

      // Simular o tap no InkWell
      await tester.tap(inkwellFinder);
      await tester.pump();

      // Verificar se o botão foi pressionado
      expect(isOnPressed, isTrue);
    });

    testWidgets('renderizar o CardIcon Expansive e testar o button', (WidgetTester tester) async {
      // Construir o widget com Material
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: QCardIcon.paragraphRoboto16SizeExpansive(
              behaviour: Behaviour.regular,
              svgPath: QTheme.svgs.visibility,
              text: 'Pix',
              maxLinesLabelButton: 2,
              onPressed: () {
                isOnPressed = true;
              },
            ),
          ),
        ),
      );

      // Localizar o InkWell dentro do QCardIcon
      final sizeFinder = find.byType(QCardIcon);
      final inkwellFinder = find.descendant(
        of: sizeFinder,
        matching: find.byType(InkWell).first,
      );

      // Garantir que o InkWell foi encontrado
      expect(inkwellFinder, findsOneWidget);

      // Simular o tap no InkWell
      await tester.tap(inkwellFinder);
      await tester.pump();

      // Verificar se o botão foi pressionado
      expect(isOnPressed, isTrue);
    });
  });
}
