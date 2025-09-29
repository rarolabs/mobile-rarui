import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/components/molecules/buttons/icon_button.dart';

void main() {
  testWidgets('RIconButton renders with basic properties',
      (WidgetTester tester) async {
    bool wasTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RIconButton(
            icon: Icons.favorite,
            onPressed: () => wasTapped = true,
            size: 24,
            iconColor: Colors.red,
          ),
        ),
      ),
    );

    final icon = tester.widget<Icon>(find.byType(Icon));
    expect(icon.icon, Icons.favorite);
    expect(icon.size, 24);
    expect(icon.color, Colors.red);

    await tester.tap(find.byType(IconButton));
    expect(wasTapped, isTrue);
  });

  testWidgets('RIconButton shows disabled state', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RIconButton(
            icon: Icons.star,
            onPressed: null,
            disabledColor: Colors.grey,
          ),
        ),
      ),
    );

    final iconButton = tester.widget<IconButton>(find.byType(IconButton));
    expect(iconButton.onPressed, isNull);
    expect(iconButton.disabledColor, Colors.grey);
  });

  testWidgets('RIconButton applies background color and padding',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RIconButton(
            icon: Icons.settings,
            onPressed: () {},
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.all(12),
          ),
        ),
      ),
    );

    final iconButton = tester.widget<IconButton>(find.byType(IconButton));
    expect(iconButton.style?.backgroundColor?.resolve({}), Colors.blue);
    expect(iconButton.padding, const EdgeInsets.all(12));
  });
}
