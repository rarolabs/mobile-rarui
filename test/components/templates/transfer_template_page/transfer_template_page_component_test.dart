import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/icon/icon.dart';
import 'package:rarUI/components/atoms/label/label.dart';
import 'package:rarUI/components/molecules/app_bar/app_bar.dart';
import 'package:rarUI/components/molecules/button/button.dart';
import 'package:rarUI/components/molecules/money_input/money_input.dart';
import 'package:rarUI/components/templates/transfer_template_page/transfer_template_page.dart';
import 'package:rarUI/utils/enums/coin_type.dart';
import 'package:rarUI/utils/interfaces/behaviour.dart';

void main() {
  testWidgets('Deve testar o componente QTransferTemplatePage com o valor de Real (R\$)', (tester) async {
    bool showBalance = true;
    bool onPrimaryButtonPressed = false;
    bool onSecondaryButtonPressed = false;
    bool onBackButtonPressed = false;
    const double initialValue = 1500;
    String inputvalue = '0';

    await tester.pumpWidget(
      MaterialApp(
        home: QTransferTemplatePage.standard(
          behaviour: Behaviour.regular,
          inputBehaviour: Behaviour.regular,
          appBarTitle: 'Pagar com chave',
          titlePage: 'Quanto gostaria de transferir?',
          subtitlePage: 'Informe o quanto voce quer transferir',
          moneyInputDescription: 'Seu saldo atual é:',
          accountBalance: initialValue,
          primaryButtonText: 'Continuar',
          secondaryButtonText: 'Cancelar',
          initialValue: initialValue,
          primaryButtonBehaviour: Behaviour.regular,
          onPrimaryButtonPressed: () {
            onPrimaryButtonPressed = true;
          },
          onSecondaryButtonPressed: () {
            onSecondaryButtonPressed = true;
          },
          onBackButtonPressed: () {
            onBackButtonPressed = true;
          },
          onInputIconTap: () {
            showBalance = !showBalance;
          },
          onValueChange: (value) {
            inputvalue = value;
          },
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(QTransferTemplatePage), findsOneWidget);

    expect(find.text('Pagar com chave'), findsOneWidget);
    expect(find.text('Quanto gostaria de transferir?'), findsOneWidget);
    expect(find.text('Informe o quanto voce quer transferir'), findsOneWidget);
    expect(find.text('Seu saldo atual é:'), findsOneWidget);

    expect(find.byType(QMoneyInput), findsOneWidget);
    expect(find.byType(QButton), findsNWidgets(2));
    expect(find.byType(QAppBar), findsOneWidget);
    expect(find.byType(QLabel), findsNWidgets(6));

    await tester.tap(find.byKey(const Key('iconTap')));
    await tester.pumpAndSettle();
    expect(showBalance, false);

    await tester.tap(find.byKey(const Key('primaryButton')));
    await tester.pumpAndSettle();
    expect(onPrimaryButtonPressed, true);

    await tester.tap(find.byKey(const Key('secondaryButton')));
    await tester.pumpAndSettle();
    expect(onSecondaryButtonPressed, true);

    await tester.tap(find.byType(QIcon).first);
    await tester.pumpAndSettle();
    expect(onBackButtonPressed, true);

    await tester.tap(find.byType(QMoneyInput));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(QMoneyInput), '10.00');
    await tester.pumpAndSettle();

    debugPrint('inputvalue: $inputvalue');

    expect(
      inputvalue.replaceAll('R\$', '').trim(),
      '10,00',
    );

    await tester.enterText(find.byType(QMoneyInput), '1.857.55');
    await tester.pumpAndSettle();

    expect(
      inputvalue.replaceAll('R\$', '').trim(),
      '1.857,55',
    );
  });
  testWidgets('Deve testar o componente QTransferTemplatePage com o valor de dolar (\$)', (tester) async {
    bool showBalance = true;
    bool onPrimaryButtonPressed = false;
    bool onSecondaryButtonPressed = false;
    bool onBackButtonPressed = false;
    const double initialValue = 1500;
    String inputvalue = '0';

    await tester.pumpWidget(
      MaterialApp(
        home: QTransferTemplatePage.standard(
          behaviour: Behaviour.regular,
          inputBehaviour: Behaviour.regular,
          coinType: CoinType.dollar,
          appBarTitle: 'Pagar com chave',
          titlePage: 'Quanto gostaria de transferir?',
          subtitlePage: 'Informe o quanto voce quer transferir',
          moneyInputDescription: 'Seu saldo atual é:',
          accountBalance: initialValue,
          primaryButtonText: 'Continuar',
          secondaryButtonText: 'Cancelar',
          initialValue: initialValue,
          primaryButtonBehaviour: Behaviour.regular,
          onPrimaryButtonPressed: () {
            onPrimaryButtonPressed = true;
          },
          onSecondaryButtonPressed: () {
            onSecondaryButtonPressed = true;
          },
          onBackButtonPressed: () {
            onBackButtonPressed = true;
          },
          onInputIconTap: () {
            showBalance = !showBalance;
          },
          onValueChange: (value) {
            inputvalue = value;
          },
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(QTransferTemplatePage), findsOneWidget);

    expect(find.text('Pagar com chave'), findsOneWidget);
    expect(find.text('Quanto gostaria de transferir?'), findsOneWidget);
    expect(find.text('Informe o quanto voce quer transferir'), findsOneWidget);
    expect(find.text('Seu saldo atual é:'), findsOneWidget);

    expect(find.byType(QMoneyInput), findsOneWidget);
    expect(find.byType(QButton), findsNWidgets(2));
    expect(find.byType(QAppBar), findsOneWidget);
    expect(find.byType(QLabel), findsNWidgets(6));

    await tester.tap(find.byKey(const Key('iconTap')));
    await tester.pumpAndSettle();
    expect(showBalance, false);

    await tester.tap(find.byKey(const Key('primaryButton')));
    await tester.pumpAndSettle();
    expect(onPrimaryButtonPressed, true);

    await tester.tap(find.byKey(const Key('secondaryButton')));
    await tester.pumpAndSettle();
    expect(onSecondaryButtonPressed, true);

    await tester.tap(find.byType(QIcon).first);
    await tester.pumpAndSettle();
    expect(onBackButtonPressed, true);

    await tester.tap(find.byType(QMoneyInput));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(QMoneyInput), '1578.880.02');
    await tester.pumpAndSettle();

    debugPrint('inputvalue: $inputvalue');

    expect(
      inputvalue.replaceAll('\$', '').trim(),
      '1,578,880.02',
    );
  });
  testWidgets('Deve testar o componente QTransferTemplatePage com o valor em Euro (€)', (tester) async {
    bool showBalance = true;
    bool onPrimaryButtonPressed = false;
    bool onSecondaryButtonPressed = false;
    bool onBackButtonPressed = false;
    const double initialValue = 1500;
    String inputvalue = '0';

    await tester.pumpWidget(
      MaterialApp(
        home: QTransferTemplatePage.standard(
          behaviour: Behaviour.regular,
          inputBehaviour: Behaviour.regular,
          coinType: CoinType.euro,
          appBarTitle: 'Pagar com chave',
          titlePage: 'Quanto gostaria de transferir?',
          subtitlePage: 'Informe o quanto voce quer transferir',
          moneyInputDescription: 'Seu saldo atual é:',
          accountBalance: initialValue,
          primaryButtonText: 'Continuar',
          secondaryButtonText: 'Cancelar',
          initialValue: initialValue,
          primaryButtonBehaviour: Behaviour.regular,
          onPrimaryButtonPressed: () {
            onPrimaryButtonPressed = true;
          },
          onSecondaryButtonPressed: () {
            onSecondaryButtonPressed = true;
          },
          onBackButtonPressed: () {
            onBackButtonPressed = true;
          },
          onInputIconTap: () {
            showBalance = !showBalance;
          },
          onValueChange: (value) {
            inputvalue = value;
          },
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(QTransferTemplatePage), findsOneWidget);

    expect(find.text('Pagar com chave'), findsOneWidget);
    expect(find.text('Quanto gostaria de transferir?'), findsOneWidget);
    expect(find.text('Informe o quanto voce quer transferir'), findsOneWidget);
    expect(find.text('Seu saldo atual é:'), findsOneWidget);

    expect(find.byType(QMoneyInput), findsOneWidget);
    expect(find.byType(QButton), findsNWidgets(2));
    expect(find.byType(QAppBar), findsOneWidget);
    expect(find.byType(QLabel), findsNWidgets(6));

    await tester.tap(find.byKey(const Key('iconTap')));
    await tester.pumpAndSettle();
    expect(showBalance, false);

    await tester.tap(find.byKey(const Key('primaryButton')));
    await tester.pumpAndSettle();
    expect(onPrimaryButtonPressed, true);

    await tester.tap(find.byKey(const Key('secondaryButton')));
    await tester.pumpAndSettle();
    expect(onSecondaryButtonPressed, true);

    await tester.tap(find.byType(QIcon).first);
    await tester.pumpAndSettle();
    expect(onBackButtonPressed, true);

    await tester.tap(find.byType(QMoneyInput));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(QMoneyInput), '50.088.85');
    await tester.pumpAndSettle();

    debugPrint('inputvalue: $inputvalue');

    expect(
      inputvalue.replaceAll('€', '').trim(),
      '50.088,85',
    );
  });
}
