import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/rarui.dart';

void main() {
  testWidgets('Testa se a state fail page está funcionando e exibindo corretamente seus widgets', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: QStateFailPage.standard(
          behaviour: Behaviour.regular,
          title: 'Por favor, tente novamente.',
          description: 'Não foi possível autenticar a foto capturada.',
          buttonText: 'Tentar novamente',
          appBarTitle: 'Criar Conta',
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
