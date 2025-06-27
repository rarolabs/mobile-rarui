import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/checkbox/checkbox.dart';

void main() {
  testWidgets('RCheckbox deve renderizar com valor inicial falso', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RCheckbox(
            key: const Key('rcheckbox'),
            initialValue: false,
          ),
        ),
      ),
    );

    final checkboxFinder = find.byType(Checkbox);
    expect(checkboxFinder, findsOneWidget);

    final checkbox = tester.widget<Checkbox>(checkboxFinder);
    expect(checkbox.value, isFalse);
  });

  testWidgets('RCheckbox deve renderizar com valor inicial verdadeiro', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RCheckbox(
            key: const Key('rcheckbox'),
            initialValue: true,
          ),
        ),
      ),
    );

    final checkboxFinder = find.byType(Checkbox);
    expect(checkboxFinder, findsOneWidget);

    final checkbox = tester.widget<Checkbox>(checkboxFinder);
    expect(checkbox.value, isTrue);
  });

  testWidgets('RCheckbox deve chamar onChanged ao ser pressionado', (tester) async {
    bool? checked;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RCheckbox(
            key: const Key('rcheckbox'),
            initialValue: false,
            onChanged: (value) {
              checked = value;
            },
          ),
        ),
      ),
    );

    await tester.tap(find.byType(Checkbox));
    await tester.pumpAndSettle();

    expect(checked, isTrue);
  });

  testWidgets('RCheckbox deve aplicar as propriedades visuais corretamente', (tester) async {
    const borderColor = Colors.red;
    const checkColor = Colors.green;
    const activeColor = Colors.blue;
    const shape = RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)));
    const visualDensity = VisualDensity(horizontal: 2, vertical: 2);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RCheckbox(
            key: const Key('rcheckbox'),
            initialValue: false,
            borderColor: borderColor,
            checkColor: checkColor,
            activeColor: activeColor,
            shape: shape,
            visualDensity: visualDensity,
            onChanged: (_) {},
          ),
        ),
      ),
    );

    final checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
    expect(checkbox.checkColor, checkColor);
    expect(checkbox.activeColor, activeColor);
    expect(checkbox.shape, shape);
    expect(checkbox.visualDensity, visualDensity);

    final side = checkbox.side as BorderSide;
    expect(side.color, borderColor);
  });

  testWidgets('RCheckbox deve aplicar cor de borda padrão quando desabilitado', (tester) async {
    const borderColor = Colors.red;
    const checkColor = Colors.green;
    const activeColor = Colors.blue;
    const shape = RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)));
    const visualDensity = VisualDensity(horizontal: 2, vertical: 2);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RCheckbox(
            key: const Key('rcheckbox'),
            initialValue: false,
            borderColor: borderColor,
            checkColor: checkColor,
            activeColor: activeColor,
            shape: shape,
            visualDensity: visualDensity,
            onChanged: null,
          ),
        ),
      ),
    );

    final checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
    expect(checkbox.checkColor, null);
    expect(checkbox.activeColor, activeColor);
    expect(checkbox.shape, shape);
    expect(checkbox.visualDensity, visualDensity);

    final side = checkbox.side as BorderSide;
    final BuildContext context = tester.element(find.byType(Checkbox));
    final Color expectedColor = Theme.of(context).unselectedWidgetColor;
    expect(side.color, expectedColor);
  });

  testWidgets('RCheckbox deve ficar desabilitado quando onChanged for null', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RCheckbox(
            key: const Key('rcheckbox'),
            initialValue: false,
            onChanged: null,
          ),
        ),
      ),
    );

    final checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
    expect(checkbox.onChanged, isNull);

    // Tenta clicar no checkbox e verifica se o estado não muda
    await tester.tap(find.byType(Checkbox));
    await tester.pumpAndSettle();

    final checkboxAfterTap = tester.widget<Checkbox>(find.byType(Checkbox));
    expect(checkboxAfterTap.value, isFalse);
  });
}
