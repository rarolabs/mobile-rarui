import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/components/organisms/banner/banner.dart';

void main() {
  testWidgets('RBanner exibe título, subtítulo e botão corretamente',
      (tester) async {
    const title = 'Título de teste';
    const subtitle = 'Subtítulo de teste';
    const buttonText = 'Clique aqui';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RBanner(
            title: title,
            subtitle: subtitle,
            buttonText: buttonText,
          ),
        ),
      ),
    );

    expect(find.text(title), findsOneWidget);
    expect(find.text(subtitle), findsOneWidget);
    expect(find.text(buttonText), findsOneWidget);
  });

  testWidgets('RBanner chama onTap ao tocar na área clicável', (tester) async {
    bool tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RBanner(
            title: 'Título',
            subtitle: 'Subtítulo',
            buttonText: 'Botão',
            onTap: () => tapped = true,
          ),
        ),
      ),
    );

    // Tenta encontrar o GestureDetector interno pelo texto do título (por exemplo)
    await tester.tap(find.text('Título'));
    await tester.pumpAndSettle();

    expect(tapped, isTrue);
  });

  testWidgets('RBanner chama onButtonPressed ao clicar no botão',
      (tester) async {
    bool buttonTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RBanner(
            title: 'Título',
            subtitle: 'Subtítulo',
            buttonText: 'Clique aqui',
            onButtonPressed: () => buttonTapped = true,
          ),
        ),
      ),
    );

    await tester.tap(find.text('Clique aqui'));
    await tester.pumpAndSettle();

    expect(buttonTapped, isTrue);
  });
}
