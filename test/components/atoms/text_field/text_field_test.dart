import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/text_field/text_field.dart';

void main() {
  group('RTextField', () {
    testWidgets('deve renderizar com propriedades básicas', (WidgetTester tester) async {
      const testText = 'Texto de teste';
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RTextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Digite um texto',
              ),
            ),
          ),
        ),
      );

      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Digite um texto'), findsOneWidget);

      await tester.enterText(find.byType(TextField), testText);
      expect(controller.text, testText);
    });

    testWidgets('deve lidar com callback onChanged', (WidgetTester tester) async {
      String? changedValue;
      const testText = 'Texto alterado';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RTextField(
              onChanged: (value) => changedValue = value,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), testText);
      expect(changedValue, testText);
    });

    testWidgets('deve lidar com callback onSubmitted', (WidgetTester tester) async {
      String? submittedValue;
      const testText = 'Texto enviado';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RTextField(
              onSubmitted: (value) => submittedValue = value,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), testText);
      await tester.testTextInput.receiveAction(TextInputAction.done);
      expect(submittedValue, testText);
    });

    testWidgets('deve lidar com propriedade obscureText', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RTextField(
              obscureText: true,
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.obscureText, true);
    });

    testWidgets('deve lidar com propriedade readOnly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RTextField(
              readOnly: true,
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.readOnly, true);
    });

    testWidgets('deve lidar com propriedade maxLength', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RTextField(
              maxLength: 10,
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.maxLength, 10);
    });

    testWidgets('deve lidar com callback onTap', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RTextField(
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TextField));
      expect(tapped, true);
    });
  });
}
