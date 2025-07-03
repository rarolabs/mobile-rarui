import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/badge/badge.dart';

import '../../utils/widget_tester_extension.dart';

void main() {
  testWidgets('Componente é renderizado com texto.', (tester) async {
    Key rBadgeKey = const Key("wTesting");
    String text = "42";

    await tester.pumpMaterialComponent(
      RBadge(
        key: rBadgeKey,
        text: text,
        textColor: Colors.white70,
        backgroundColor: Colors.amber,
        child: FlutterLogo(),
      ),
    );

    final componentFinder = find.byKey(rBadgeKey);
    expect(componentFinder, findsOneWidget);

    final findText = find.text(text);
    expect(findText, findsOneWidget);
  });

  testWidgets('Componente é renderizado sem o texto.', (tester) async {
    Key rBadgeKey = const Key("wTesting2");

    await tester.pumpMaterialComponent(
      RBadge(
        key: rBadgeKey,
        backgroundColor: Colors.blueAccent,
        child: FlutterLogo(
          size: 5,
        ),
      ),
    );

    final componentFinder = find.byKey(rBadgeKey);
    expect(componentFinder, findsOneWidget);

    final findText = find.text("text.empty");
    expect(findText, findsNothing);
  });
}
