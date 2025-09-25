import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/components/atoms/divider/divider.dart';

void main() {
  group('RDivider Tests', () {
    testWidgets('Should render horizontal Divider with default values',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RDivider(),
          ),
        ),
      );

      expect(find.byType(Divider), findsOneWidget);
      expect(find.byType(VerticalDivider), findsNothing);

      final divider = tester.widget<Divider>(find.byType(Divider));
      expect(divider.thickness, null);
      expect(divider.height, null);
    });

    testWidgets('Should render horizontal Divider with custom properties',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RDivider(
              thickness: 2.0,
              height: 20.0,
              color: Colors.red,
            ),
          ),
        ),
      );

      final divider = tester.widget<Divider>(find.byType(Divider));
      expect(divider.thickness, 2.0);
      expect(divider.height, 20.0);
      expect(divider.color, Colors.red);
    });

    testWidgets('Should render vertical Divider when isVertical is true',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RDivider(
              isVertical: true,
            ),
          ),
        ),
      );

      expect(find.byType(VerticalDivider), findsOneWidget);
      expect(find.byType(Divider), findsNothing);
    });

    testWidgets('Should render vertical Divider with custom properties',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RDivider(
              isVertical: true,
              width: 10.0,
              thickness: 3.0,
              color: Colors.blue,
            ),
          ),
        ),
      );

      final verticalDivider =
          tester.widget<VerticalDivider>(find.byType(VerticalDivider));
      expect(verticalDivider.width, 10.0);
      expect(verticalDivider.thickness, 3.0);
      expect(verticalDivider.color, Colors.blue);
    });

    testWidgets('Should use theme color when color is not specified',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(dividerColor: Colors.green),
          home: const Scaffold(
            body: RDivider(),
          ),
        ),
      );

      final divider = tester.widget<Divider>(find.byType(Divider));
      expect(divider.color, Colors.green);
    });

    testWidgets('Should prioritize custom color over theme color',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(dividerColor: Colors.green),
          home: const Scaffold(
            body: RDivider(
              color: Colors.purple,
            ),
          ),
        ),
      );

      final divider = tester.widget<Divider>(find.byType(Divider));
      expect(divider.color, Colors.purple);
    });
  });
}
