import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/components/atoms/text_field/text_form_field.dart';

void main() {
  group('RTextFormField', () {
    testWidgets('deve renderizar com propriedades básicas',
        (WidgetTester tester) async {
      const testText = 'Texto de teste';
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: RTextFormField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Digite um texto',
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.text('Digite um texto'), findsOneWidget);

      await tester.enterText(find.byType(TextFormField), testText);
      expect(controller.text, testText);
    });

    testWidgets('deve lidar com propriedade initialValue',
        (WidgetTester tester) async {
      const initialValue = 'Texto inicial';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: RTextFormField(
                initialValue: initialValue,
              ),
            ),
          ),
        ),
      );

      expect(find.text(initialValue), findsOneWidget);
    });

    testWidgets('deve lidar com função validator', (WidgetTester tester) async {
      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              key: formKey,
              child: RTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
      );

      formKey.currentState!.validate();
      await tester.pump();

      expect(find.text('Campo obrigatório'), findsOneWidget);
    });

    testWidgets('deve lidar com callback onSaved', (WidgetTester tester) async {
      final formKey = GlobalKey<FormState>();
      String? savedValue;
      const testText = 'Texto salvo';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              key: formKey,
              child: RTextFormField(
                initialValue: testText,
                onSaved: (value) => savedValue = value,
              ),
            ),
          ),
        ),
      );

      formKey.currentState!.save();
      expect(savedValue, testText);
    });

    testWidgets('deve lidar com callback onFieldSubmitted',
        (WidgetTester tester) async {
      String? submittedValue;
      const testText = 'Texto enviado';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: RTextFormField(
                onFieldSubmitted: (value) => submittedValue = value,
              ),
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), testText);
      await tester.testTextInput.receiveAction(TextInputAction.done);
      expect(submittedValue, testText);
    });

    testWidgets('deve lidar com propriedade autovalidateMode',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: RTextFormField(
                autovalidateMode: AutovalidateMode.always,
                validator: (value) =>
                    value?.isEmpty == true ? 'Obrigatório' : null,
              ),
            ),
          ),
        ),
      );

      final textFormField =
          tester.widget<TextFormField>(find.byType(TextFormField));
      expect(textFormField.autovalidateMode, AutovalidateMode.always);
    });
  });
}
