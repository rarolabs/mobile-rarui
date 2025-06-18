import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/molecules/dropdownformfield/dropdownformfield_component.dart';
import 'package:rarUI/components/molecules/dropdownformfield/dropdownformfield_style_set.dart';
import 'package:rarUI/shared_widget/loading_widget.dart';
import 'package:rarUI/utils/interfaces/behaviour.dart';

void main() {
  group('DropdownformfieldComponent', () {
    testWidgets('Renderiza label e hint corretamente em estado regular', (tester) async {
      // Crie uma lista de itens e uma callback fake.
      final items = ['Item 1', 'Item 2', 'Item 3'];
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DropdownformfieldComponent<String>(
              behaviour: Behaviour.regular,
              styles: DropdownformfieldStyleSet.standard,
              items: items,
              label: 'Meu Label',
              hint: 'Selecione uma opção',
              onChanged: (value) {},
            ),
          ),
        ),
      );
      // Verifique se o label está presente.
      expect(find.text('Meu Label'), findsOneWidget);
      // Verifique se o hint é exibido.
      expect(find.text('Selecione uma opção'), findsOneWidget);
    });

    testWidgets('Chama validator e exibe erro ao selecionar item inválido', (tester) async {
      final items = ['Item 1', 'Item 2'];
      String? validatorMessage(String? value) {
        if (value == 'Item 1') {
          return 'Item 1 não é permitido';
        }
        return null;
      }

      String? selected;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DropdownformfieldComponent<String>(
              behaviour: Behaviour.regular,
              styles: DropdownformfieldStyleSet.standard,
              items: items,
              label: 'Teste',
              hint: 'Escolha um item',
              onChanged: (value) => selected = value,
              validator: validatorMessage,
            ),
          ),
        ),
      );

      // Inicialmente, não deve haver mensagem de erro.
      expect(find.text('Item 1 não é permitido'), findsNothing);

      // Abra o dropdown e selecione 'Item 1'.
      await tester.tap(find.byType(DropdownformfieldComponent<String>), warnIfMissed: false);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Item 1').last, warnIfMissed: false);
      await tester.pumpAndSettle();

      // O callback onChanged foi chamado.
      expect(selected, equals('Item 1'));

      // O validator deverá retornar uma mensagem de erro.
      expect(find.text('Item 1 não é permitido'), findsOneWidget);
    });

    testWidgets('Renderiza LoadingWidget em estado de loading', (tester) async {
      // Para simular o estado de loading, podemos criar o widget com Behaviour.processing,
      // sabendo que no delegate ele é convertido para regular. Assim, vamos testar o método whenLoading.
      final items = ['Item 1', 'Item 2'];
      final component = DropdownformfieldComponent<String>(
        behaviour: Behaviour.loading,
        styles: DropdownformfieldStyleSet.standard,
        items: items,
        label: 'Loading',
        hint: 'Aguarde...',
        onChanged: (_) {},
      );
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: component)));

      // Verifique se o LoadingWidget é renderizado.
      expect(find.byType(LoadingWidget), findsOneWidget);
    });

    testWidgets('Renderiza widget desabilitado quando o estado é disabled', (tester) async {
      final items = ['Item 1', 'Item 2'];
      String? selected;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DropdownformfieldComponent<String>(
              behaviour: Behaviour.disabled,
              styles: DropdownformfieldStyleSet.standard,
              items: items,
              label: 'Disabled',
              hint: 'Não interativo',
              onChanged: (value) => selected = value,
            ),
          ),
        ),
      );

      // O widget deve ser renderizado com onChanged nulo (desabilitado).
      // Abra o dropdown e selecione 'Item 1'.
      await tester.tap(find.byType(DropdownformfieldComponent<String>), warnIfMissed: false);
      await tester.pumpAndSettle();
      expect(find.text('Item 1'), findsNothing);
      expect(selected == null, isTrue);
    });
  });
}
