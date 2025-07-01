import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/molecules/buttons/floating_action_button/floating_action_button.dart';

void main() {
  testWidgets('RFloatingActionButton renders and responds to tap',
      (WidgetTester tester) async {
    bool wasTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          floatingActionButton: RFloatingActionButton(
            onPressed: () => wasTapped = true,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );

    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
    await tester.tap(find.byType(FloatingActionButton));
    expect(wasTapped, isTrue);
  });

  testWidgets('RFloatingActionButton shows disabled state',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          floatingActionButton: RFloatingActionButton(
            onPressed: null,
            child: const Icon(Icons.add),
            disabledForegroundColor: Colors.grey,
          ),
        ),
      ),
    );

    final fab =
        tester.widget<FloatingActionButton>(find.byType(FloatingActionButton));
    expect(fab.onPressed, isNull);
  });

  testWidgets('RFloatingActionButton applies custom colors',
      (WidgetTester tester) async {
    const testBgColor = Colors.red;
    const testFgColor = Colors.white;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          floatingActionButton: RFloatingActionButton(
            onPressed: () {},
            backgroundColor: testBgColor,
            foregroundColor: testFgColor,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );

    final fab =
        tester.widget<FloatingActionButton>(find.byType(FloatingActionButton));
    expect(fab.backgroundColor, testBgColor);
    expect(fab.foregroundColor, testFgColor);
  });
}
