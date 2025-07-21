import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/label/label.dart';
import 'package:rarUI/components/molecules/buttons/elevated_button.dart';
import 'package:rarUI/components/molecules/modal/modal.dart';

void main() {
  testWidgets('RModal exibe título, descrição e aciona botões', (WidgetTester tester) async {
    bool primaryPressed = false;
    bool secondaryPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RModal(
            title: 'Modal Title',
            description: 'Modal Description',
            titlePrimaryButton: 'Main Action',
            titleSecondaryButton: 'Secondary Action',
            onPrimaryButtonPressed: () => primaryPressed = true,
            onSecondaryButtonPressed: () => secondaryPressed = true,
          ),
        ),
      ),
    );

    // Verifica título e descrição
    expect(find.text('Modal Title'), findsOneWidget);
    expect(find.text('Modal Description'), findsOneWidget);

    // Verifica botões
    expect(find.text('Main Action'), findsOneWidget);
    expect(find.text('Secondary Action'), findsOneWidget);

    // Simula clique nos botões
    await tester.tap(find.text('Main Action'));
    await tester.pump();
    expect(primaryPressed, isTrue);

    await tester.tap(find.text('Secondary Action'));
    await tester.pump();
    expect(secondaryPressed, isTrue);
  });

  testWidgets('RModal sem título, descrição e conteúdo não renderiza esses widgets', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RModal(),
        ),
      ),
    );

    expect(find.byType(RLabel), findsNothing);
    expect(find.byType(RElevatedButton), findsNothing);
  });
}
