import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/components/molecules/buttons/filled_button/filled_button.dart';

void main() {
  testWidgets('RFilledButton renders with text and responds to tap',
      (WidgetTester tester) async {
    bool wasTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RFilledButton(
            child: const Text('Tap me'),
            onPressed: () => wasTapped = true,
          ),
        ),
      ),
    );

    expect(find.text('Tap me'), findsOneWidget);
    await tester.tap(find.byType(FilledButton));
    expect(wasTapped, isTrue);
  });

  testWidgets('RFilledButton shows disabled state when onPressed is null',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RFilledButton(
            child: const Text('Disabled'),
            onPressed: null,
            disabledForegroundColor: Colors.grey,
          ),
        ),
      ),
    );

    final button = tester.widget<FilledButton>(find.byType(FilledButton));
    expect(button.onPressed, isNull);
    expect(find.text('Disabled'), findsOneWidget);
  });

  testWidgets('RFilledButton with icon renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RFilledButton(
            child: const Text('With Icon'),
            onPressed: () {},
            icon: Icons.check,
          ),
        ),
      ),
    );

    expect(find.text('With Icon'), findsOneWidget);
    expect(find.byIcon(Icons.check), findsOneWidget);
  });
}
