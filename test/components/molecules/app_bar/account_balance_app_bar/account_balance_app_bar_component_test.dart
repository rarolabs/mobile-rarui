import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/molecules/app_bar/account_balance_app_bar/account_balance_app_bar_component.dart';
import 'package:rarUI/components/molecules/app_bar/app_bar/app_bar_specs.dart';
import 'package:rarUI/utils/enums/coin_type.dart';
import 'package:rarUI/utils/interfaces/behaviour.dart';

void main() {
  group('AccountBalanceAppBarComponent', () {
    testWidgets('Deve renderizar corretamente com logo, nome de usuário, saldo e ações', (WidgetTester tester) async {
      final logoProvider = MockImageProvider();
      const String userName = 'Usuário Teste';
      const double accountBalance = 1000.20;
      const bool accountBalanceIsHidden = true;
      bool buttonAccountBalanceCallbackCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AccountBalanceAppBarComponent(
              behaviour: Behaviour.regular,
              styles: AppBarStyleSet.accountBalanceAppBar,
              logo: logoProvider,
              userName: userName,
              coinType: CoinType.real,
              accountBalance: accountBalance,
              accountBalanceIsHidden: accountBalanceIsHidden,
              textButton: 'Adicionar saldo',
              buttonAccountBalanceCallback: () {
                buttonAccountBalanceCallbackCalled = true;
              },
              actions: [
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {},
                ),
              ],
              buttonSemantics: 'Botão de adicionar saldo',
              hintSemantics: 'Ação para adicionar saldo',
              addBalanceVisible: true,
            ),
          ),
        ),
      );

      // Verifica se o Container que envolve o logo está sendo renderizado
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsWidgets); // Espera encontrar pelo menos 1 Container

      // Busca por um Container específico que tenha o logo no background
      final containerWidget = tester.widget<Container>(containerFinder.last);
      final decoration = containerWidget.decoration as BoxDecoration;
      final image = decoration.image;

      // Verifica se o logo está sendo utilizado no decoration do container
      expect(image?.image, equals(logoProvider));

      // Verifica o nome de usuário
      expect(find.text(userName), findsOneWidget);

      // Verifica se o botão de ação está presente
      expect(find.byIcon(Icons.settings), findsOneWidget);

      // Verifica a presença dos icones de olho e de adicionar saldo
      expect(find.byType(SvgPicture), findsNWidgets(2));

      // Interação com o botão para alternar a visibilidade do saldo
      await tester.tap(find.byKey(const Key('icon_eye'))); // Ícone do olho
      await tester.pump();
      expect(find.text('••••••'), findsNothing); // Saldo oculto

      // Interação com o botão de adicionar saldo
      await tester.tap(find.byKey(const Key('icon_add_balance')));
      await tester.pump();
      expect(buttonAccountBalanceCallbackCalled, isTrue);
    });
  });
}

class MockImageProvider extends ImageProvider<MockImageProvider> {
  @override
  Future<MockImageProvider> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture(this);
  }

  ImageStreamCompleter load(MockImageProvider key, decode) {
    return OneFrameImageStreamCompleter(
      _loadImage(),
    );
  }

  Future<ImageInfo> _loadImage() async {
    // Cria uma imagem de 1x1 pixel para simulação
    final Uint8List imageBytes = Uint8List.fromList(
      [
        0x89,
        0x50,
        0x4E,
        0x47,
        0x0D,
        0x0A,
        0x1A,
        0x0A,
        0x00,
        0x00,
        0x00,
        0x0D,
        0x49,
        0x48,
        0x44,
        0x52,
        0x00,
        0x00,
        0x00,
        0x01,
        0x00,
        0x00,
        0x00,
        0x01,
        0x08,
        0x02,
        0x00,
        0x00,
        0x00,
        0x90,
        0x77,
        0x53,
        0xDE,
        0x00,
        0x00,
        0x00,
        0x0A,
        0x49,
        0x44,
        0x41,
        0x54,
        0x78,
        0x9C,
        0x63,
        0x60,
        0x00,
        0x00,
        0x00,
        0x02,
        0x00,
        0x01,
        0x0D,
        0x0A,
        0x2D,
        0xB4,
        0x00,
        0x00,
        0x00,
        0x00,
        0x00,
        0x49,
        0x45,
        0x4E,
        0x44,
        0xAE,
        0x42,
        0x60,
        0x82,
      ],
    );

    final codec = await ui.instantiateImageCodec(imageBytes);
    final frameInfo = await codec.getNextFrame();
    return ImageInfo(image: frameInfo.image, scale: 1);
  }
}
