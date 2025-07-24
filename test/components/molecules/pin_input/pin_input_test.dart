import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/rarui.dart';

void main() {
  testWidgets('RPinInput renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RPinInput(
            formKey: GlobalKey<FormState>(),
            onComplete: (_) {},
            length: 5,
          ),
        ),
      ),
    );

    expect(find.byType(RPinInput), findsOneWidget);
    expect(find.byType(Form), findsOneWidget);
    expect(find.byType(Row), findsOneWidget);
    expect(find.byType(RTextFormField), findsNWidgets(5));
  });
}
