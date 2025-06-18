import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/molecules/checkbox/checkbox.dart';
import 'package:rarUI/shared_widget/loading_widget.dart';
import 'package:rarUI/theme/theme_data.dart';
import 'package:rarUI/utils/interfaces/behaviour.dart';

void main() {
  const title = 'Checkbox Test';

  Widget createTestableWidget(Widget body) => MaterialApp(home: Scaffold(body: body));

  group(
    'Testes no componente QCheckbox | ',
    () {
      testWidgets('Com estado regular e desmarcado', (WidgetTester tester) async {
        await tester.pumpWidget(
          createTestableWidget(
            const QCheckbox.regular(
              behaviour: Behaviour.regular,
              title: title,
            ),
          ),
        );

        // Verifica se o checkbox é renderizado
        expect(find.byKey(const Key('check')), findsOneWidget);
        expect(find.text(title), findsOneWidget);

        // Verifica o estado inicial
        final AnimatedContainer container = tester.widget(find.byType(AnimatedContainer));
        expect(container.decoration, isA<BoxDecoration>());
        final BoxDecoration decoration = container.decoration as BoxDecoration;
        expect(decoration.color, equals(QTheme.colors.transparent));
      });

      testWidgets('Simula o toque no QCheckbox usando Key', (WidgetTester tester) async {
        bool checkboxValue = false;

        await tester.pumpWidget(
          createTestableWidget(
            QCheckbox.regular(
              behaviour: Behaviour.regular,
              title: 'Checkbox Test',
              onChanged: (value) => checkboxValue = value,
            ),
          ),
        );

        // Certifica que o widget está presente
        final checkboxFinder = find.byKey(const Key('check'));
        expect(checkboxFinder, findsOneWidget);

        // Toca no checkbox
        await tester.tap(checkboxFinder, warnIfMissed: false);
        await tester.pumpAndSettle();

        // Verifica se o valor mudou
        expect(checkboxValue, isTrue);
      });

      testWidgets('Não permite interação quando o comportamento é desativado', (WidgetTester tester) async {
        bool? checkboxValue;
        await tester.pumpWidget(
          createTestableWidget(
            QCheckbox.regular(
              behaviour: Behaviour.disabled,
              title: title,
              onChanged: (value) => checkboxValue = value,
            ),
          ),
        );

        // Estado inicial
        expect(checkboxValue, isNull);

        // Simula o toque no checkbox
        await tester.tap(find.byKey(const Key('check')), warnIfMissed: false);
        await tester.pumpAndSettle();

        // Verifica que o estado não mudou
        expect(checkboxValue, isNull);
      });

      testWidgets('Não permite interação quando o comportamento é processing', (WidgetTester tester) async {
        bool? checkboxValue;
        await tester.pumpWidget(
          createTestableWidget(
            QCheckbox.regular(
              behaviour: Behaviour.processing,
              title: title,
              onChanged: (value) => checkboxValue = value,
            ),
          ),
        );

        // Estado inicial
        expect(checkboxValue, isNull);

        // Simula o toque no checkbox
        await tester.tap(find.byKey(const Key('check')), warnIfMissed: false);
        await tester.pumpAndSettle();

        // Verifica que o estado não mudou
        expect(checkboxValue, isNull);
      });

      testWidgets('Permite a interação quando o comportamento é error', (WidgetTester tester) async {
        bool? checkboxValue;
        await tester.pumpWidget(
          createTestableWidget(
            QCheckbox.regular(
              behaviour: Behaviour.error,
              title: title,
              onChanged: (value) => checkboxValue = value,
            ),
          ),
        );

        // Estado inicial
        expect(checkboxValue, isNull);

        // Simula o toque no checkbox
        await tester.tap(find.byKey(const Key('check')), warnIfMissed: false);
        await tester.pumpAndSettle();

        // Verifica que o estado não mudou
        expect(checkboxValue, isTrue);
      });

      testWidgets('Deve retornar um LoadingWidget quando o comportamento é loading', (WidgetTester tester) async {
        await tester.pumpWidget(
          createTestableWidget(
            const QCheckbox.regular(
              behaviour: Behaviour.loading,
              title: title,
            ),
          ),
        );

        expect(find.byType(LoadingWidget), findsOne);
      });
    },
  );
}
