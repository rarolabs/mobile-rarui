import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/icon/icon.dart';
import 'package:rarUI/components/molecules/textformfield/textformfield_component.dart';
import 'package:rarUI/components/molecules/textformfield/textformfield_style_set.dart';
import 'package:rarUI/theme/theme_data.dart';
import 'package:rarUI/utils/interfaces/behaviour.dart';

void main() {
  late String? errorText;
  late TextFieldStates fieldState;

  setUp(() {
    errorText = null;
    fieldState = TextFieldStates.regular;
  });
  group(
    'Deve testar o comportamento do textformfield regular',
    () {
      testWidgets('Deve testar o comportamento de validacao e estado de erro', (tester) async {
        final controller = TextEditingController();

        await tester.pumpWidget(
          MaterialApp(
            home: Material(
              child: TextformfieldComponent(
                behaviour: Behaviour.regular,
                styles: TextformfieldStyleSet.standard,
                controller: controller,
                fieldState: fieldState,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    errorText = 'Campo obrigatório';
                    return errorText;
                  }
                  errorText = null;
                  return null;
                },
              ),
            ),
          ),
        );

        // entra com o texto e valida se ele foi inserido
        await tester.enterText(find.byType(TextFormField), 'teste');
        await tester.pump();

        expect(controller.text, equals('teste'));
        expect(errorText, isNull);

        // limpa o texto e valida se o erro aparece
        await tester.enterText(find.byType(TextFormField), '');
        await tester.pump();

        expect(errorText, 'Campo obrigatório');
      });

      testWidgets('Deve testar o comportamento de estado do componente', (tester) async {
        int ammountValue = 50;
        const totalValue = 100;
        final controller = TextEditingController();
        await tester.pumpWidget(
          MaterialApp(
            home: Material(
              child: TextformfieldComponent(
                behaviour: Behaviour.regular,
                styles: TextformfieldStyleSet.standard,
                controller: controller,
                keyboardType: TextInputType.number,
                fieldState: fieldState,
                onChanged: (value) {
                  ammountValue = int.parse(value);
                  if (ammountValue > totalValue) {
                    fieldState = TextFieldStates.warning;
                  } else {
                    fieldState = TextFieldStates.success;
                  }
                },
              ),
            ),
          ),
        );

        // Testa se ao colocar um valor maior que o total, o estado do componente muda para warning
        await tester.enterText(find.byType(TextFormField), '120');
        await tester.pump();
        expect(fieldState, TextFieldStates.warning);

        // Testa se ao colocar um valor menor que o total, o estado do componente muda para normal
        await tester.enterText(find.byType(TextFormField), '90');
        await tester.pump();
        expect(fieldState, TextFieldStates.success);
      });

      testWidgets('Deve o clique no helper Icon e abrir o texto de ajuda', (tester) async {
        final controller = TextEditingController();
        await tester.pumpWidget(
          MaterialApp(
            home: Material(
              child: TextformfieldComponent(
                behaviour: Behaviour.regular,
                styles: TextformfieldStyleSet.standard,
                controller: controller,
                fieldState: fieldState,
                hasHelperIcon: true,
                tooltipMessage: 'Campo de ajuda',
              ),
            ),
          ),
        );

        // Tap the icon and wait for the tooltip animation
        await tester.tap(find.byType(QIcon), warnIfMissed: false);
        await tester.pump(); // Start the tooltip animation
        await tester.pump(const Duration(seconds: 1)); // Wait for tooltip to appear

        expect(find.byTooltip('Campo de ajuda'), findsOneWidget);
      });
    },
  );

  group('Deve testar o componente na versao password', () {
    testWidgets('Deve testar o comportamento de validacao e estado de erro', (tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TextformfieldComponent(
              behaviour: Behaviour.regular,
              styles: TextformfieldStyleSet.password,
              controller: controller,
              fieldState: fieldState,
              isPassword: true,
              hasSuffixIcon: true,
            ),
          ),
        ),
      );

      // Verifica estado inicial
      final svgPasswordIcon = find.byWidgetPredicate(
        (widget) => widget is QIcon && widget.svgPath == QTheme.svgs.visibility,
      );

      expect(svgPasswordIcon, findsOneWidget);

      await tester.enterText(find.byType(TextFormField), '');
      await tester.pump();
      expect(controller.text, equals(''));

      // Testa o clique no botão
      await tester.tap(find.byType(QIcon));
      await tester.pump();

      final svgPasswordOffIcon = find.byWidgetPredicate(
        (widget) => widget is QIcon && widget.svgPath == QTheme.svgs.visibilityHide,
      );
      expect(svgPasswordOffIcon, findsOneWidget);
      expect(svgPasswordIcon, findsNothing);

      // Testa voltar a ocultar
      await tester.tap(find.byType(QIcon));
      await tester.pump();
      expect(svgPasswordOffIcon, findsNothing);
      expect(svgPasswordIcon, findsOneWidget);
    });
  });
}
