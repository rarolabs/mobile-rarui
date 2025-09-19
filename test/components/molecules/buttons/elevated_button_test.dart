import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/molecules/buttons/elevated_button.dart';

void main() {
  testWidgets('RElevatedButton renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RElevatedButton(
            child: const Text('Test Button'),
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.text('Test Button'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('RElevatedButton with icon renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RElevatedButton(
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

  testWidgets('Disabled RElevatedButton renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RElevatedButton(
            child: const Text('Disabled Button'),
            onPressed: null,
          ),
        ),
      ),
    );

    expect(find.text('Disabled Button'), findsOneWidget);
    final elevatedButton =
        tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(elevatedButton.onPressed, isNull);
  });

  testWidgets('Expanded RElevatedButton takes full width',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RElevatedButton(
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
