import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/molecules/buttons/text_button.dart';

void main() {
  testWidgets('RTextButton renders correctly with basic properties',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RTextButton(
            text: 'Click me',
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.text('Click me'), findsOneWidget);
    expect(find.byType(TextButton), findsOneWidget);
  });

  testWidgets('RTextButton with icon renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RTextButton(
            text: 'Icon Button',
            onPressed: () {},
            icon: Icons.add,
          ),
        ),
      ),
    );

    expect(find.text('Icon Button'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });

  testWidgets('Disabled RTextButton renders with disabled state',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RTextButton(
            text: 'Disabled',
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
            text: 'Expanded',
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
            text: 'Long text that should wrap based on maxLines',
            onPressed: () {},
            maxLines: 2,
          ),
        ),
      ),
    );

    final textWidget = tester.widget<Text>(find.byType(Text));
    expect(textWidget.maxLines, 2);
  });
}
