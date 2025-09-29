import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/components/molecules/shortcut/shortcut.dart';

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
