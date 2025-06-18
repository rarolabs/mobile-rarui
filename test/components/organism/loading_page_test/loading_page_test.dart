import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/rarui.dart';

void main() {
  testWidgets('Testa se a tela de carregamento está funcionando e exibindo corretamente TODOS os seus widgets',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: QLoadingPage.loading(
          behaviour: Behaviour.regular,
          title: 'Processando sua transferência',
          description: 'Aguarde',
          onPressed: () {},
          showCloseButton: true,
        ),
      ),
    );
    expect(find.byType(QCircularProgress), findsOneWidget);
    expect(find.byType(QLabel), findsNWidgets(2));
    expect(find.byType(SvgPicture), findsOneWidget);
  });

  testWidgets(
      'Testa se a tela de carregamento está funcionando e exibindo corretamente os widgets no modo apenas circular progress',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: QLoadingPage.loading(
          behaviour: Behaviour.regular,
        ),
      ),
    );
    expect(find.byType(QCircularProgress), findsOneWidget);
    expect(find.byType(QLabel), findsNothing);
    expect(find.byType(SvgPicture), findsNothing);
  });
}
