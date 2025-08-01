import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/templates/limit_pix/limit_pix.dart';

void main() {
  testWidgets('RLimitPix exibe título, subtítulo e dois RListTiles',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RLimitPix(),
        ),
      ),
    );

    expect(find.text('Editar limites do Pix'), findsOneWidget);
    expect(
        find.text(
            'Ajuste os valores máximos permitidos para cada período do dia.'),
        findsOneWidget);

    expect(find.text('Período Diurno'), findsOneWidget);
    expect(find.text('Período Noturno'), findsOneWidget);
    expect(find.byIcon(Icons.light_mode), findsOneWidget);
    expect(find.byIcon(Icons.dark_mode), findsOneWidget);
    expect(find.byIcon(Icons.chevron_right), findsNWidgets(2));
  });

  testWidgets('RLimitPix executa callbacks ao tocar nos tiles',
      (WidgetTester tester) async {
    var tappedDiurno = false;
    var tappedNoturno = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RLimitPix(
            onTapPeriodoDiurno: () {
              tappedDiurno = true;
            },
            onTapPeriodoNoturno: () {
              tappedNoturno = true;
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Período Diurno'));
    await tester.pumpAndSettle();
    expect(tappedDiurno, isTrue);

    await tester.tap(find.text('Período Noturno'));
    await tester.pumpAndSettle();
    expect(tappedNoturno, isTrue);
  });
}
