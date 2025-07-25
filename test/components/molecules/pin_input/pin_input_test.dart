import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/rarui.dart';

void main() {
  testWidgets('RPinInput deve renderizar corretamente',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RPinInput(
            formKey: GlobalKey<FormState>(),
            onComplete: (_) {},
            length: 5,
          ),
        ),
      ),
    );

    expect(find.byType(RPinInput), findsOneWidget);
    expect(find.byType(Form), findsOneWidget);
    expect(find.byType(Row), findsOneWidget);
    expect(find.byType(RTextFormField), findsNWidgets(5));
  });

  group(
      'onCompleted deve ser chamado somente quando todos os campos estiverem preenchidos',
      () {
    testWidgets('completando o PIN com paste deve chamar onComplete',
        (WidgetTester tester) async {
      String? pinCode;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RPinInput(
              formKey: GlobalKey<FormState>(),
              onComplete: (value) {
                pinCode = value;
              },
              length: 5,
            ),
          ),
        ),
      );

      expect(pinCode, isNull);

      Future<void> pasteText(String testValue) async {
        await tester.enterText(find.byType(RTextFormField).first, testValue);
      }

      await pasteText('123');
      expect(pinCode, equals(isNull));

      await pasteText('12345');
      expect(pinCode, equals('12345'));
    });

    testWidgets('completando o PIN com input deve chamar onComplete',
        (WidgetTester tester) async {
      String? pinCode;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RPinInput(
              formKey: GlobalKey<FormState>(),
              onComplete: (value) {
                pinCode = value;
              },
              length: 5,
            ),
          ),
        ),
      );

      expect(pinCode, isNull);

      Future<void> inputTextOneByOne(String testValue) async {
        await tester.enterText(find.byType(RTextFormField).at(0), testValue[0]);
        await tester.enterText(find.byType(RTextFormField).at(1), testValue[1]);
        await tester.enterText(find.byType(RTextFormField).at(2), testValue[2]);
        await tester.enterText(find.byType(RTextFormField).at(3), testValue[3]);
        await tester.enterText(find.byType(RTextFormField).at(4), testValue[4]);
      }

      await inputTextOneByOne('54321');
      expect(pinCode, equals('54321'));
    });
  });
}
