import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/templates/status/status.dart';


import '../../utils/fake_image_provider.dart';

void main() {
  testWidgets('RStatus exibe título, descrição, imagem e botão corretamente', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: RStatus(
          type: RStatusType.success,
          title: 'Título de sucesso',
          description: 'Operação concluída com êxito',
          buttonText: 'Voltar',
          image: FakeImageProvider(),
        ),
      ),
    );

    expect(find.text('Título de sucesso'), findsOneWidget);
    expect(find.text('Operação concluída com êxito'), findsOneWidget);
    expect(find.text('Voltar'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.byIcon(Icons.close), findsOneWidget);
  });

  testWidgets('RStatus executa onButtonPressed quando botão é pressionado', (tester) async {
    bool pressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: RStatus(
          type: RStatusType.failure,
          title: 'Erro',
          description: 'Algo deu errado',
          buttonText: 'Tentar novamente',
          image: FakeImageProvider(),
          onButtonPressed: () => pressed = true,
        ),
      ),
    );

    await tester.tap(find.text('Tentar novamente'));
    await tester.pump();
    expect(pressed, isTrue);
  });

  testWidgets('RStatus executa onClosePressed quando ícone de fechar é pressionado', (tester) async {
    bool closed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: RStatus(
          type: RStatusType.failure,
          title: 'Erro',
          description: 'Algo deu errado',
          buttonText: 'Fechar',
          image: FakeImageProvider(),
          onClosePressed: () => closed = true,
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.close));
    await tester.pump();
    expect(closed, isTrue);
  });

   testWidgets('RStatus exibe corretamente para tipo success', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: RStatus(
          type: RStatusType.success,
          title: 'Sucesso',
          description: 'Operação realizada com êxito',
          buttonText: 'Ok',
          image: FakeImageProvider(),
        ),
      ),
    );

    expect(find.text('Sucesso'), findsOneWidget);
    expect(find.text('Operação realizada com êxito'), findsOneWidget);
  });

  testWidgets('RStatus exibe corretamente para tipo failure', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: RStatus(
          type: RStatusType.failure,
          title: 'Falha',
          description: 'Algo deu errado',
          buttonText: 'Tentar novamente',
          image: FakeImageProvider(),
        ),
      ),
    );

    expect(find.text('Falha'), findsOneWidget);
    expect(find.text('Algo deu errado'), findsOneWidget);
  });


}
