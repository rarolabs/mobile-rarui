import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/molecules/tab/tab_component.dart';
import 'package:rarUI/components/molecules/tab/tab_style_set.dart';
import 'package:rarUI/utils/interfaces/behaviour.dart';

void main() {
  group('Testa o componente de Tab', () {
    testWidgets('testa o comportamento da tab quando está em disable', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TabComponent(
              style: TabStyleSet.standard,
              behaviour: Behaviour.disabled,
              tabs: ['Conta pessoal', 'Conta empresarial'],
              screens: [
                Center(child: Text('1')),
                Center(child: Text('2')),
              ],
            ),
          ),
        ),
      );

      await tester.tap(find.text('Conta empresarial'), warnIfMissed: false);
      await tester.pumpAndSettle();

      expect(find.text('1'), findsOne);
    });
    testWidgets('Testa a mudança de tab e tela ao clicar em uma tab', (tester) async {
      int tabIndex = 0;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TabComponent(
              style: TabStyleSet.standard,
              behaviour: Behaviour.regular,
              onTabChanged: (index) {
                tabIndex = index;
              },
              tabs: const ['Conta pessoal', 'Conta empresarial'],
              screens: const [
                Center(child: Text('1')),
                Center(child: Text('2')),
              ],
            ),
          ),
        ),
      );

      await tester.tap(find.text('Conta empresarial'));
      await tester.pumpAndSettle();

      expect(tabIndex, 1);
      expect(find.text('2'), findsOne);

      await tester.tap(find.text('Conta pessoal'));
      await tester.pumpAndSettle();

      expect(tabIndex, 0);
      expect(find.text('1'), findsOne);
    });
  });
}
