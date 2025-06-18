import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/rarui.dart';

import 'feedback_page_error_fixture.dart';
import 'feedback_page_success_fixture.dart';

void main() {
  testWidgets('Testa se a feedback page está funcionando e exibindo corretamente seus widgets', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: FeedbackErrorPageFixture.render(
          behaviour: Behaviour.regular,
          title: 'Transferência de chave recusada!',
          primaryButtonText: 'Ok, entendi',
          secondaryButtonText: 'Cancelar',
          descriptionTextList: [
            'A solicitação de transferência de chave foi <b>recusada!</b> Outro usuário poderá solicitar a posse dessa chave novamente a <b>qualquer momento.</b>',
          ],
        ),
      ),
    );
    expect(find.byType(QAppBar), findsOneWidget);
    expect(find.byType(SvgPicture), findsNWidgets(2));
    expect(find.text('Transferência de chave recusada!'), findsOneWidget);
    expect(
      find.text(
        'A solicitação de transferência de chave foi recusada! Outro usuário poderá solicitar a posse dessa chave novamente a qualquer momento.',
      ),
      findsOneWidget,
    );
    expect(find.text('Ok, entendi'), findsOneWidget);
    expect(find.text('Cancelar'), findsOneWidget);
  });

  testWidgets('Testa se a feedback page de success está funcionando e exibindo corretamente seus widgets',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: FeedbackSuccessPageFixture.render(
          behaviour: Behaviour.regular,
          title: 'Chave criada!',
          primaryButtonText: 'Ok, entendi',
          descriptionTextList: const [
            'Seu e-mail foi cadastrado como chave Pix *julia@gmail.com*',
            'Quem te pagar através dessa chave verá *seu nome completo, alguns números do seu CPF e o banco onde está cadastrada a chave.*',
            'Usuários do Pix terão ciência que você cadastrou esta chave, sem ter acesso a seus dados.',
          ],
        ),
      ),
    );
    expect(find.byType(QAppBar), findsOneWidget);
    expect(find.byType(SvgPicture), findsNWidgets(2));
    expect(find.text('Chave criada!'), findsOneWidget);
    expect(find.text('Seu e-mail foi cadastrado como chave Pix julia@gmail.com'), findsOneWidget);
    expect(
      find.text(
        'Quem te pagar através dessa chave verá seu nome completo, alguns números do seu CPF e o banco onde está cadastrada a chave.',
      ),
      findsOneWidget,
    );
    expect(
      find.text('Usuários do Pix terão ciência que você cadastrou esta chave, sem ter acesso a seus dados.'),
      findsOneWidget,
    );
  });
}
