import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/molecules/radio_button/models/radio_options_model.dart';
import 'package:rarUI/components/molecules/radio_button/radio_button_component.dart';
import 'package:rarUI/components/molecules/radio_button/radio_button_set.dart';
import 'package:rarUI/utils/interfaces/behaviour.dart';

void main() {
  testWidgets('Testa se o radio button está funcionando e retornando a opcao corretamente', (tester) async {
    final List<QRadionOptionsModel> listTest = [
      QRadionOptionsModel(title: 'title 1', subtitle: 'subTitle 1'),
      QRadionOptionsModel(title: 'title 2', subtitle: 'subTitle 2'),
      QRadionOptionsModel(title: 'title 3'),
    ];
    QRadionOptionsModel valueChoiced = QRadionOptionsModel(title: '');
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RadioButtonComponent(
            withDivider: true,
            styles: RadioButtonSet.standard.build(),
            options: listTest,
            onChanged: (value) {
              valueChoiced = listTest[value];
            },
            behaviour: Behaviour.regular,
          ),
        ),
      ),
    );
    expect(find.byType(Radio<int>), findsExactly(3));

    await tester.tap(find.byKey(const Key('radio-button-key-0')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('radio-button-key-0')), findsOneWidget);
    expect(valueChoiced.title, listTest[0].title);
    expect(valueChoiced.subtitle, listTest[0].subtitle);

    await tester.tap(find.byKey(const Key('radio-button-key-1')));
    await tester.pumpAndSettle();

    expect(valueChoiced.title, listTest[1].title);
    expect(valueChoiced.subtitle, listTest[1].subtitle);

    await tester.tap(find.byKey(const Key('radio-button-key-2')));
    await tester.pumpAndSettle();

    expect(valueChoiced.title, listTest[2].title);
    expect(valueChoiced.subtitle, null);
  });
}
