import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/templates/proof_transfer/proof_transfer_template.dart';

void main() {
  testWidgets('RProofTransferTemplate renderiza corretamente e aciona retornos de chamada',
      (WidgetTester tester) async {
    // Flags para verificar se os callbacks foram chamados
    bool iconClosePressed = false;
    bool buttonPressed = false;

    // Dados simulados
    final transferData = {'Conta': '12345-6'};
    final firstBlock = {'Nome': 'João'};
    final secondBlock = {'Valor': 'R\$ 100,00'};

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RProofTransferTemplate(
            onPressedIconClose: () => iconClosePressed = true,
            onPressedButton: () => buttonPressed = true,
            title: 'Comprovante',
            subTitle: 'Transferência realizada com sucesso',
            titleButton: 'Finalizar',
            transferData: transferData,
            firstBlockItens: firstBlock,
            secondBlockItens: secondBlock,
            titleFisrtBlock: 'Dados do remetente',
            titleSecondBlock: 'Resumo',
          ),
        ),
      ),
    );

    // Verifica textos principais
    expect(find.text('Comprovante'), findsOneWidget);
    expect(find.text('Transferência realizada com sucesso'), findsOneWidget);
    expect(find.text('Finalizar'), findsOneWidget);

    // Verifica dados transferidos
    expect(find.text('Conta'), findsOneWidget);
    expect(find.text('12345-6'), findsOneWidget);
    expect(find.text('Nome'), findsOneWidget);
    expect(find.text('João'), findsOneWidget);
    expect(find.text('Valor'), findsOneWidget);
    expect(find.text('R\$ 100,00'), findsOneWidget);

    // Verifica títulos dos blocos
    expect(find.text('Dados do remetente'), findsOneWidget);
    expect(find.text('Resumo'), findsOneWidget);

    // Verifica se o botão de fechar (ícone) está presente
    expect(find.byIcon(Icons.close), findsOneWidget);

    // Simula clique no ícone de fechar
    await tester.tap(find.byIcon(Icons.close));
    await tester.pump();
    expect(iconClosePressed, isTrue);

    // Simula clique no botão principal
    await tester.tap(find.text('Finalizar'));
    await tester.pump();
    expect(buttonPressed, isTrue);
  });
}
