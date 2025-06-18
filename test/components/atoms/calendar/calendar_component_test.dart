import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/rarui.dart';
import 'package:rarUI/shared_widget/loading_widget.dart';

void main() {
  testWidgets('Exibir componente QCalendar', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: QCalendar.standard(
              behaviour: Behaviour.regular,
              currentDate: DateTime(2025),
            ),
          ),
        ),
      ),
    );

    final calendarFinder = find.byType(QCalendar);
    expect(calendarFinder, findsOneWidget);

    // Verificar se está exibindo a ultima data de janeiro
    final janeiroFinder = find.text('31');
    expect(janeiroFinder, findsOne);

    // Localiza o icones e clica no segundo icone
    final iconFinder = find.byType(Icon);
    expect(iconFinder, findsExactly(2));
    await tester.tap(iconFinder.last, warnIfMissed: false);
    await tester.pumpAndSettle();

    // Verificar se a ultima data não é mais 31
    expect(janeiroFinder, findsNothing);
    final fevereiroFinder = find.text('28');
    expect(fevereiroFinder, findsOne);
  });

  testWidgets('Exibir componente QCalendar desabilitado, não permitir cliques no componente', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: QCalendar.standard(
              behaviour: Behaviour.disabled,
              currentDate: DateTime(2025),
            ),
          ),
        ),
      ),
    );

    final calendarFinder = find.byType(QCalendar);
    expect(calendarFinder, findsOneWidget);

    // Verificar se está exibindo a ultima data de janeiro
    final monthFinder = find.text('31');
    expect(monthFinder, findsOne);

    // Localiza o icones e tenta clica no segundo icone
    final iconFinder = find.byType(Icon);
    expect(iconFinder, findsExactly(2));
    await tester.tap(iconFinder.last, warnIfMissed: false);
    await tester.pumpAndSettle();

    // Verificar se o título está presente
    expect(monthFinder, findsOne);
  });

  testWidgets('Exibir componente QPinInput loading', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: QCalendar.standard(
              behaviour: Behaviour.loading,
              currentDate: DateTime(2025),
            ),
          ),
        ),
      ),
    );

    final calendarFinder = find.byType(QCalendar);
    expect(calendarFinder, findsOneWidget);

    // Verificar se está exibindo loading
    final loadingFinder = find.byType(LoadingWidget);
    expect(loadingFinder, findsOneWidget);

    // Verifica se os icones estão presentes
    final iconFinder = find.byType(Icon);
    expect(iconFinder, findsNothing);
  });
}
