import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/templates/key_pix/key_pix_template.dart';
import 'package:rarUI/components/templates/key_pix/models/key_pix_model.dart';

void main() {
  testWidgets('RKeyPixTemplate renderiza corretamente com título, descrição e chaves registradas',
      (WidgetTester tester) async {
    // Arrange
    final registeredKeys = [
      KeyPixModel(
        keyType: 'CPF',
        keyValue: '123.456.789-00',
        keyIcon: const Icon(Icons.account_circle),
      ),
      KeyPixModel(
        keyType: 'E-mail',
        keyValue: 'exemplo@email.com',
        keyIcon: const Icon(Icons.email),
      ),
    ];

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RKeyPixTemplate(
            title: 'Minhas Chaves Pix',
            description: 'Gerencie suas chaves cadastradas',
            registeredPixKeys: registeredKeys,
          ),
        ),
      ),
    );

    // Assert
    expect(find.text('Minhas Chaves Pix'), findsOneWidget);
    expect(find.text('Gerencie suas chaves cadastradas'), findsOneWidget);
    expect(find.text('2 de 5 chaves cadastradas'), findsOneWidget);

    expect(find.text('CPF'), findsOneWidget);
    expect(find.text('123.456.789-00'), findsOneWidget);
    expect(find.text('E-mail'), findsOneWidget);
    expect(find.text('exemplo@email.com'), findsOneWidget);
  });

  testWidgets('RKeyPixTemplate gera erro de asserção quando mais de 5 chaves são passadas',
      (WidgetTester tester) async {
    // Arrange
    final tooManyKeys = List.generate(
      6,
      (i) => KeyPixModel(
        keyType: 'Chave $i',
        keyValue: 'Valor $i',
        keyIcon: const Icon(Icons.vpn_key),
      ),
    );

    // Act & Assert
    expect(
      () => RKeyPixTemplate(
        title: 'Erro',
        description: 'Mais de 5 chaves',
        registeredPixKeys: tooManyKeys,
      ),
      throwsA(isA<AssertionError>()),
    );
  });
}
