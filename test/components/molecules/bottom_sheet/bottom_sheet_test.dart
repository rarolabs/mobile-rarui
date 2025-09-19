import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/label/label.dart';
import 'package:rarUI/components/molecules/bottom_sheet/bottom_sheet.dart';

void main() {
  testWidgets('Exibe título, descrição e botões corretamente',
      (WidgetTester tester) async {
    const title = 'Título de Teste';
    const description = 'Descrição de Teste';
    const primaryButtonText = 'Confirmar';
    const secondaryButtonText = 'Cancelar';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RBottomSheet(
            title: title,
            description: description,
            primaryButtonChild: RLabel(text: primaryButtonText),
            secondaryButtonChild: RLabel(text: secondaryButtonText),
          ),
        ),
      ),
    );

    expect(find.text(title), findsOneWidget);
    expect(find.text(description), findsOneWidget);
    expect(find.text(primaryButtonText), findsOneWidget);
    expect(find.text(secondaryButtonText), findsOneWidget);
  });

  testWidgets('Dispara onPrimaryButtonPressed ao clicar no botão primário',
      (WidgetTester tester) async {
    var primaryPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RBottomSheet(
            primaryButtonChild: RLabel(text: 'Salvar'),
            onPrimaryButtonPressed: () {
              primaryPressed = true;
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Salvar'));
    await tester.pump();

    expect(primaryPressed, isTrue);
  });

  testWidgets('Dispara onSecondaryButtonPressed ao clicar no botão secundário',
      (WidgetTester tester) async {
    var secondaryPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RBottomSheet(
            secondaryButtonChild: RLabel(text: 'Voltar'),
            onSecondaryButtonPressed: () {
              secondaryPressed = true;
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Voltar'));
    await tester.pump();

    expect(secondaryPressed, isTrue);
  });

  testWidgets('Não exibe widgets quando valores estão vazios',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RBottomSheet(),
        ),
      ),
    );

    expect(find.byType(Text), findsNothing);
    expect(find.byType(ElevatedButton), findsNothing);
  });
}
