import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/rarui.dart';

void main() {
  testWidgets('RDialog deve exibir corretamente', (WidgetTester tester) async {
    const String textDialog = 'RDialog exibido com sucesso!';
    const Key buttonKey = Key('buttonKey');
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            return ElevatedButton(
              key: buttonKey,
              onPressed: () {
                RDialog.show(context: context, child: Column(
                  children: [
                    Text(textDialog),
                    RElevatedButton(text: 'Fechar'),
                  ],
                ));
              },
              child: Text(
                'Exibir Dialog',
              ),
            );
          }
        ),
      ),
    ));
    expect(find.text(textDialog), findsNothing);
    await tester.tap(find.byKey(buttonKey));
    expect(find.text(textDialog), findsNothing);
    await tester.pump();
    expect(find.text(textDialog), findsOneWidget);
  });
  }