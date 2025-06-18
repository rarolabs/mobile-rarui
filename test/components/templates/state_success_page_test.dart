import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/rarui.dart';

void main() {
  testWidgets('Testa se a state success page está funcionando e exibindo corretamente seus widgets', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: QStateSuccessPage.standard(
          behaviour: Behaviour.regular,
          title: 'A autenticação foi efetuada com sucesso',
          buttonText: 'Finalizar',
          appBarTitle: 'Criar Conta',
          counterText: 'Fechando em 3...',
          appBarIconTap: () {},
          onButtonPressed: () {},
        ),
      ),
    );
    expect(find.byType(QAppBar), findsOneWidget);
    expect(find.byType(QLabel), findsNWidgets(4));
    expect(find.byType(SvgPicture), findsNWidgets(2));
    expect(find.byType(QButton), findsOneWidget);
  });
}
