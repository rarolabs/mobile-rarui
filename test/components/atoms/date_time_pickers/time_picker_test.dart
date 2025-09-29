import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/components/atoms/atoms.dart';

import '../../utils/widget_tester_extension.dart';

void main() {
  testWidgets('TimePicker é renderizado com builder padrão', (tester) async {
    Key timePickerKey = const Key("timePickerTest");
    Key buttonKey = const Key("buttonTest");

    await tester.pumpMaterialComponent(
      RTimePicker(
        key: timePickerKey,
        onTimeSelected: (time) {},
        builder: (onPressed) => ElevatedButton(
          key: buttonKey,
          onPressed: onPressed,
          child: Text('Selecionar Horário'),
        ),
      ),
    );

    final componentFinder = find.byKey(timePickerKey);
    expect(componentFinder, findsOneWidget);

    final buttonFinder = find.byKey(buttonKey);
    expect(buttonFinder, findsOneWidget);

    final defaultTextFinder = find.text('Selecionar Horário');
    expect(defaultTextFinder, findsOneWidget);
  });

  testWidgets('TimePicker é renderizado com builder customizado',
      (tester) async {
    Key timePickerKey = const Key("timePickerTest2");
    Key buttonKey = const Key("buttonTest2");
    String customLabel = "Escolher Horário";

    await tester.pumpMaterialComponent(
      RTimePicker(
        key: timePickerKey,
        onTimeSelected: (time) {},
        builder: (onPressed) => TextButton(
          key: buttonKey,
          onPressed: onPressed,
          child: Text(customLabel),
        ),
      ),
    );

    final componentFinder = find.byKey(timePickerKey);
    expect(componentFinder, findsOneWidget);

    final buttonFinder = find.byKey(buttonKey);
    expect(buttonFinder, findsOneWidget);

    final customTextFinder = find.text(customLabel);
    expect(customTextFinder, findsOneWidget);
  });

  testWidgets('TimePicker abre dialog ao ser clicado', (tester) async {
    Key timePickerKey = const Key("timePickerTest3");
    Key buttonKey = const Key("buttonTest3");

    await tester.pumpMaterialComponent(
      RTimePicker(
        key: timePickerKey,
        onTimeSelected: (time) {},
        builder: (onPressed) => ElevatedButton(
          key: buttonKey,
          onPressed: onPressed,
          child: Text('Abrir TimePicker'),
        ),
      ),
    );

    final buttonFinder = find.byKey(buttonKey);
    expect(buttonFinder, findsOneWidget);

    // Toca no botão para abrir o time picker
    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    // Verifica se o dialog do time picker foi aberto
    final timePickerDialog = find.byType(TimePickerDialog);
    expect(timePickerDialog, findsOneWidget);
  });

  testWidgets('TimePicker com modo de entrada dial', (tester) async {
    Key timePickerKey = const Key("timePickerTest4");
    Key buttonKey = const Key("buttonTest4");

    await tester.pumpMaterialComponent(
      RTimePicker(
        key: timePickerKey,
        entryMode: TimePickerEntryMode.dial,
        onTimeSelected: (time) {},
        builder: (onPressed) => ElevatedButton(
          key: buttonKey,
          onPressed: onPressed,
          child: Text('Horário Dial'),
        ),
      ),
    );

    final buttonFinder = find.byKey(buttonKey);
    expect(buttonFinder, findsOneWidget);

    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    final timePickerDialog = find.byType(TimePickerDialog);
    expect(timePickerDialog, findsOneWidget);
  });

  testWidgets('TimePicker chama onTimeSelected ao selecionar horário',
      (tester) async {
    Key timePickerKey = const Key("timePickerTest5");
    Key buttonKey = const Key("buttonTest5");
    TimeOfDay? selectedTime;
    bool timeSelected = false;

    await tester.pumpMaterialComponent(
      RTimePicker(
        key: timePickerKey,
        onTimeSelected: (time) {
          timeSelected = true;
          selectedTime = time;
        },
        builder: (onPressed) => ElevatedButton(
          key: buttonKey,
          onPressed: onPressed,
          child: Text('Selecionar Horário'),
        ),
      ),
    );

    final buttonFinder = find.byKey(buttonKey);
    expect(buttonFinder, findsOneWidget);

    // Toca no botão para abrir o time picker
    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    // Confirma o horário atual (botão OK)
    final okButton = find.text('OK');
    if (okButton.evaluate().isNotEmpty) {
      await tester.tap(okButton);
      await tester.pumpAndSettle();
    }

    // Verifica se a função onTimeSelected foi chamada
    expect(timeSelected, isTrue);
    expect(selectedTime, isNotNull);
  });

  testWidgets('TimePicker com configurações customizadas', (tester) async {
    Key timePickerKey = const Key("timePickerTest6");
    Key buttonKey = const Key("buttonTest6");
    TimeOfDay initialTime = TimeOfDay(hour: 14, minute: 30);

    await tester.pumpMaterialComponent(
      RTimePicker(
        key: timePickerKey,
        onTimeSelected: (time) {},
        initialTime: initialTime,
        helpText: "Escolha um horário",
        cancelText: "Cancelar",
        confirmText: "Confirmar",
        hourLabelText: "Hora",
        minuteLabelText: "Minuto",
        builder: (onPressed) => ElevatedButton(
          key: buttonKey,
          onPressed: onPressed,
          child: Text('Horário Customizado'),
        ),
      ),
    );

    final buttonFinder = find.byKey(buttonKey);
    expect(buttonFinder, findsOneWidget);

    // Toca no botão para abrir o time picker
    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    // Verifica se o dialog foi aberto com configurações customizadas
    final timePickerDialog = find.byType(TimePickerDialog);
    expect(timePickerDialog, findsOneWidget);

    final helpText = find.text("Escolha um horário");
    expect(helpText, findsOneWidget);

    final cancelButton = find.text("Cancelar");
    expect(cancelButton, findsOneWidget);
  });

  testWidgets('TimePicker permite cancelar seleção', (tester) async {
    Key timePickerKey = const Key("timePickerTest7");
    Key buttonKey = const Key("buttonTest7");
    bool timeSelected = false;

    await tester.pumpMaterialComponent(
      RTimePicker(
        key: timePickerKey,
        onTimeSelected: (time) {
          timeSelected = true;
        },
        builder: (onPressed) => ElevatedButton(
          key: buttonKey,
          onPressed: onPressed,
          child: Text('Selecionar Horário'),
        ),
      ),
    );

    final buttonFinder = find.byKey(buttonKey);
    expect(buttonFinder, findsOneWidget);

    // Toca no botão para abrir o time picker
    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    // Cancela a seleção
    final cancelButton = find.text('CANCEL');
    if (cancelButton.evaluate().isNotEmpty) {
      await tester.tap(cancelButton);
      await tester.pumpAndSettle();
    }

    // Verifica se a função onTimeSelected NÃO foi chamada
    expect(timeSelected, isFalse);
  });
}
