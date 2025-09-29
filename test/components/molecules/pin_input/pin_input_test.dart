import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/rarui.dart';

void main() {
  Widget buildTestWidget({int length = 6, Color? activeBorderColor}) {
    final formKey = GlobalKey<FormState>();
    return MaterialApp(
      home: Scaffold(
        body: RPinInput(
          formKey: formKey,
          length: length,
          activeBorderColor: activeBorderColor,
          onComplete: (_) {},
          key: const Key('pin_input_widget'),
        ),
      ),
    );
  }

  testWidgets('RPinInput deve renderizar corretamente',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestWidget(length: 5));

    expect(find.byType(RPinInput), findsOneWidget);
    expect(find.byType(Form), findsOneWidget);
    expect(find.byType(Row), findsOneWidget);
    expect(find.byType(RTextFormField), findsNWidgets(5));
  });

  testWidgets(
      'onComplete é chamado somente quando todos os campos estão preenchidos',
      (WidgetTester tester) async {
    String? pinCode;
    final formKey = GlobalKey<FormState>();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RPinInput(
            key: const Key('pin_input_widget'),
            formKey: formKey,
            length: 4,
            onComplete: (value) {
              pinCode = value;
            },
          ),
        ),
      ),
    );

    expect(pinCode, isNull);

    // Preencher campo por campo
    await tester.enterText(find.byType(RTextFormField).at(0), '1');
    await tester.enterText(find.byType(RTextFormField).at(1), '2');
    await tester.enterText(find.byType(RTextFormField).at(2), '3');
    await tester.enterText(find.byType(RTextFormField).at(3), '4');
    await tester.pump();

    expect(pinCode, equals('1234'));
  });

  testWidgets('addDigit adiciona corretamente e chama onComplete ao final',
      (WidgetTester tester) async {
    String? pinCode;
    final formKey = GlobalKey<FormState>();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RPinInput(
            key: const Key('pin_input_widget'),
            formKey: formKey,
            length: 3,
            onComplete: (value) {
              pinCode = value;
            },
          ),
        ),
      ),
    );

    final state =
        tester.state<RPinInputState>(find.byKey(const Key('pin_input_widget')));
    state.addDigit('5');
    state.addDigit('4');
    state.addDigit('3');
    await tester.pump();

    expect(find.text('5'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(pinCode, equals('543'));
  });

  testWidgets('backspace apaga corretamente o último dígito',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestWidget(length: 3));
    final state =
        tester.state<RPinInputState>(find.byKey(const Key('pin_input_widget')));

    state.addDigit('1');
    state.addDigit('2');
    state.addDigit('3');
    await tester.pump();

    expect(find.text('3'), findsOneWidget);

    state.backspace();
    await tester.pump();
    expect(find.text('3'), findsNothing);
    expect(find.text('2'), findsOneWidget);
  });
}
