import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/molecules/buttons/floating_action_button/floating_action_button_extended.dart';

void main() {
  testWidgets('RFloatingActionButtonExtended renders with text',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          floatingActionButton: RFloatingActionButtonExtended(
            child: const Text('Extended FAB'),
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.text('Extended FAB'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('RFloatingActionButtonExtended with icon renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          floatingActionButton: RFloatingActionButtonExtended(
            child: const Text('Create'),
            onPressed: () {},
            icon: Icons.add,
          ),
        ),
      ),
    );

    expect(find.text('Create'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('RFloatingActionButtonExtended handles disabled state',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          floatingActionButton: RFloatingActionButtonExtended(
            child: const Text('Disabled'),
            onPressed: null,
            disabledForegroundColor: Colors.grey,
          ),
        ),
      ),
    );

    final fab =
        tester.widget<FloatingActionButton>(find.byType(FloatingActionButton));
    expect(fab.onPressed, isNull);
    expect((fab.foregroundColor as MaterialColor?)?.shade500,
        Colors.grey.shade500);
  });
}
