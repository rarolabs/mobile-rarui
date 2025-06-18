import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/label/label.dart';
import 'package:rarUI/components/molecules/molecules.dart';
import 'package:rarUI/utils/interfaces/behaviour.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });
  testWidgets('Testa se o money input regular está funcionando e exibindo corretamente seus widgets', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Material(
          child: QMoneyInput.standard(
            behaviour: Behaviour.regular,
            formFieldKey: Key('inputMoneyRegularKey'),
            label: TextSpan(
              children: [
                TextSpan(
                  text: 'Seu limite atual é ',
                ),
                TextSpan(
                  text: 'R\$ 2.100,00',
                ),
              ],
            ),
            hintLabel: 'Teste',
          ),
        ),
      ),
    );
    expect(find.byKey(const Key('inputMoneyRegularKey')), findsOneWidget);

    expect(find.byType(TextFormField), findsOneWidget);
    expect(find.byType(Divider), findsOneWidget);
    expect(find.byType(QLabel), findsOneWidget);
    expect(find.text('Teste'), findsOneWidget);
    expect(find.byType(RichText), findsNWidgets(2));
  });

  testWidgets('Testa se o money input transferencia está funcionando e exibindo corretamente seus widgets',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: QMoneyInput.transfer(
            behaviour: Behaviour.regular,
            formFieldKey: const Key('inputMoneyRegularKey'),
            label: const TextSpan(
              children: [
                TextSpan(
                  text: 'Seu limite atual é ',
                ),
                TextSpan(
                  text: 'R\$ 2.100,00',
                ),
              ],
            ),
            icon: Icons.visibility_off,
            onIconTap: () {},
          ),
        ),
      ),
    );
    expect(find.byKey(const Key('inputMoneyRegularKey')), findsOneWidget);

    expect(find.byType(TextFormField), findsOneWidget);
    expect(find.byType(Divider), findsOneWidget);
    expect(find.byType(RichText), findsNWidgets(2));
    expect(find.byType(Icon), findsOneWidget);
  });
}
