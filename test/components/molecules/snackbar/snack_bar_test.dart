import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/components/molecules/snack_bar/snack_bar.dart';

void main() {
  testWidgets('RSnackBar deve exibir corretamente',
      (WidgetTester tester) async {
    const String textSnackBar = 'RSnackBar exibido com sucesso!';
    const Key buttonKey = Key('buttonKey');
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(builder: (BuildContext context) {
          return ElevatedButton(
            key: buttonKey,
            onPressed: () {
              RSnackBar.show(context: context, message: textSnackBar);
            },
            child: Text(
              'Exibir SnackBar',
            ),
          );
        }),
      ),
    ));
    expect(find.text(textSnackBar), findsNothing);
    await tester.tap(find.byKey(buttonKey));
    expect(find.text(textSnackBar), findsNothing);
    await tester.pump();
    expect(find.text(textSnackBar), findsOneWidget);
  });
}
