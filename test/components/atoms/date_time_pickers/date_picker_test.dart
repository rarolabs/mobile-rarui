import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/components/atoms/atoms.dart';

import '../../utils/widget_tester_extension.dart';

void main() {
  testWidgets('DatePicker é renderizado com builder padrão', (tester) async {
    Key datePickerKey = const Key("datePickerTest");
    Key buttonKey = const Key("buttonTest");

    await tester.pumpMaterialComponent(
      RDatePicker(
        key: datePickerKey,
        onDateSelected: (date) {},
        builder: (onPressed) => ElevatedButton(
          key: buttonKey,
          onPressed: onPressed,
          child: Text('Selecionar Data'),
        ),
      ),
    );

    final componentFinder = find.byKey(datePickerKey);
    expect(componentFinder, findsOneWidget);

    final buttonFinder = find.byKey(buttonKey);
    expect(buttonFinder, findsOneWidget);

    final defaultTextFinder = find.text('Selecionar Data');
    expect(defaultTextFinder, findsOneWidget);
  });

  testWidgets('DatePicker é renderizado com builder customizado',
      (tester) async {
    Key datePickerKey = const Key("datePickerTest2");
    Key buttonKey = const Key("buttonTest2");
    String customLabel = "Escolher Data";

    await tester.pumpMaterialComponent(
      RDatePicker(
        key: datePickerKey,
        onDateSelected: (date) {},
        builder: (onPressed) => TextButton(
          key: buttonKey,
          onPressed: onPressed,
          child: Text(customLabel),
        ),
      ),
    );

    final componentFinder = find.byKey(datePickerKey);
    expect(componentFinder, findsOneWidget);

    final buttonFinder = find.byKey(buttonKey);
    expect(buttonFinder, findsOneWidget);

    final customTextFinder = find.text(customLabel);
    expect(customTextFinder, findsOneWidget);
  });

  testWidgets('DatePicker abre dialog ao ser clicado', (tester) async {
    Key datePickerKey = const Key("datePickerTest3");
    Key buttonKey = const Key("buttonTest3");

    await tester.pumpMaterialComponent(
      RDatePicker(
        key: datePickerKey,
        onDateSelected: (date) {},
        builder: (onPressed) => ElevatedButton(
          key: buttonKey,
          onPressed: onPressed,
          child: Text('Abrir DatePicker'),
        ),
      ),
    );

    final buttonFinder = find.byKey(buttonKey);
    expect(buttonFinder, findsOneWidget);

    // Toca no botão para abrir o date picker
    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    // Verifica se o dialog do date picker foi aberto
    final datePickerDialog = find.byType(DatePickerDialog);
    expect(datePickerDialog, findsOneWidget);
  });

  testWidgets('DatePicker chama onDateSelected ao selecionar data',
      (tester) async {
    Key datePickerKey = const Key("datePickerTest4");
    Key buttonKey = const Key("buttonTest4");
    DateTime? selectedDate;
    bool dateSelected = false;

    await tester.pumpMaterialComponent(
      RDatePicker(
        key: datePickerKey,
        onDateSelected: (date) {
          dateSelected = true;
          selectedDate = date;
        },
        builder: (onPressed) => ElevatedButton(
          key: buttonKey,
          onPressed: onPressed,
          child: Text('Selecionar Data'),
        ),
      ),
    );

    final buttonFinder = find.byKey(buttonKey);
    expect(buttonFinder, findsOneWidget);

    // Toca no botão para abrir o date picker
    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    // Confirma a data atual (botão OK)
    final okButton = find.text('OK');
    if (okButton.evaluate().isNotEmpty) {
      await tester.tap(okButton);
      await tester.pumpAndSettle();
    }

    // Verifica se a função onDateSelected foi chamada
    expect(dateSelected, isTrue);
    expect(selectedDate, isNotNull);
  });

  testWidgets('DatePicker com configurações customizadas', (tester) async {
    Key datePickerKey = const Key("datePickerTest5");
    Key buttonKey = const Key("buttonTest5");
    DateTime initialDate = DateTime(2023, 6, 15);

    await tester.pumpMaterialComponent(
      RDatePicker(
        key: datePickerKey,
        onDateSelected: (date) {},
        initialDate: initialDate,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030),
        helpText: "Escolha uma data",
        cancelText: "Cancelar",
        confirmText: "Confirmar",
        builder: (onPressed) => ElevatedButton(
          key: buttonKey,
          onPressed: onPressed,
          child: Text('Data Customizada'),
        ),
      ),
    );

    final buttonFinder = find.byKey(buttonKey);
    expect(buttonFinder, findsOneWidget);

    // Toca no botão para abrir o date picker
    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    // Verifica se o dialog foi aberto com configurações customizadas
    final datePickerDialog = find.byType(DatePickerDialog);
    expect(datePickerDialog, findsOneWidget);

    final helpText = find.text("Escolha uma data");
    expect(helpText, findsOneWidget);

    final cancelButton = find.text("Cancelar");
    expect(cancelButton, findsOneWidget);
  });

  testWidgets('DatePicker permite cancelar seleção', (tester) async {
    Key datePickerKey = const Key("datePickerTest6");
    Key buttonKey = const Key("buttonTest6");
    bool dateSelected = false;

    await tester.pumpMaterialComponent(
      RDatePicker(
        key: datePickerKey,
        onDateSelected: (date) {
          dateSelected = true;
        },
        builder: (onPressed) => ElevatedButton(
          key: buttonKey,
          onPressed: onPressed,
          child: Text('Selecionar Data'),
        ),
      ),
    );

    final buttonFinder = find.byKey(buttonKey);
    expect(buttonFinder, findsOneWidget);

    // Toca no botão para abrir o date picker
    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    // Cancela a seleção
    final cancelButton = find.text('CANCEL');
    if (cancelButton.evaluate().isNotEmpty) {
      await tester.tap(cancelButton);
      await tester.pumpAndSettle();
    }

    // Verifica se a função onDateSelected NÃO foi chamada
    expect(dateSelected, isFalse);
  });
}
