import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/tooltip/tooltip.dart';

import '../../utils/widget_tester_extension.dart';

void main() {
  testWidgets('Tooltip simples é renderizado com mensagem', (tester) async {
    Key tooltipKey = const Key("tooltipTest");
    String message = "Tooltip simples";

    await tester.pumpMaterialComponent(
      RTooltip(
        key: tooltipKey,
        message: message,
        child: Icon(Icons.info),
      ),
    );

    final componentFinder = find.byKey(tooltipKey);
    expect(componentFinder, findsOneWidget);

    final childFinder = find.byIcon(Icons.info);
    expect(childFinder, findsOneWidget);
  });

  testWidgets('Rich Tooltip é renderizado com título e mensagem', (tester) async {
    Key tooltipKey = const Key("tooltipTest2");
    String title = "Título do Tooltip";
    String message = "Rich Tooltip";

    await tester.pumpMaterialComponent(
      RTooltip(
        key: tooltipKey,
        title: title,
        message: message,
        child: Icon(Icons.info),
      ),
    );

    final componentFinder = find.byKey(tooltipKey);
    expect(componentFinder, findsOneWidget);

    final childFinder = find.byIcon(Icons.info);
    expect(childFinder, findsOneWidget);
  });

  testWidgets('Tooltip mostra mensagem ao fazer hover', (tester) async {
    Key tooltipKey = const Key("tooltipTest3");
    String message = "Dica de hover";

    await tester.pumpMaterialComponent(
      RTooltip(
        key: tooltipKey,
        message: message,
        child: Container(
          width: 50,
          height: 50,
          color: Colors.blue,
        ),
      ),
    );

    final componentFinder = find.byKey(tooltipKey);
    expect(componentFinder, findsOneWidget);

    // Simula hover no tooltip
    final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await gesture.addPointer(location: Offset.zero);
    addTearDown(gesture.removePointer);
    await tester.pump();
    await gesture.moveTo(tester.getCenter(componentFinder));
    await tester.pump();

    // Aguarda o tooltip aparecer
    await tester.pump(const Duration(milliseconds: 500));

    final tooltipText = find.text(message);
    expect(tooltipText, findsOneWidget);
  });

  testWidgets('Tooltip com apenas título é renderizado', (tester) async {
    Key tooltipKey = const Key("tooltipTest4");
    String title = "Apenas título";
    String message = "Mensagem";

    await tester.pumpMaterialComponent(
      RTooltip(
        key: tooltipKey,
        title: title,
        message: message,
        child: Text('Elemento'),
      ),
    );

    final componentFinder = find.byKey(tooltipKey);
    expect(componentFinder, findsOneWidget);

    final textFinder = find.text('Elemento');
    expect(textFinder, findsOneWidget);
  });

  testWidgets('Tooltip sem texto não quebra', (tester) async {
    Key tooltipKey = const Key("tooltipTest5");
    final message = "Tooltip sem texto";

    await tester.pumpMaterialComponent(
      RTooltip(
        key: tooltipKey,
        message: message,
        child: Icon(Icons.star),
      ),
    );

    final componentFinder = find.byKey(tooltipKey);
    expect(componentFinder, findsOneWidget);

    final iconFinder = find.byIcon(Icons.star);
    expect(iconFinder, findsOneWidget);
  });
}
