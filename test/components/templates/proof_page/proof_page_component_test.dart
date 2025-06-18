import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/rarui.dart';

import 'proof_page_fixture.dart';

void main() {
  testWidgets('Testa se a proof page está funcionando e exibindo corretamente seus widgets com o botão primário oculto',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ProofPageFixture.render(
          behaviour: Behaviour.regular,
          title: 'Comprovante de transferência',
          subtitle: 'Realizada em <b>19/08/2021</b> às <b>13:39</b>',
          details: const {
            'Valor': 'R\$ 600,00',
            'Tipo de transferência': 'Pix',
            'Descrição': 'Não informado',
          },
          firstSectionTitleText: 'Transferido para',
          firstSection: const {
            'Favorecido': 'João Nogueira',
            'CPF/CNPJ': '000.000.000-00',
            'Instituição': 'Qesh Payments',
          },
          secondSectionTitleText: 'Origem da transfêrencia',
          secondSection: const {
            'Nome': 'Júlia Moreira',
            'Processadora': 'Qesh Tecnologia Ltda',
            'CPF/CNPJ': 'Qesh 31.818.873/0001-30',
            'Instituição': 'Itaú Unibanco',
          },
          observationText: 'Este Pix passa por uma processadora e é encaminhado ao destinatário',
          endSection: const {
            'ID da Transação': '789dsdsfs-ds98ds-dsds434d-sds323-7asji',
            'Código de autenticação': '789dsdsfs-ds98ds21212',
          },
          logoImagePath: QTheme.svgs.adUnits,
          secondaryButtonText: 'Compartilhar comprovante',
          onScreenShotPressed: (imageData) async {},
        ),
      ),
    );
    expect(find.text('Comprovante de transferência'), findsOneWidget);
    expect(find.text('Valor'), findsOneWidget);
    expect(find.text('R\$ 600,00'), findsOneWidget);
    expect(find.text('Tipo de transferência'), findsOneWidget);
    expect(find.text('Pix'), findsOneWidget);
    expect(find.text('Descrição'), findsOneWidget);
    expect(find.text('Não informado'), findsOneWidget);
    expect(find.text('Transferido para'), findsOneWidget);
    expect(find.text('Favorecido'), findsOneWidget);
    expect(find.text('João Nogueira'), findsOneWidget);
    expect(find.text('000.000.000-00'), findsOneWidget);
    expect(find.text('Qesh Payments'), findsOneWidget);
    expect(find.text('Origem da transfêrencia'), findsOneWidget);
    expect(find.text('Nome'), findsOneWidget);
    expect(find.text('Júlia Moreira'), findsOneWidget);
    expect(find.text('Processadora'), findsOneWidget);
    expect(find.text('Qesh Tecnologia Ltda'), findsOneWidget);
    expect(find.text('Qesh 31.818.873/0001-30'), findsOneWidget);
    expect(find.text('Itaú Unibanco'), findsOneWidget);
    expect(find.text('Este Pix passa por uma processadora e é encaminhado ao destinatário'), findsOneWidget);
    expect(find.text('ID da Transação'), findsOneWidget);
    expect(find.text('789dsdsfs-ds98ds-dsds434d-sds323-7asji'), findsOneWidget);
    expect(find.text('Código de autenticação'), findsOneWidget);
    expect(find.text('789dsdsfs-ds98ds21212'), findsOneWidget);

    expect(find.text('CPF/CNPJ'), findsNWidgets(2));
    expect(find.text('Instituição'), findsNWidgets(2));

    expect(find.byType(QImage), findsOneWidget);
    expect(find.byType(QButton), findsNothing);
  });

  testWidgets(
      'Testa se a proof page está funcionando e exibindo corretamente seus widgets com o botão primário visível',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ProofPageFixture.render(
          behaviour: Behaviour.regular,
          title: 'Comprovante de transferência',
          subtitle: 'Realizada em <b>19/08/2021</b> às <b>13:39</b>',
          details: const {},
          firstSectionTitleText: 'Transferido para',
          firstSection: const {},
          secondSectionTitleText: 'Origem da transfêrencia',
          secondSection: const {},
          endSection: const {
            'ID da Transação': '789dsdsfs-ds98ds-dsds434d-sds323-7asji',
            'Código de autenticação': '789dsdsfs-ds98ds21212',
          },
          logoImagePath: QTheme.svgs.adUnits,
          secondaryButtonText: 'Compartilhar comprovante',
          onScreenShotPressed: (imageData) async {},
        ),
      ),
    );
    expect(find.text('Comprovante de transferência'), findsOneWidget);
    expect(find.text('Transferido para'), findsOneWidget);
    expect(find.text('Origem da transfêrencia'), findsOneWidget);
    expect(find.text('ID da Transação'), findsOneWidget);
    expect(find.text('789dsdsfs-ds98ds-dsds434d-sds323-7asji'), findsOneWidget);
    expect(find.text('Código de autenticação'), findsOneWidget);
    expect(find.text('789dsdsfs-ds98ds21212'), findsOneWidget);

    expect(find.byType(QImage), findsOneWidget);
    expect(find.byType(QButton), findsOneWidget);
  });
}
