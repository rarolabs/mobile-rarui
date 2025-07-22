import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/molecules/shortcut/shortcut.dart';

void main() {
  group('RShortcut Tests', () {
    testWidgets('Should render with icon and text',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RShortcut(
              icon: Icons.star,
              text: 'Favorite',
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.text('Favorite'), findsOneWidget);
      expect(find.byType(Material), findsOneWidget);
    });

    testWidgets('Should use theme colors when custom colors not provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.light(primary: Colors.blue),
            cardColor: Colors.white,
          ),
          home: Scaffold(
            body: RShortcut(
              icon: Icons.settings,
              text: 'Settings',
            ),
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byType(Icon));
      expect(icon.color, Colors.blue);

      final material = tester.widget<Material>(find.byType(Material));
      expect(material.color, Colors.white);
    });

    testWidgets('Should use custom colors when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RShortcut(
              icon: Icons.person,
              text: 'Profile',
              backgroundColor: Colors.black,
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byType(Icon));
      expect(icon.color, Colors.white);

      final material = tester.widget<Material>(find.byType(Material));
      expect(material.color, Colors.black);
    });

    testWidgets('Should handle tap events', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RShortcut(
              icon: Icons.add,
              text: 'Add',
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(InkWell));
      expect(tapped, isTrue);
    });
  });
}
