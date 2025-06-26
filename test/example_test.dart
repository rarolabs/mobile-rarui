import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Example test', (WidgetTester tester) async {
    await tester.pumpWidget(Container());

    expect(true, true);
  });
}
