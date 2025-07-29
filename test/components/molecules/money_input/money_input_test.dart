import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/balance_display/balance_display.dart';
import 'package:rarUI/rarui.dart';
import 'package:rarUI/utils/enums/coin_type.dart';

void main() {
  testWidgets('RMoneyInput deve renderizar corretamente',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RMoneyInput(
            initialValue: 100.0,
            initiallyVisible: true,
            balanceDescription: 'Saldo disponível',
            balanceValue: 500.0,
            inputTextStyle:
                TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            balanceDescriptionTextStyle:
                TextStyle(color: Colors.grey, fontSize: 16.0),
            balanceValueTextStyle:
                TextStyle(color: Colors.green, fontSize: 20.0),
          ),
        ),
      ),
    );

    expect(find.byType(RMoneyInput), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(Row), findsOneWidget);
    expect(find.byType(RBalanceDisplay), findsOneWidget);
    expect(find.byType(RIconButton), findsOneWidget);
    expect(
        find.text(CoinType.real.currencyFormat.format(500.0)), findsOneWidget);
  });
}
