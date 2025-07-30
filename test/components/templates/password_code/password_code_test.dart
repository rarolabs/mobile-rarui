import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/rarui.dart';

void main() {
  String onCompleteValue = "";
  late RPasswordCode rPasswordCode;

  setUpAll(() {
    rPasswordCode = RPasswordCode(
        header: "Título",
        onComplete: (value) {
          onCompleteValue = value;
        });
  });
  testWidgets("RPasswordCode: Deve renderizar o componente corretamente",
      (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: rPasswordCode,
    )));
    final rPasswordCodeFinder = find.byType(RPasswordCode);
    expect(rPasswordCodeFinder, findsOne);
    final headerTextFinder = find.text("Título");
    expect(headerTextFinder, findsOne);
  });

  testWidgets("RPasswordCode: Deve retornar o valor do campo corretamente",
      (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: rPasswordCode,
    )));
    final inputsFinder = find.bySubtype<RTextFormField>();
    final inputsFound = inputsFinder.evaluate();
    expect(inputsFound.length, 6);
    await tester.enterText(inputsFinder.at(0), "a");
    await tester.enterText(inputsFinder.at(1), "b");
    await tester.enterText(inputsFinder.at(2), "c");
    await tester.enterText(inputsFinder.at(3), "d");
    await tester.enterText(inputsFinder.at(4), "e");
    await tester.enterText(inputsFinder.at(5), "f");
    final lastTextFormField = tester.widget<RTextFormField>(inputsFinder.at(5));
    lastTextFormField.focusNode?.nextFocus();
    await tester.pumpAndSettle();
    expect(onCompleteValue, "abcdef");
  });
}
