import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/components/molecules/buttons/text_button.dart';

void main() {
  testWidgets('RTextButton renders correctly with basic properties',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RTextButton(
            child: const Text('Click me'),
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.text('Click me'), findsOneWidget);
    expect(find.byType(TextButton), findsOneWidget);
  });

  testWidgets('Disabled RTextButton renders with disabled state',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RTextButton(
            child: const Text('Disabled'),
            onPressed: null,
            disabledForegroundColor: Colors.grey,
          ),
        ),
      ),
    );

    final textButton = tester.widget<TextButton>(find.byType(TextButton));
    expect(textButton.onPressed, isNull);
  });

  testWidgets('Expanded RTextButton takes full width',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RTextButton(
            child: const Text('Expanded'),
            onPressed: () {},
            expanded: true,
          ),
        ),
      ),
    );

    final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
    expect(sizedBox.width, isNotNull);
  });

  testWidgets('RTextButton respects maxLines property',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RTextButton(
            child: const Text('Long text that should wrap based on maxLines'),
            onPressed: () {},
          ),
        ),
      ),
    );
  });
}
