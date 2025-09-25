import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarui/components/molecules/buttons/filled_button/filled_button_tonal.dart';

void main() {
  testWidgets('RFilledButtonTonal renders with text and responds to tap',
      (WidgetTester tester) async {
    bool wasTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RFilledButtonTonal(
            child: const Text('Tonal Button'),
            onPressed: () => wasTapped = true,
          ),
        ),
      ),
    );

    expect(find.text('Tonal Button'), findsOneWidget);
    expect(find.byType(FilledButton), findsOneWidget);
    await tester.tap(find.byType(FilledButton));
    expect(wasTapped, isTrue);
  });

  testWidgets('RFilledButtonTonal shows disabled state correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RFilledButtonTonal(
            child: const Text('Disabled Tonal'),
            onPressed: null,
            disabledForegroundColor: Colors.grey,
          ),
        ),
      ),
    );

    final button = tester.widget<FilledButton>(find.byType(FilledButton));
    expect(button.onPressed, isNull);
    expect(find.text('Disabled Tonal'), findsOneWidget);
  });

  testWidgets('RFilledButtonTonal with icon renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RFilledButtonTonal(
            child: const Text('Tonal with Icon'),
            onPressed: () {},
            icon: Icons.add,
          ),
        ),
      ),
    );

    expect(find.text('Tonal with Icon'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
