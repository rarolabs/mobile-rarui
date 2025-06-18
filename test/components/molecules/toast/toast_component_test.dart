import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/rarui.dart';

void main() {
  testWidgets('Should render QToast.gray4White', (tester) async {
    const String title = 'Copiado com sucesso!';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QToast.gray4White(
            behaviour: Behaviour.regular,
            title: title,
            pathTrailingIcon: QTheme.svgs.done,
          ),
        ),
      ),
    );

    // Verificar se o título está presente
    final titleFinder = find.text(title);
    expect(titleFinder, findsOneWidget);

    // Verificar se o ícone  está presente
    expect(find.byType(SvgPicture), findsOneWidget);
  });
}
