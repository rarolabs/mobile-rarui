import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/molecules/buttons/outlined_button.dart';

void main() {
  testWidgets('ROutlinedButton renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ROutlinedButton(
            child: const Text('Test Button'),
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.text('Test Button'), findsOneWidget);
    expect(find.byType(OutlinedButton), findsOneWidget);
  });

  testWidgets('ROutlinedButton with icon renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ROutlinedButton(
            child: const Text('Icon Button'),
            onPressed: () {},
            icon: Icons.add,
          ),
        ),
      ),
    );

    expect(find.text('Icon Button'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });

  testWidgets('Disabled ROutlinedButton renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ROutlinedButton(
            child: const Text('Disabled Button'),
            onPressed: null,
          ),
        ),
      ),
    );

    expect(find.text('Disabled Button'), findsOneWidget);
    final outlinedButton =
        tester.widget<OutlinedButton>(find.byType(OutlinedButton));
    expect(outlinedButton.onPressed, isNull);
  });

  testWidgets('Expanded ROutlinedButton takes full width',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ROutlinedButton(
            child: const Text('Expanded Button'),
            onPressed: () {},
            expanded: true,
          ),
        ),
      ),
    );

    final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
    expect(sizedBox.width, isNotNull);
  });
}
